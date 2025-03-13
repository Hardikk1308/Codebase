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

  // Factory constructor to create an instance from JSON
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      schoolId: json['schoolId'] == null ? 0 : json['schoolId'].toInt(),
      notificationTitle: json['notificationTitle'],
      notificationMessage: json['notificationMessage'],
      notificationDate: json['notificationDate'],
      publishedBy: json['publishedBy'],
      visibility: json['visibility'],
    );
  }

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