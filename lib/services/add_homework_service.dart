import 'dart:convert';
import 'package:erp_school/api/api_util.dart';
import 'package:uuid/uuid.dart';

class AddHomeworkService {
  static final String url = 'https://sutramsol.in/academic-service-dev/api/v1/homework/teacher/create';

  static Future<Map<String, String>> getHeaders() async {
    var correlationObject = {
      'correlation-id': Uuid().v4(),
      //'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
    };

    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer YOUR_ACCESS_TOKEN',
      'X-Correlation-id': jsonEncode(correlationObject),
    };
  }

  static Future<AddHomeworkResponseDTO?> saveClassDairyService(AddHomeworkServiceRequestDTO homework) async {
    try {
      final response = await ApiUtil.postRequest(url, homework.toJson());
      print('Abhi Request Payload: ${jsonEncode(homework.toJson())}');
      print('Response Body:--> ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return AddHomeworkResponseDTO.fromJson(jsonDecode(response.body));
      } else {
        print('Error: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Exception: $e');
      return null;
    }
  }

  // static Future<int?> getTeacherId() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   print("TeacherID idss  :-> ${prefs.getInt("userId")}");
  //   return prefs.getInt("userId");
  // }
}

// Request DTO (Corrected)
class AddHomeworkServiceRequestDTO {
  final int gradeId;
  final int sectionId;
  final int subjectId;
  final int teacherId;
  final int schoolId;
  final String title;
  final String moreDetails;
  final String dueDate; // Changed from dynamic to String
  final String comments;

  AddHomeworkServiceRequestDTO({
    required this.gradeId,
    required this.sectionId,
    required this.subjectId,
    required this.teacherId,
    required this.schoolId,
    required this.title,
    required this.moreDetails,
    required this.dueDate,
    required this.comments,
  });

  Map<String, dynamic> toJson() {
    return {
      'gradeId': gradeId,
      'sectionId': sectionId,
      'subjectId': subjectId,
      'teacherId': teacherId,
      'schoolId': schoolId,
      'title': title,
      'moreDetails': moreDetails,
      'dueDate': dueDate,
      'comments': comments,
    };
  }

  factory AddHomeworkServiceRequestDTO.fromJson(Map<String, dynamic> json) {
    return AddHomeworkServiceRequestDTO(
      gradeId: json['gradeId'],
      sectionId: json['sectionId'],
      subjectId: json['subjectId'],
      teacherId: json['teacherId'],
      schoolId: json['schoolId'],
      title: json['title'],
      moreDetails: json['moreDetails'],
      dueDate: json['dueDate'],
      comments: json['comments'],
    );
  }
}

// Response DTO (Corrected)
class AddHomeworkResponseDTO {
  final int id;
  final int gradeId;
  final int sectionId;
  final int subjectId;
  final int teacherId;
  final int schoolId;
  final String title;
  final String moreDetails;
  final String createdAt;
  final String comments;

  AddHomeworkResponseDTO({
    required this.id,
    required this.gradeId,
    required this.sectionId,
    required this.subjectId,
    required this.teacherId,
    required this.schoolId,
    required this.title,
    required this.moreDetails,
    required this.createdAt,
    required this.comments,
  });

  factory AddHomeworkResponseDTO.fromJson(Map<String, dynamic> json) {
    return AddHomeworkResponseDTO(
      id: json['id']??0,
      gradeId: json['gradeId']??0,
      sectionId: json['sectionId']??0,
      subjectId: json['subjectId']??0,
      teacherId: json['teacherId']??0,
      schoolId: json['schoolId']??0,
      title: json['title']??"",
      moreDetails: json['moreDetails']??"",
      createdAt: json['createdAt']??"",
      comments: json['comments']??"",
    );
  }
}
