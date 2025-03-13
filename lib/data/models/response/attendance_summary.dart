class AttendanceSummary {
  final String grade;
  final String section;
  final int totalStudents;
  final int present;
  final int absent;

  final String? gradeId;
  final String? sectionId;

  AttendanceSummary({
    required this.grade,
    required this.section,
    required this.totalStudents,
    required this.present,
    required this.absent,
    this.gradeId, this.sectionId,
  });

  // Method to parse the JSON and convert it into a Dart object
  factory AttendanceSummary.fromJson(Map<String, dynamic> json) {
    return AttendanceSummary(
      grade: json['grade'],
      section: json['section'],
      totalStudents: json['totalStudents'],
      present: json['present'],
      absent: json['absent'],
      gradeId: "${json['gradeId']}",
      sectionId: "${json['sectionId']}"
    );
  }
}

class TeacherAttendance {
  final String teacherName;
  final List<AttendanceSummary> attendanceSummary;

  TeacherAttendance({
    required this.teacherName,
    required this.attendanceSummary,
  });

  // Method to parse the JSON and convert it into a Dart object
  factory TeacherAttendance.fromJson(Map<String, dynamic> json) {
    var list = json['attendanceSummary'] as List;
    List<AttendanceSummary> summaryList = list.map((i) => AttendanceSummary.fromJson(i)).toList();

    return TeacherAttendance(
      teacherName: json['teacherName'],
      attendanceSummary: summaryList,
    );
  }
}
