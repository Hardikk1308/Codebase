import 'dart:convert';
import 'package:erp_school/constants/app_constants.dart';
import 'package:erp_school/data/models/response/notification_model.dart';
import 'package:erp_school/api/api_util.dart' as api;

import 'School_service.dart';

class NotificationService {
  Future<List<NotificationModel>> fetchNotifications(String type) async {
    int? schoolId = await SchoolService.getSchoolId();
    var url = type == 'student'
        ? '$apiBaseUrl$academicPrefix/notifications/all/$schoolId'
        : '$apiBaseUrl$academicPrefix/notifications/all/$schoolId'; // Replace with the actual endpoint
    final response = await api.ApiUtil.getRequest(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print("MyNotification::${jsonData}");
      List<NotificationModel> notifications = List<NotificationModel>.from(
        jsonData['notificationsList'].map((notification) {
          return NotificationModel.fromJson(
              notification); // Assuming you have fromJson constructor in NotificationModel
        }),
      );
      return notifications;
    } else {
      throw Exception('Failed to load notifications: ${response.statusCode}');
    }
  }

  Future<bool> saveNotification(NotificationModel notification) async {
    const url = '$apiBaseUrl$academicPrefix/notifications/save';
    try {
      final response =
          await api.ApiUtil.postRequest(url, notification.toJson());
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Notification saved: ${response.body}');
        return true;
      } else {
        print('Error saving notification: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Exception: $e');
      return false;
    }
  }
}
