class AttendanceSummaryModel {
  final String rollNumber;
  final String name;
  final String month;
  final int year;
  final int totalDays;
  final Attendance attendance;

  AttendanceSummaryModel({
    required this.rollNumber,
    required this.name,
    required this.month,
    required this.year,
    required this.totalDays,
    required this.attendance,
  });

  factory AttendanceSummaryModel.fromJson(Map<String, dynamic> json) {
    return AttendanceSummaryModel(
      rollNumber: json['rollNumber'],
      name: json['name'],
      month: json['month'],
      year: json['year'],
      totalDays: json['totalDays'],
      attendance: Attendance.fromJson(json['attendance']),
    );
  }
}

class Attendance {
  final int presentDays;
  final int absentDays;
  final int holidayDays;
  final int attendanceNotTakenDays;
  final DateLists dateLists;

  Attendance({
    required this.presentDays,
    required this.absentDays,
    required this.holidayDays,
    required this.attendanceNotTakenDays,
    required this.dateLists,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(
      presentDays: json['presentDays'],
      absentDays: json['absentDays'],
      holidayDays: json['holidayDays'],
      attendanceNotTakenDays: json["attendanceNotTakenDays"],
      dateLists: DateLists.fromJson(json['dateLists']),
    );
  }
}

class DateLists {
  final List<String> present;
  final List<String> absent;
  final List<String> holiday;
  List<String> attendanceNotTaken;

  DateLists({
    required this.present,
    required this.absent,
    required this.holiday,
    required this.attendanceNotTaken,
  });

  factory DateLists.fromJson(Map<String, dynamic> json) {
    return DateLists(
      present: List<String>.from(json['present']),
      absent: List<String>.from(json['absent']),
      holiday: List<String>.from(json['holiday']),
      attendanceNotTaken: List<String>.from(json['attendanceNotTaken']),
    );
  }
}
