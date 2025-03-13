import 'dart:convert';
import 'package:erp_school/api/api_util.dart';
import 'package:erp_school/constants/app_constants.dart';
import 'package:erp_school/data/models/response/attendance_model.dart';
import 'package:erp_school/data/models/response/attendance_summary.dart';
import 'package:erp_school/utils/api_cache_manager.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'School_service.dart';

class TeacherAttendanceService {

  Future<AttendanceModel> getTeacherAttendanceGradeSection(String sectionId, String gradeId) async {
    int? schoolId = await SchoolService.getSchoolId();
    try {
      // Get the saved username from SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? savedUsername = prefs.getString('username');

      print('The saved use name --> $savedUsername');
      // Check if the username is null
      if (savedUsername == null) {
        throw Exception("Username not found in SharedPreferences");
      }
      final date = DateFormat('yyyy-MM-dd').format(DateTime.now());
      // final url = '$apiBaseUrl$academicPrefix/attendance/teacher/$savedUsername/1/2024-12-02/1/1';
      final url = '$apiBaseUrl$academicPrefix/attendance/teacher/$savedUsername/$schoolId/$date/$gradeId/$sectionId';
      print('THEHE URRK --> $url');
      final response = await ApiUtil.getRequest(url);
      print("respone attendense status print : ${response.body}");
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        for (final item in data["attendanceDetails"]){
          item["attendanceDate"] = item["attendanceDate"] ?? date;
        }
        print("respone attendense status print : ${data}");
        // final Map<String, dynamic> data = json.decode(response.body);
        return AttendanceModel.fromJson(data);
      } else {
        throw Exception('Failed to load attendance data ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching attendance data: $e');
      throw Exception('Failed to load attendance data ${e}');
    }
  }

  Future<TeacherAttendance> getTeacherAttendanceGradeSummary() async {
    try {
      // Get the saved username from SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? schoolId = await SchoolService.getSchoolId();
      //prefs.remove('username');
      //prefs.setString('username', 'LA1A0000T1');
      String? savedUsername = prefs.getString('username');
      final date = DateFormat('yyyy-MM-dd').format(DateTime.now());
      print('Teacher The saved use name  --> $savedUsername');
      String _baseUrl = '$apiBaseUrl$academicPrefix/attendance/teacher/$savedUsername/$schoolId/$date';
      final response = await ApiUtil.getRequest(_baseUrl);
      print("print base url ---> $_baseUrl");
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        print("respone attendense status print : ${response.body}");

        // Filtering grades and sections that are assigned to current logged in teacher
        final mappings = await ApiCacheManager().getClassMappings();
        var list = data['attendanceSummary'] as List;
        data['attendanceSummary'] = list.where((e) {
          final summary = AttendanceSummary.fromJson(e);
          return mappings.indexWhere((element) {
            if ( element[ApiCacheManager.KEY_SECTION] == summary.section && element[ApiCacheManager.KEY_GRADE] == summary.grade) {
              e['gradeId'] = element[ApiCacheManager.KEY_GRADE_ID];
              e['sectionId'] = element[ApiCacheManager.KEY_SECTION_ID];
              return true;
            } else {
              return false;
            }
          },) > -1;
        },).toList();
        print("ishwar: $data");
        return TeacherAttendance.fromJson(data);
      } else {
        throw Exception('Failed to load attendance data ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching attendance data: $e');
      return TeacherAttendance(teacherName: '', attendanceSummary: []);
    }
  }
}