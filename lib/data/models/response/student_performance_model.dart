class StudentPerformanceModel {
  final String rollNumber;
  final String name;
  final String studentClass;
  final String year;
  final List<ExamType> examTypes;

  StudentPerformanceModel({
    required this.rollNumber,
    required this.name,
    required this.studentClass,
    required this.year,
    required this.examTypes,
  });

  factory StudentPerformanceModel.fromJson(Map<String, dynamic> json) {
    return StudentPerformanceModel(
      rollNumber: json['rollNumber'],
      name: json['name'],
      studentClass: json['gradeName'],
      year: json['year'],
      examTypes: (json['examTypes'] as List)
          .map((examType) => ExamType.fromJson(examType))
          .toList(),
    );
  }
}

class ExamType {
  final String examType;
  final List<Exam> examDetails;

  ExamType({
    required this.examType,
    required this.examDetails,
  });

  factory ExamType.fromJson(Map<String, dynamic> json) {
    return ExamType(
      examType: json['examType'],
      examDetails: (json['examDetails'] as List).map((exam) => Exam.fromJson(exam)).toList(),
    );
  }
}

class Exam {
  final String subjectName;
  final String examDate;
  final int totalMarks;
  final int marksObtained;

  Exam({
    required this.subjectName,
    required this.examDate,
    required this.totalMarks,
    required this.marksObtained,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
      subjectName: json['subjectName'],
      examDate: json['examDate'],
      totalMarks: json['totalMarks'],
      marksObtained: json['marksObtained'],
    );
  }
}
