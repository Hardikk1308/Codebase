// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:uuid/uuid.dart';
// import '../api/api_util.dart';
// import '../constants/app_constants.dart';
//
// class ForgetPasswordService {
//
//   // Change Password API Call
//   static Future<bool> changePassword({
//     required String? username,
//     required String oldPassword,
//     required String newPassword,
//     required String confirmPassword,
//     required int? schoolId,
//   }) async {
//
//     // final url = Uri.parse('$apiBaseUrl/$academicPrefix/auth/change-password');
//
//     final url = Uri.parse('https://www.sutramsol.in/ssapigw-dev/auth-dev/api/v1/auth/change-password');
//     final Map<String, dynamic> requestBody = {
//       "username": "SH1NR000S3",
//       "oldPassword": oldPassword,
//       "newPassword": newPassword,
//       "confirmPassword": confirmPassword,
//       "schoolId": schoolId
//     };
//
//     try {
//       // Getting headers from ApiUtil class
//       // final headers = await ApiUtil.getHeaders();
//        Future<Map<String, String>> getHeaders() async {
//         var correlationObject = {
//           'correlation-id': Uuid().v4(),  // Generate UUID
//           // 'timestamp': DateTime.now().millisecondsSinceEpoch,  // Current timestamp in milliseconds
//         };
//
//         return {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer YOUR_ACCESS_TOKEN',
//           'X-Correlation-Id': jsonEncode(correlationObject),
//           "Sec-CH-UA-Mobile": Platform.isAndroid || Platform.isIOS ? "1" : "0",
//           "Sec-CH-UA-Platform": Platform.operatingSystem,
//           "Sec-CH-UA-Platform-Version": Platform.operatingSystemVersion,
//           // "Sec-CH-UA-Platform-Version": Platform.numberOfProcessors,
//           // "X-Android-Version": androidVersion,
//         };
//       }
//       // Now passing correct headers and body
//       final response = await http.post(
//         url,
//         headers: getHeaders,
//         body: jsonEncode(requestBody),
//       );
//
//       if (response.statusCode == 200) {
//         print("Password changed successfully: ${response.body}");
//         return true;
//       } else {
//         print("Failed to change password: ${response.statusCode} - ${response.body}");
//         return false;
//       }
//     } catch (e) {
//       print("Error: $e");
//       return false;
//     }
//   }
// }
 /// correct code
// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:uuid/uuid.dart';
//
// class ForgetPasswordService {
//   // Change Password API Call
//   static Future<Object> changePassword({
//     required String? username,
//     required String oldPassword,
//     required String newPassword,
//     required String confirmPassword,
//     required int? schoolId,
//   }) async {
//     final url = Uri.parse('https://www.sutramsol.in/ssapigw-dev/auth-dev/api/v1/auth/change-password');
//
//     final Map<String, dynamic> requestBody = {
//       "username": username,
//       "oldPassword": oldPassword,
//       "newPassword": newPassword,
//       "confirmPassword": confirmPassword,
//       "schoolId": schoolId
//     };
//
//     try {
//       // Corrected headers function
//       final headers = await getHeaders(); // ✅ Await the function
//
//       // Await the HTTP request
//       final response = await http.post(
//         url,
//         headers: headers,
//         body: jsonEncode(requestBody),
//       );
//
//       if (response.statusCode == 200) {
//         print(" Password changed successfully: ${response.body}");
//         return true;
//       } else {
//         // 🔥 Extract error message from response body
//         Map<String, dynamic> responseData = jsonDecode(response.body);
//         return " Failed: ${responseData['message'] ?? 'Unknown error'}";
//         return false;
//       }
//     } catch (e) {
//       print(" Error: $e");
//       return false;
//     }
//   }
//
//   // ✅ Corrected getHeaders function
//   static Future<Map<String, String>> getHeaders() async {
//     var correlationObject = {
//       'correlation-id': Uuid().v4(),
//     };
//
//     // String token = await getAccessToken(); // ✅ Await used correctly
//
//     return {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJTSDFOUjAwMFMzIiwiaXNzIjoiW1JPTEVfU1RVREVOVF0iLCJpYXQiOjE3NDA0NzA5OTAsImV4cCI6MTc0MDU1NzM5MH0.9TyaoP0hjbdYBYzEwOPE5Y1LRmRvxS11d_Z0IQ918Vw',
//       'X-Correlation-Id': jsonEncode(correlationObject),
//       "Sec-CH-UA-Mobile": Platform.isAndroid || Platform.isIOS ? "1" : "0",
//       "Sec-CH-UA-Platform": Platform.operatingSystem,
//       "Sec-CH-UA-Platform-Version": Platform.operatingSystemVersion,
//     };
//   }
// }
//
// import 'dart:convert';
// import 'dart:io';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:http/http.dart' as http;
// import 'package:uuid/uuid.dart';
//
// class ChangePasswordService {
//   // Change Password API Call
//   static Future<String> changePassword({
//     required String? username,
//     required String oldPassword,
//     required String newPassword,
//     required String confirmPassword,
//     required int? schoolId,
//   }) async {
//     final url = Uri.parse('https://www.sutramsol.in/ssapigw-dev/auth-dev/api/v1/auth/change-password');
//
//     final Map<String, dynamic> requestBody = {
//       "username": username,
//       "oldPassword": oldPassword,
//       "newPassword": newPassword,
//       "confirmPassword": confirmPassword,
//       "schoolId": schoolId
//     };
//
//     try {
//       // Corrected headers function
//       final headers = await getHeaders();
//
//       // Await the HTTP request
//       final response = await http.post(
//         url,
//         headers: headers,
//         body: jsonEncode(requestBody),
//       );
//
//       if (response.statusCode == 200) {
//         print("Password changed successfully: ${response.body}");
//         Get.back(result: true);
//
//         return "Password changed successfully!";
//       } else {
//         // Extract error message from response body
//         Map<String, dynamic> responseData = jsonDecode(response.body);
//         return "Failed: ${responseData['message'] ?? 'Unknown error'}";
//       }
//     } catch (e) {
//       print("Error: $e");
//       return "An unexpected error occurred: $e";
//     }
//   }
//
//   // Corrected getHeaders function
//   static Future<Map<String, String>> getHeaders() async {
//     var correlationObject = {
//       'correlation-id': Uuid().v4(),
//     };
//
//     return {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJTSDFOUjAwMFMzIiwiaXNzIjoiW1JPTEVfU1RVREVOVF0iLCJpYXQiOjE3NDA0NzA5OTAsImV4cCI6MTc0MDU1NzM5MH0.9TyaoP0hjbdYBYzEwOPE5Y1LRmRvxS11d_Z0IQ918Vw',
//       'X-Correlation-Id': jsonEncode(correlationObject),
//       "Sec-CH-UA-Mobile": Platform.isAndroid || Platform.isIOS ? "1" : "0",
//       "Sec-CH-UA-Platform": Platform.operatingSystem,
//       "Sec-CH-UA-Platform-Version": Platform.operatingSystemVersion,
//     };
//   }
// }


import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class ChangePasswordService {
  // Change Password API Call
  static Future<String> changePassword({
    required String? username,
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
    required int? schoolId,
  }) async {
    final url = Uri.parse('https://www.sutramsol.in/ssapigw-dev/auth-dev/api/v1/auth/change-password');

    final Map<String, dynamic> requestBody = {
      "username": username,
      "oldPassword": oldPassword,
      "newPassword": newPassword,
      "confirmPassword": confirmPassword,
      "schoolId": schoolId
    };

    try {
      // Corrected headers function
      final headers = await getHeaders();

      // Await the HTTP request
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(requestBody),
      );
      print("print url $url");
      if (response.statusCode == 200) {
        print("Password changed successfully: ${response.body}");
        Get.back(result: true);

        return "Password changed successfully!";
      } else {
        // Extract error message from response body
        Map<String, dynamic> responseData = jsonDecode(response.body);
        print("print error ${response.body}");
        return "Failed: ${responseData['message'] ?? 'Unknown error'}";
      }
    } catch (e) {
      print("Error: $e");
      return "An unexpected error occurred: $e";
    }
  }

  // Corrected getHeaders function
  static Future<Map<String, String>> getHeaders() async {
    var correlationObject = {
      'correlation-id': Uuid().v4(),
    };

    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJTSDFOUjAwMFMzIiwiaXNzIjoiW1JPTEVfU1RVREVOVF0iLCJpYXQiOjE3NDA0NzA5OTAsImV4cCI6MTc0MDU1NzM5MH0.9TyaoP0hjbdYBYzEwOPE5Y1LRmRvxS11d_Z0IQ918Vw',
      'X-Correlation-Id': jsonEncode(correlationObject),
      "Sec-CH-UA-Mobile": Platform.isAndroid || Platform.isIOS ? "1" : "0",
      "Sec-CH-UA-Platform": Platform.operatingSystem,
      "Sec-CH-UA-Platform-Version": Platform.operatingSystemVersion,
    };
  }
}
