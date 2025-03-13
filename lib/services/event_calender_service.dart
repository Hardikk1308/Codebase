import 'dart:convert';
import 'package:erp_school/api/api_util.dart' as api;
import 'package:erp_school/data/models/response/event_calender.dart';

class EventCalenderService {
  static const String baseUrl = 'https://www.sutramsol.in/ssapigw-dev/mock/api/v1';

  Future<EventCalendar> fetchNotifications() async {
    const url = '$baseUrl/school_event_calendar';
    final response = await api.ApiUtil.getRequest(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return EventCalendar.fromJson(jsonData);
    } else {
      throw Exception('Failed to load student_timetable: ${response.statusCode}');
    }
  }
}