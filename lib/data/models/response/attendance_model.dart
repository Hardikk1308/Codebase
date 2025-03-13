class AttendanceModel {
  final String teacherName;
  final String grade;
  final String section;
  final Summary attendanceSummary;
  final List<AttendanceDetail> attendanceDetails;

  AttendanceModel({
    required this.teacherName,
    required this.grade,
    required this.section,
    required this.attendanceSummary,
    required this.attendanceDetails,
  });

  // Factory method to parse JSON
  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      teacherName: json['teacherName'] as String,
      grade: json['grade'] as String,
      section: json['section'] as String,
      attendanceSummary: Summary.fromJson(json['attendanceSummary'] as Map<String, dynamic>),
      // attendanceSummary: Summary.fromJson(json['attendanceSummary'] as Map<String, dynamic>),
      attendanceDetails: (json['attendanceDetails'] as List)
          .map((item) => AttendanceDetail.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  // Convert the model back to JSON
  Map<String, dynamic> toJson() {
    return {
      'teacherName': teacherName,
      'grade': grade,
      'section': section,
      'attendanceSummary': attendanceSummary.toJson(),
      'attendanceDetails': attendanceDetails.map((detail) => detail.toJson()).toList(),
    };
  }
}
//
class Summary {
  final int totalStudents;
  final int present;
  final int absent;

  Summary({
    required this.totalStudents,
    required this.present,
    required this.absent,
  });

  // Factory method to parse JSON
  factory Summary.fromJson(Map<String, dynamic> json) {
    return Summary(
      totalStudents: json['totalStudents'] as int,
      present: json['present'] as int,
      absent: json['absent'] as int,
    );
  }

  // Convert the model back to JSON
  Map<String, dynamic> toJson() {
    return {
      'totalStudents': totalStudents,
      'present': present,
      'absent': absent,
    };
  }
}

class AttendanceDetail {
  final int studentID;
  final String studentName;
  final String studentRollNo;
  final String attendanceDate;
  String? attendanceStatus;

  AttendanceDetail({
    required this.studentID,
    required this.studentName,
    required this.studentRollNo,
    required this.attendanceDate,
    required this.attendanceStatus,
  });

  // Factory method to parse JSON
  factory AttendanceDetail.fromJson(Map<String, dynamic> json) {
    return AttendanceDetail(
        studentID: json['studentId'] ?? "No Data",
        studentName: json['studentName'] ?? "No Data",
        studentRollNo: json['studentRollNo'] ?? "No Data",
        attendanceDate: json['attendanceDate'] ?? "No Data",
        attendanceStatus: json['attendanceStatus']
    );
  }

  // Convert the model back to JSON
  Map<String, dynamic> toJson() {
    return {
      'studentName': studentName,
      'studentRollNo': studentRollNo,
      'attendanceDate': attendanceDate,
      'attendanceStatus': attendanceStatus,
    };
  }
}