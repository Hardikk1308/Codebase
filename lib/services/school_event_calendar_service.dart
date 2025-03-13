import 'dart:convert';
import 'package:erp_school/api/api_util.dart' as api;
import 'package:erp_school/constants/app_constants.dart';
import 'package:erp_school/data/models/response/event_response.dart';
import 'package:erp_school/data/models/response/student_event_calender_year_model.dart';
import 'package:intl/intl.dart';

import 'School_service.dart';

class SchoolEventCalendarService {
  //static const String baseUrl = 'https://www.sutramsol.in/ssapigw/mock/api/v1';

  Future<EventResponse> fetchSchoolEventCalender() async {
    var url = '$apiBaseUrl$academicPrefix/school_event_calendar';
    final response = await api.ApiUtil.getRequest(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return EventResponse.fromJson(jsonData);
    } else {
      throw Exception('Failed to load school event calender: ${response.statusCode}');
    }
  }

  Future<StudentYearModel> fetchEventData() async {
    int? schoolId = await SchoolService.getSchoolId();
    final date = DateFormat("yyyy").format(DateTime.now());
    final url = '$apiBaseUrl$academicPrefix/events/all/$schoolId/$date'; // Replace with your API endpoint
    final response = await api.ApiUtil.getRequest(url);
    print("The response is " + response.body);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return StudentYearModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load event data: ${response.statusCode}');
    }
  }
}