//
// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:uuid/uuid.dart';
// import '../constants/app_constants.dart';
// import '../data/models/response/login_response.dart';
// import '../utils/api_cache_manager.dart';
// import '../view/screens/auth/forgetpassword_screen.dart';
// import '../view/screens/dashboard/dashboard_screen.dart';
// import '../view/screens/parents/parents_screen.dart';
// import '../view/screens/teacher/teacher_screen.dart';
// class LoginService {
//   static const String baseUrl = "$apiBaseUrl$academicPrefix";
//
//   // **Login API Function**
//   static Future<String> fetchLoginResponse({
//     String? username,
//     String? password,
//     required int? schoolId,
//     required String type,
//   }) async {
//     final url = Uri.parse(
//         'https://www.sutramsol.in/ssapigw-dev/auth-dev/api/v1/auth/login');
//
//     final Map<String, dynamic> requestBody = {
//       "username": username,
//       "password": password,
//       "schoolId": schoolId
//     };
//
//     try {
//       final headers = await getHeaders();
//       final response = await http.post(
//         url,
//         headers: headers,
//         body: jsonEncode(requestBody),
//       );
//
//       if (response.statusCode == 200) {
//         Map<String, dynamic> responseData = jsonDecode(response.body);
//         print("Decoded JSON: ${response.body}");
//
//         // Check if user is activated first
//         if (responseData["user"]["activated"] == true) {
//           bool? passwordChanged = await Get.to(() => ChangePassword());
//
//           if (passwordChanged != true) {
//             // If password change wasn't successful, don't proceed
//             return "Please change your password to continue";
//           }
//           // If passwordChanged is true, we'll continue with the login process
//           _navigateBasedOnType(type);
//         }
//
//         // Only proceed with saving data and navigation if activated is true
//         // or password change was successful
//         if (type == TEACHER) {
//           await ApiCacheManager().saveClassMappings(responseData);
//         }
//
//         // Save user details in SharedPreferences
//         if (responseData["user"] != null) {
//           SharedPreferences prefs = await SharedPreferences.getInstance();
//           await prefs.setString('username', username ?? "No username");
//           await prefs.setString('type', type);
//           await prefs.setString('user', jsonEncode(responseData));
//           await prefs.setString('userId', "${responseData["user"]["userId"] ?? ""}");
//
//           int? studentId = responseData["user"]["studentId"];
//           if (studentId != null) {
//             await prefs.setInt('studentId', studentId);
//           }
//
//           int? studentGradeId = responseData["user"]["gradeId"];
//           if (studentGradeId != null) {
//             await prefs.setInt('gradeId', studentGradeId);
//           }
//
//           int? studentSectionId = responseData["user"]["sectionId"];
//           if (studentSectionId != null) {
//             await prefs.setInt('sectionId', studentSectionId);
//           }
//
//           int? teacherId = responseData["user"]["teacherId"];
//           if (teacherId != null) {
//             await prefs.setInt('teacherId', teacherId);
//           }
//           //This data save for only use edit profiled value update
//
//           String? fasename = responseData["user"]["firstName"];
//           if (fasename != null) {
//             await prefs.setString('firstName', fasename);
//           }
//
//           String? lastName = responseData["user"]["lastName"];
//           if (lastName != null) {
//             await prefs.setString('lastName', lastName);
//           }
//           String? email = responseData["user"]["email"];
//           if (email != null) {
//             await prefs.setString('email', email);
//           }
//
//         }
//         print("User ID: ${responseData["user"]["userId"]}");
//
//         // Save class & section details
//         await saveClassAndSection(responseData);
//
//         // Get FCM Token
//         // String? fcmToken = await getFcmToken();
//         // print("User FCM Token: $fcmToken");
//
//         // Navigate based on type
//         _navigateBasedOnType(type,);
//
//         return responseData['message'] ?? "Login successful";
//       } else {
//         Map<String, dynamic> responseData = jsonDecode(response.body);
//         print("Error Response: ${response.body}");
//         return  responseData['Invalidate user and password'] ?? "Unknown error";
//       }
//     } catch (e) {
//       print("Error in login: $e");
//       return "An unexpected error occurred: $e";
//     }
//   }
//   // **Save Class & Section Details**
//   static Future<void> saveClassAndSection(Map<String, dynamic> jsonData) async {
//     try {
//       if (jsonData['user'] != null &&
//           jsonData['user']['classMappings'] != null) {
//         final classMappings = jsonData['user']['classMappings'] as Map<String, dynamic>;
//
//         for (String key in classMappings.keys) {
//           final parts = key.split(':');
//           if (parts.length >= 3) {
//             String className = parts[1];
//             String section = parts[2];
//
//             SharedPreferences prefs = await SharedPreferences.getInstance();
//             await prefs.setString('class', className);
//             await prefs.setString('section', section);
//
//             print('Class: $className, Section: $section saved in SharedPreferences');
//           } else {
//             print("Invalid key format: $key");
//           }
//         }
//       } else {
//         print("No 'classMappings' found in response.");
//       }
//     } catch (e) {
//       print("Error while saving class and section: $e");
//     }
//   }
//
//   // **Get FCM Token**
//   // static Future<String?> getFcmToken() async {
//   //   String? token = await FirebaseMessaging.instance.getToken();
//   //   print("FCM Token: $token");
//   //   return token;
//   // }
//
//   // **Navigation Function**
//   static void _navigateBasedOnType(String type, /*Map<String, dynamic> jsonData*/) {
//     switch (type.toLowerCase()) {
//       case 'student':
//         Get.offAll(() => DashboardScreen());
//         break;
//       case 'parent':
//         Get.offAll(() => ParentsScreen());
//         break;
//       default:
//         Get.offAll(() => TeacherScreen(
//           // loginResponse: LoginResponse.fromJson(/*jsonData*/),
//         ));
//
//     // Get.offAll(() => TeacherScreen(loginResponse: jsonData));
//     }
//   }
//
//   // **Get Headers for API Requests**
//   static Future<Map<String, String>> getHeaders() async {
//     var correlationObject = {
//       'correlation-id': Uuid().v4(),
//     };
//
//     return {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer <YOUR_ACCESS_TOKEN>',
//       'X-Correlation-Id': jsonEncode(correlationObject),
//       "Sec-CH-UA-Mobile": Platform.isAndroid || Platform.isIOS ? "1" : "0",
//       "Sec-CH-UA-Platform": Platform.operatingSystem,
//       "Sec-CH-UA-Platform-Version": Platform.operatingSystemVersion,
//     };
//   }
// }


