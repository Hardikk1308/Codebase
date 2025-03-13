import 'dart:convert';
import 'package:erp_school/api/api_util.dart' as api;
import 'package:erp_school/constants/app_constants.dart';
import 'package:erp_school/data/models/response/student_timetable_model.dart';
import 'package:erp_school/data/models/response/teacher_timetable_model.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'School_service.dart';

class TimeTableService {
  Future<StudentTimetableModel> fetchStudentTimeTable() async {
    // Get the saved username from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? schoolId = await SchoolService.getSchoolId();
    //prefs.remove('username');
    //prefs.setString('username', 'LA1A0000T1');
    String? savedUsername = prefs.getString('username');
    final monthdate = DateFormat("MM").format(DateTime.now());
    final yeardate = DateFormat("yyyy").format(DateTime.now());
    print('The saved use name --> $savedUsername');
    final url = '$apiBaseUrl$academicPrefix/timetable/student/$savedUsername/$schoolId/$yeardate';
    // final url = '$apiBaseUrl$academicPrefix/timetable/student/$savedUsername/1/2025';
    final response = await api.ApiUtil.getRequest(url);
    print('studnet timetable response :: $response');
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return StudentTimetableModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load student timetable: ${response.statusCode}');
    }
  }

  Future<TeacherTimetableModel> fetchTeacherTimeTable() async {
    // Get the saved username from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? schoolId = await SchoolService.getSchoolId();
    //prefs.remove('username');
    //prefs.setString('username', 'LA1A0000T1');
    String? savedUsername = prefs.getString('username');
    final monthdate = DateFormat("MM").format(DateTime.now());
    final yeardate = DateFormat("yyyy").format(DateTime.now());
    print('The saved use name --> $savedUsername');
    final url = '$apiBaseUrl$academicPrefix/timetable/teacher/$savedUsername/$schoolId/$yeardate';
    final response = await api.ApiUtil.getRequest(url);
    print('teacher timetable response :: $response');
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return TeacherTimetableModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load teacher timetable: ${response.statusCode}');
    }
  }
}