// // import 'dart:convert';
// // import 'package:erp_school/data/models/response/AttendanceSummaryModel.dart';
// // import 'package:erp_school/api/api_util.dart' as api;
// // import 'package:erp_school/constants/app_constants.dart';

// // class AttendanceService {
// //   static const String baseUrl = "$apiBaseUrl$ssapigwPrefix"; //'https://www.sutramsol.in/ssapigw/mock/api/v1';
// //   Future<AttendanceSummaryModel> fetchAttendanceSummary() async {
// //     const url = '$baseUrl/attendance/student/LALALALAS1/1/2024/12';
// //     final response = await api.ApiUtil.getRequest(url);
// //     final jsonData = json.decode(response.body);
// //     return AttendanceSummaryModel.fromJson(jsonData);
// //   }
// // }

// import 'dart:convert';
// import 'package:erp_school/data/models/response/AttendanceSummaryModel.dart';
// import 'package:erp_school/api/api_util.dart' as api;
// import 'package:erp_school/constants/app_constants.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AttendanceService {
//   static const String baseUrl = "$apiBaseUrl$ssapigwPrefix";

//   Future<AttendanceSummaryModel> fetchAttendanceSummary() async {
//     // Get the saved username from SharedPreferences
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? savedUsername = prefs.getString('username');

//     // Check if the username is null
//     if (savedUsername == null) {
//       throw Exception("Username not found in SharedPreferences");
//     }

//     // Construct the dynamic URL
//     final url = '$baseUrl/attendance/student/$savedUsername/1/2024/12';

//     // Make the API request
//     final response = await api.ApiUtil.getRequest(url);

//     // Decode the JSON response
//     final jsonData = json.decode(response.body);

//     // Convert the response to the model and return
//     return AttendanceSummaryModel.fromJson(jsonData);
//   }
// }
import 'dart:convert';
import 'package:erp_school/api/api_util.dart' as api;
import 'package:erp_school/constants/app_constants.dart';
import 'package:erp_school/data/models/response/AttendanceSummaryModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'School_service.dart';

class AttendanceService {
  static const String baseUrl = "$apiBaseUrl$academicPrefix";

  Future<AttendanceSummaryModel?> fetchAttendanceSummary({
    required int year,
    required int month,
  }) async {
    // Get the saved username from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUsername = prefs.getString('username');

    // Check if the username is null
    if (savedUsername == null) {
      throw Exception("Username not found in SharedPreferences");
    }
    int? schoolId = await SchoolService.getSchoolId();
    // Construct the dynamic URL
    final url = '$baseUrl/attendance/student/$savedUsername/$schoolId/$year/$month';

    // Make the API request
    final response = await api.ApiUtil.getRequest(url);

    // Decode the JSON response
    final jsonData = json.decode(response.body);

    // Check for 404 or other errors
    if (response.statusCode == 404 || jsonData['statusCode'] == 404) {
      print("Attendance data not found for the given year and month.");
      return null; // Return null if no data is found
    }

    print("MyAttendanceData::${jsonData}");

    // Convert the response to the model and return
    return AttendanceSummaryModel.fromJson(jsonData);
  }
}