import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import '../constants/app_constants.dart';
import '../data/models/response/login_response.dart';
import '../utils/api_cache_manager.dart';
import '../view/screens/auth/forgetpassword_screen.dart';
import '../view/screens/dashboard/dashboard_screen.dart';
import '../view/screens/parents/parents_screen.dart';
import '../view/screens/teacher/teacher_screen.dart';
class LoginService {
  static const String baseUrl = "$apiBaseUrl$academicPrefix";

  // **Login API Function**
  static Future<String> fetchLoginResponse({
    String? username,
    String? password,
    required int? schoolId,
    required String type,
  }) async {
    final url = Uri.parse(
        'https://www.sutramsol.in/ssapigw-dev/auth-dev/api/v1/auth/login');

    final Map<String, dynamic> requestBody = {
      "username": username,
      "password": password,
      "schoolId": schoolId
    };

    try {
      final headers = await getHeaders();
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        print("Decoded JSON: ${response.body}");

        // Check if user is activated first
        if (responseData["user"]["activated"] == true) {
          bool? passwordChanged = await Get.to(() => ChangePassword());

          if (passwordChanged != true) {
            // If password change wasn't successful, don't proceed
            return "Please change your password to continue";
          }
          // If passwordChanged is true, we'll continue with the login process
          _navigateBasedOnType(type);
        }

        // Only proceed with saving data and navigation if activated is true
        // or password change was successful
        if (type == TEACHER) {
          await ApiCacheManager().saveClassMappings(responseData);
        }

        // Save user details in SharedPreferences
        if (responseData["user"] != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('username', username ?? "No username");
          await prefs.setString('type', type);
          await prefs.setString('user', jsonEncode(responseData));
          await prefs.setString('userId', "${responseData["user"]["userId"] ?? ""}");

          int? studentId = responseData["user"]["studentId"];
          if (studentId != null) {
            await prefs.setInt('studentId', studentId);
          }

          int? studentGradeId = responseData["user"]["gradeId"];
          if (studentGradeId != null) {
            await prefs.setInt('gradeId', studentGradeId);
          }

          int? studentSectionId = responseData["user"]["sectionId"];
          if (studentSectionId != null) {
            await prefs.setInt('sectionId', studentSectionId);
          }

          int? teacherId = responseData["user"]["teacherId"];
          if (teacherId != null) {
            await prefs.setInt('teacherId', teacherId);
          }
          //This data save for only use edit profiled value update

          String? fasename = responseData["user"]["firstName"];
          if (fasename != null) {
            await prefs.setString('firstName', fasename);
          }

          String? lastName = responseData["user"]["lastName"];
          if (lastName != null) {
            await prefs.setString('lastName', lastName);
          }
          String? email = responseData["user"]["email"];
          if (email != null) {
            await prefs.setString('email', email);
          }

        }
        print("User ID: ${responseData["user"]["userId"]}");

        // Save class & section details
        await saveClassAndSection(responseData);

        // Get FCM Token
        // String? fcmToken = await getFcmToken();
        // print("User FCM Token: $fcmToken");

        // Navigate based on type
        _navigateBasedOnType(type,);

        return responseData['message'] ?? "Login successful";
      } else {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        print("Error Response: ${response.body}");
        return  responseData['message'] ?? "Unknown error";
      }
    } catch (e) {
      print("Error in login: $e");
      return "Invalid username or password";
    }
  }
  // **Save Class & Section Details**
  static Future<void> saveClassAndSection(Map<String, dynamic> jsonData) async {
    try {
      if (jsonData['user'] != null &&
          jsonData['user']['classMappings'] != null) {
        final classMappings = jsonData['user']['classMappings'] as Map<String, dynamic>;

        for (String key in classMappings.keys) {
          final parts = key.split(':');
          if (parts.length >= 3) {
            String className = parts[1];
            String section = parts[2];

            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('class', className);
            await prefs.setString('section', section);

            print('Class: $className, Section: $section saved in SharedPreferences');
          } else {
            print("Invalid key format: $key");
          }
        }
      } else {
        print("No 'classMappings' found in response.");
      }
    } catch (e) {
      print("Error while saving class and section: $e");
    }
  }

  // **Get FCM Token**
  // static Future<String?> getFcmToken() async {
  //   String? token = await FirebaseMessaging.instance.getToken();
  //   print("FCM Token: $token");
  //   return token;
  // }

  // **Navigation Function**
  static void _navigateBasedOnType(String type, /*Map<String, dynamic> jsonData*/) {
    switch (type.toLowerCase()) {
      case 'student':
        Get.offAll(() => DashboardScreen());
        break;
      case 'parent':
        Get.offAll(() => ParentsScreen());
        break;
      default:
        Get.offAll(() => TeacherScreen(
          // loginResponse: LoginResponse.fromJson(/*jsonData*/),
        ));

    // Get.offAll(() => TeacherScreen(loginResponse: jsonData));
    }
  }

  // **Get Headers for API Requests**
  static Future<Map<String, String>> getHeaders() async {
    var correlationObject = {
      'correlation-id': Uuid().v4(),
    };

    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer <YOUR_ACCESS_TOKEN>',
      'X-Correlation-Id': jsonEncode(correlationObject),
      "Sec-CH-UA-Mobile": Platform.isAndroid || Platform.isIOS ? "1" : "0",
      "Sec-CH-UA-Platform": Platform.operatingSystem,
      "Sec-CH-UA-Platform-Version": Platform.operatingSystemVersion,
    };
  }
}