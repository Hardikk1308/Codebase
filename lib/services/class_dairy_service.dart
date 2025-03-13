// import 'dart:convert';
// import 'package:erp_school/api/api_util.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:uuid/uuid.dart';
//
// import 'School_service.dart';
//
// class ClassDairyService {
//   // URL for the API endpoint
//   static final String url = 'https://sutramsol.in/academic-service-dev/api/v1/classdairy/save';
//
//   // Method to get headers
//   static Future<Map<String, String>> getHeaders() async {
//     var correlationObject = {
//       'correlation-id': Uuid().v4(), // Generate UUID
//       'timestamp': DateTime.now().millisecondsSinceEpoch.toString(), // Current timestamp in milliseconds
//     };
//
//     return {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer YOUR_ACCESS_TOKEN', // Replace with actual token
//       'X-Correlation-Object': jsonEncode(correlationObject), // Add correlation object
//     };
//   }
//
//   // Static method to save class dairy data
//   static Future<bool> saveClassDairyService(List<ClassDairyServiceRequestDTO> classDairyList) async {
//     try {
//       // Create a ClassDairyServiceRequest instance
//       final classDairyRequest = ClassDairyServiceRequestDTO(classDairyDTOs: classDairyList);
//
//       // Making the POST request
//       final response = await ApiUtil.postRequest(url, classDairyRequest.toJson());
//       print('Response Body:--> ${ClassDairyServiceRequestDTO}');
//
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         // If successful, return true
//         return true;
//       } else {
//         // If there is an error, print the error and return false
//         print('Error: ${response.body}');
//         return false;
//       }
//     } catch (e) {
//       // Catch and print any exceptions that occur during the request
//       print('Exception: $e');
//       return false;
//     }
//   }
//   static Future<int?> getTeacherId() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     print("TeacherID idss  :-> ${prefs.getInt("userId")}");
//     return prefs.getInt("userId");
//     // print()
//   }
// }
//
// // class ClassDairyServiceRequest {
// //   final List<ClassDairyServiceRequestDTO> classDairyDTOs;
// //
// //   ClassDairyServiceRequest({required this.classDairyDTOs});
// //
// //   // Convert the ClassDairyServiceRequest to a JSON object
// //   Map<String, dynamic> toJson() {
// //     return {
// //       'classDairyDTOs': classDairyDTOs.map((e) => e.toJson()).toList(),
// //     };
// //   }
// //
// //
// //   // Create a ClassDairyServiceRequest from JSON data
// //   factory ClassDairyServiceRequest.fromJson(Map<String, dynamic> json) {
// //     return ClassDairyServiceRequest(
// //       classDairyDTOs: List<ClassDairyServiceRequestDTO>.from(
// //         json['classDairyDTOs'].map((item) => ClassDairyServiceRequestDTO.fromJson(item)),
// //       ),
// //     );
// //   }
// // }
//
// class ClassDairyServiceRequestDTO {
//   // Fields to include in the request
//   final int classId;
//   final int sectionId;
//   final int subjectId;
//   final int teacherId;
//   final int schoolId;
//   final String title;
//   final String description;
//
//   ClassDairyServiceRequestDTO({
//     required this.classId,
//     required this.sectionId,
//     required this.subjectId,
//     required this.teacherId,
//     required this.schoolId,
//     required this.title,
//     required this.description,
//   });
//
//   // Convert the ClassDairyServiceRequestDTO to a JSON object
//   Map<String, dynamic> toJson() {
//     return {
//       'classId': classId,
//       'sectionId': sectionId,
//       'subjectId': subjectId,
//       'teacherId': teacherId,
//       'schoolId': schoolId,
//       'title': title,
//       'description': description,
//     };
//   }
//
//   // Create a ClassDairyServiceRequestDTO from JSON data
//   factory ClassDairyServiceRequestDTO.fromJson(Map<String, dynamic> json) {
//     return ClassDairyServiceRequestDTO(
//       classId: json['classId'],
//       sectionId: json['sectionId'],
//       subjectId: json['subjectId'],
//       teacherId: json['teacherId'],
//       schoolId: json['schoolId'],
//       title: json['title'],
//       description: json['description'],
//     );
//   }
// }
import 'dart:convert';
import 'package:erp_school/api/api_util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';


class ClassDairyService {
  // URL for the API endpoint
  static final String url = 'https://sutramsol.in/academic-service-dev/api/v1/classdairy/save';

  // Method to get headers
  static Future<Map<String, String>> getHeaders() async {
    var correlationObject = {
      'correlation-id': Uuid().v4(), // Generate UUID
      'timestamp': DateTime.now().millisecondsSinceEpoch.toString(), // Current timestamp in milliseconds
    };

    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer YOUR_ACCESS_TOKEN', // Replace with actual token
      'X-Correlation-Object': jsonEncode(correlationObject), // Add correlation object
    };
  }

  // Static method to save class diary data
  static Future<ClassDairyServiceResponseDTO?> saveClassDairyService(ClassDairyServiceRequestDTO classDairy) async {
    try {
      // Making the POST request
      final response = await ApiUtil.postRequest(url, classDairy.toJson());

      print('Response Body:--> ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Parse and return the response model
        return ClassDairyServiceResponseDTO.fromJson(jsonDecode(response.body));
      } else {
        print('Error: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Exception: $e');
      return null;
    }
  }

  // Fetch teacher ID from shared preferences
  static Future<int?> getTeacherId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print("TeacherID idss  :-> ${prefs.getInt("userId")}");
    return prefs.getInt("userId");
  }
}

// Request Model (Matches your API request)
class ClassDairyServiceRequestDTO {
  final int classId;
  final int sectionId;
  final int subjectId;
  final int teacherId;
  final int schoolId;
  final String title;
  final String description;

  ClassDairyServiceRequestDTO({
    required this.classId,
    required this.sectionId,
    required this.subjectId,
    required this.teacherId,
    required this.schoolId,
    required this.title,
    required this.description,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'classId': classId,
      'sectionId': sectionId,
      'subjectId': subjectId,
      'teacherId': teacherId,
      'schoolId': schoolId,
      'title': title,
      'description': description,
    };
  }

  // Create from JSON
  factory ClassDairyServiceRequestDTO.fromJson(Map<String, dynamic> json) {
    return ClassDairyServiceRequestDTO(
      classId: json['classId'],
      sectionId: json['sectionId'],
      subjectId: json['subjectId'],
      teacherId: json['teacherId'],
      schoolId: json['schoolId'],
      title: json['title'],
      description: json['description'],
    );
  }
}

// Response Model (Matches API response)
class ClassDairyServiceResponseDTO {
  final int id;
  final int classId;
  final int sectionId;
  final int subjectId;
  final int teacherId;
  final int schoolId;
  final String title;
  final String description;
  final String createdAt;

  ClassDairyServiceResponseDTO({
    required this.id,
    required this.classId,
    required this.sectionId,
    required this.subjectId,
    required this.teacherId,
    required this.schoolId,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  // Convert from JSON
  factory ClassDairyServiceResponseDTO.fromJson(Map<String, dynamic> json) {
    return ClassDairyServiceResponseDTO(
      id: json['id'] ??0,
      classId: json['classId'] ??0,
      sectionId: json['sectionId'] ??0,
      subjectId: json['subjectId']??0,
      teacherId: json['teacherId']??0,
      schoolId: json['schoolId']??0,
      title: json['title']??"",
      description: json['description']??"",
      createdAt: json['createdAt']??"",
    );
  }
}
