import 'dart:convert';
import 'package:erp_school/api/api_util.dart';
import 'package:uuid/uuid.dart';

class AttendanceService {
  // URL for the API endpoint
  static final String url = 'https://www.sutramsol.in/ssapigw-dev/academic-dev/api/v1/attendance/teacher/save';

  // Method to get headers
  static Future<Map<String, String>> getHeaders() async {
    var correlationObject = {
      'correlation-id': Uuid().v4(), // Generate UUID
     // 'timestamp': DateTime.now().millisecondsSinceEpoch.toString(), // Current timestamp in milliseconds
    };

    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer YOUR_ACCESS_TOKEN', // Replace with actual token
      'X-Correlation-id': jsonEncode(correlationObject), // Add correlation object
    };
  }

  // Static method to save attendance
  static Future<bool> saveAttendance(List<AttendanceDTO> attendanceList) async {
    try {
      // Create an AttendanceRequest instance
      final attendanceRequest = AttendanceRequest(attendanceDTOs: attendanceList);

      // Making the POST request
      final response = await ApiUtil.postRequest(url, attendanceRequest.toJson(), );
      print('Response Body: ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        // If successful, return true
        return true;
      } else {
        // If there is an error, print the error and return false
        print('Error: ${response.body}');
        return false;
      }
    } catch (e) {
      // Catch and print any exceptions that occur during the request
      print('Exception: $e');
      return false;
    }
  }
}

class AttendanceRequest {
  final List<AttendanceDTO> attendanceDTOs;

  AttendanceRequest({required this.attendanceDTOs});

  // Convert the AttendanceRequest to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'attendanceDTOs': attendanceDTOs.map((e) => e.toJson()).toList(),
    };
  }

  // Create an AttendanceRequest from JSON data
  factory AttendanceRequest.fromJson(Map<String, dynamic> json) {
    return AttendanceRequest(
      attendanceDTOs: List<AttendanceDTO>.from(
        json['attendanceDTOs'].map((item) => AttendanceDTO.fromJson(item)),
      ),
    );
  }
}

class AttendanceDTO {
  final int studentId;
  final int schoolId;
  final String gradeId;
  final String sectionId;
  final String? attendanceStatus;
  final String attendanceDate;

  AttendanceDTO({
    required this.studentId,
    required this.schoolId,
    required this.gradeId,
    required this.sectionId,
    required this.attendanceStatus,
    required this.attendanceDate,
  });

  // Convert the AttendanceDTO to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'studentId': studentId,
      'schoolId': schoolId,
      'gradeId': gradeId,
      'sectionId': sectionId,
      'attendanceStatus': attendanceStatus,
      'attendanceDate': attendanceDate,
    };
  }

  // Create an AttendanceDTO from JSON data
  factory AttendanceDTO.fromJson(Map<String, dynamic> json) {
    return AttendanceDTO(
      studentId: json['studentId'],
      schoolId: json['schoolId'],
      gradeId: json['gradeId'],
      sectionId: json['sectionId'],
      attendanceStatus: json['attendanceStatus'],
      attendanceDate: json['attendanceDate'],
    );
  }
}
