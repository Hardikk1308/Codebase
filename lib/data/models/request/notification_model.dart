class NotificationModel {
  final int schoolId;
  final String notificationTitle;
  final String notificationMessage;
  final String notificationDate;
  final String publishedBy;
  final String visibility;

  NotificationModel({
    required this.schoolId,
    required this.notificationTitle,
    required this.notificationMessage,
    required this.notificationDate,
    required this.publishedBy,
    required this.visibility,
  });

  Map<String, dynamic> toJson() {
    return {
      "schoolId": schoolId,
      "notificationTitle": notificationTitle,
      "notificationMessage": notificationMessage,
      "notificationDate": notificationDate,
      "publishedBy": publishedBy,
      "visibility": visibility,
    };
  }
}
