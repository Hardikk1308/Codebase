class TeacherTimetableModel {
  final String teacherName;
  final Map<String, List<Session>> timeTableList;

  TeacherTimetableModel({
    required this.teacherName,
    required this.timeTableList,
  });

  // Factory method to parse JSON
  factory TeacherTimetableModel.fromJson(Map<String, dynamic> json) {
    return TeacherTimetableModel(
      teacherName: json['name'] ?? "",
      timeTableList: (json['timeTableList'] as Map<String, dynamic>).map(
            (day, entries) => MapEntry(
          day,
          (entries as List<dynamic>)
              .map((entry) => Session.fromJson(entry))
              .toList(),
        ),
      ),
    );
  }

  // Convert the model back to JSON
  Map<String, dynamic> toJson() {
    return {
      'teacherName': teacherName,
      'timeTableList': timeTableList.map(
              (day, entries) => MapEntry(
            day,
            entries.map((entry) => entry.toJson()).toList(),
          )),
    };
  }
}


class Session {
  final String subject;
  final String timeslot;
  final String gradeSection;
  final String roomNumber;

  Session({
    required this.subject,
    required this.timeslot,
    required this.gradeSection,
    required this.roomNumber,
  });

  // Factory method to parse JSON
  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      subject: json['subject'] ?? "",
      timeslot:json['timeslot'] ?? "",
      gradeSection: json['gradeSection'] ?? "",
      roomNumber: json['roomNumber'] ?? "",
    );
  }

  // Convert the model back to JSON
  Map<String, dynamic> toJson() {
    return {
      'subject': subject,
      'timeslot':timeslot,
      'gradeSection': gradeSection,
      'roomNumber': roomNumber,
    };
  }
}