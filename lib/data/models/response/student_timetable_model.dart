class StudentTimetableModel {
  final String rollNumber;
  final String name;
  final String grade;
  final String section;
  final Map<String, List<TimeTableEntry>> timeTableList;

  StudentTimetableModel({
    required this.rollNumber,
    required this.name,
    required this.grade,
    required this.section,
    required this.timeTableList,
  });

  factory StudentTimetableModel.fromJson(Map<String, dynamic> json) {
    return StudentTimetableModel(
      rollNumber: json['rollNumber']??"No data",
      name: json['name']??"No data",
      grade: json['grade']??"No data",
      section: json['section']??"No data",
      timeTableList: (json['timeTableList'] as Map<String, dynamic>).map(
            (day, entries) => MapEntry(
          day,
          (entries as List<dynamic>)
              .map((entry) => TimeTableEntry.fromJson(entry))
              .toList(),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rollNumber': rollNumber,
      'name': name,
      'grade': grade,
      'section': section,
      'timeTableList': timeTableList.map(
            (day, entries) => MapEntry(
          day,
          entries.map((entry) => entry.toJson()).toList(),
        ),
      ),
    };
  }
}

class TimeTableEntry {
  final String subject;
  final String teacher;
  final String timeslot;
  final String roomNumber;

  TimeTableEntry({
    required this.subject,
    required this.teacher,
    required this.timeslot,
    required this.roomNumber,
  });

  factory TimeTableEntry.fromJson(Map<String, dynamic> json) {
    return TimeTableEntry(
      subject: json['subject']??"No data",
      teacher: json['teacher']??"No data",
      timeslot: json['timeslot']??"No data",
      roomNumber: json['roomNumber']??"No data",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subject': subject,
      'teacher': teacher,
      'timeslot': timeslot,
      'roomNumber': roomNumber,
    };
  }
}
