import 'dart:convert';
import 'package:erp_school/constants/app_constants.dart';
import 'package:erp_school/data/models/response/student_performance_model.dart';
import 'package:erp_school/api/api_util.dart' as api;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentPerformanceService {
  static const String baseUrl = '$apiBaseUrl$academicPrefix';

  Future<StudentPerformanceModel> fetchStudentPerformanceSummary() async {
    // Get the saved username from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.remove('username');
    //prefs.setString('username', 'LA1A0000T1');
    String? savedUsername = prefs.getString('username');

    print('The saved use name --> $savedUsername');
    final yearDate = DateFormat("yyyy").format(DateTime.now());
    final url = '$baseUrl/performance/student/$savedUsername/$yearDate';
    final response = await api.ApiUtil.getRequest(url);
    print("The repsinse i s ${json.decode(response.body)}");
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return StudentPerformanceModel.fromJson(jsonData);
    } else {
      throw Exception(
          'Failed to load student performance summary: ${response.statusCode}');
    }
  }
}
