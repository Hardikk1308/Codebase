// class HomeworkSummary {
//   final int totalHomeWorks;
//   final int completed;
//   final int submitted;
//   final int pending;
//   final int newTasks;
//
//   HomeworkSummary({
//     required this.totalHomeWorks,
//     required this.completed,
//     required this.submitted,
//     required this.pending,
//     required this.newTasks,
//   });
//
//   factory HomeworkSummary.fromJson(Map<String, dynamic> json) {
//     return HomeworkSummary(
//       totalHomeWorks: json['totalHomeWorks'],
//       completed: json['completed'],
//       submitted: json['submitted'],
//       pending: json['pending'],
//       newTasks: json['new'],
//     );
//   }
// }
//
// class HomeworkDetails {
//   final int homeworkId;
//   final String title;
//   final String status;
//   final String dueDate;
//   final String createdOn;
//   final String subject;
//   final String assignedDate;
//   final String studentName;
//   final String moreDetails;
//
//   HomeworkDetails(
//       {required this.homeworkId,
//       required this.title,
//       required this.status,
//       required this.dueDate,
//       required this.createdOn,
//       required this.subject,
//       required this.assignedDate,
//       required this.studentName,
//       required this.moreDetails});
//
//   factory HomeworkDetails.fromJson(Map<String, dynamic> json) {
//     return HomeworkDetails(
//         homeworkId: json['homeworkId'],
//         title: json['title'],
//         status: json['status'],
//         dueDate: json['dueDate'],
//         createdOn: json['createdOn'],
//         subject: json['subject'],
//         assignedDate: json['createdOn'],
//         studentName: json['studentName'],
//         moreDetails: json['moreDetails']);
//   }
// }
//
// class StudentHomework {
//   final String? studentRNo;
//   final String? teacherName;
//   final String? name;
//   final String? studentClass;
//   final HomeworkSummary homeworkSummary;
//   final List<HomeworkDetails> homeworkDetailsList;
//
//   StudentHomework({
//     this.studentRNo,
//     this.teacherName,
//     this.name,
//     this.studentClass,
//     required this.homeworkSummary,
//     required this.homeworkDetailsList,
//   });
//
//   factory StudentHomework.fromJson(Map<String, dynamic> json) {
//     return StudentHomework(
//       studentRNo: json['studentRNo'],
//       teacherName: json['teacherName'],
//       name: json['name'],
//       studentClass: json['class'],
//       homeworkSummary: HomeworkSummary.fromJson(json['homeworkSummary']),
//       homeworkDetailsList: (json['homeworkDetailsList'] as List)
//           .map((detail) => HomeworkDetails.fromJson(detail))
//           .toList(),
//     );
//   }
// }
class HomeworkSummary {
  final int totalHomeWorks;
  final int completed;
  final int submitted;
  final int pending;
  final int newTasks;

  HomeworkSummary({
    required this.totalHomeWorks,
    required this.completed,
    required this.submitted,
    required this.pending,
    required this.newTasks,
  });

  // Safe fromJson Method
  factory HomeworkSummary.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return HomeworkSummary.empty();
    }
    return HomeworkSummary(
      totalHomeWorks: json['totalHomeWorks'] ?? 0,
      completed: json['completed'] ?? 0,
      submitted: json['submitted'] ?? 0,
      pending: json['pending'] ?? 0,
      newTasks: json['new'] ?? 0,  //"new" ko safely handle karna
    );
  }

  // Empty Constructor (App crash hone se bachegi)
  static HomeworkSummary empty() {
    return HomeworkSummary(
      totalHomeWorks: 0,
      completed: 0,
      submitted: 0,
      pending: 0,
      newTasks: 0,
    );
  }
}

class HomeworkDetails {
  final int homeworkId;
  final String title;
  final String status;
  final String dueDate;
  final String createdOn;
  final String subject;
  final String assignedDate;
  final String studentName;
  final String moreDetails;
  final String comments;
  final String teachername;

  HomeworkDetails({
    required this.homeworkId,
    required this.title,
    required this.status,
    required this.dueDate,
    required this.createdOn,
    required this.subject,
    required this.assignedDate,
    required this.studentName,
    required this.moreDetails,
    required this.comments,
    required this.teachername,
  });

  // Safe fromJson Method
  factory HomeworkDetails.fromJson(Map<String, dynamic> json) {
    return HomeworkDetails(
      homeworkId: json['homeworkId'] ?? 0,
      title: json['title'] ?? '',
      status: json['status'] ?? '',
      dueDate: json['dueDate'] ?? '',
      createdOn: json['createdOn'] ?? '',
      subject: json['subject'] ?? '',
      assignedDate: json['createdOn'] ?? '',
      studentName: json['studentName'] ?? '',
      moreDetails: json['moreDetails'] ?? '',
      comments: json['comments'] ?? '',
      teachername: json['teacherName'] ?? 'No data',
    );
  }
}

class StudentHomework {
  final String? studentRNo;
  final String? teacherName;
  final String? name;
  final String? studentClass;
  final HomeworkSummary homeworkSummary;
  final List<HomeworkDetails> homeworkDetailsList;

  StudentHomework({
    this.studentRNo,
    this.teacherName,
    this.name,
    this.studentClass,
    required this.homeworkSummary,
    required this.homeworkDetailsList,
  });

  // Safe fromJson Method
  factory StudentHomework.fromJson(Map<String, dynamic> json) {
    return StudentHomework(
      studentRNo: json['studentRNo']??"",
      teacherName: json['teacherName']??"",
      name: json['name']??"",
      studentClass: json['class']??"",
      homeworkSummary: HomeworkSummary.fromJson(json['homeworkSummary']) , // Safe
      homeworkDetailsList: (json['homeworkDetailsList'] as List?)
          ?.map((detail) => HomeworkDetails.fromJson(detail))
          .toList() ??
          [], //Null ke case me empty list
    );
  }
}
