import 'dart:convert';
import 'package:erp_school/services/School_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
/// this code not working . show please don't use///
class EditProfilePage {
 static Future<BaseUserModel?> fetchUserData(String type) async {
   int? schoolId = await SchoolService.getSchoolId();
   String studentUrl = 'https://www.sutramsol.in/ssapigw-dev/onboard-dev/api/v1/students/$schoolId';
   String teacherUrl = 'https://www.sutramsol.in/ssapigw-dev/onboard-dev/api/v1/teachers/$schoolId';
    String url = (type == 'student') ? studentUrl : teacherUrl;
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return (type == 'student') ? StudentModel.fromJson(jsonData) : TeacherModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load user data: ${response.statusCode}');
    }
  }
}

abstract class BaseUserModel {
  int schoolId;
  String profilePicLocation;
  String address;
  String email;
  String mediumOfInstruction;
  bool transport;

  BaseUserModel({
    required this.schoolId,
    required this.profilePicLocation,
    required this.address,
    required this.email,
    required this.mediumOfInstruction,
    required this.transport,
  });
}

class StudentModel extends BaseUserModel {
  String fullName;
  int studentId;
  String mobileNumber;
  String gender;
  String fatherName;
  String motherName;

  StudentModel({
    required this.fullName,
    required this.studentId,
    required this.mobileNumber,
    required this.gender,
    required this.fatherName,
    required this.motherName,
    required int schoolId,
    required String profilePicLocation,
    required String address,
    required String email,
    required String mediumOfInstruction,
    required bool transport,
  }) : super(
    schoolId: schoolId,
    profilePicLocation: profilePicLocation,
    address: address,
    email: email,
    mediumOfInstruction: mediumOfInstruction,
    transport: transport,
  );

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      fullName: json['fullName'] ?? '',
      studentId: json['studentId'] ?? 0,
      mobileNumber: json['mobileNumber'] ?? '',
      gender: json['gender'] ?? '',
      fatherName: json['fatherName'] ?? '',
      motherName: json['motherName'] ?? '',
      schoolId: json['schoolId'] ?? 0,
      profilePicLocation: json['profilePicLocation'] ?? '',
      address: json['address'] ?? '',
      email: json['email'] ?? '',
      mediumOfInstruction: json['mediumOfInstruction'] ?? '',
      transport: json['transport'] ?? false,
    );
  }
}

class TeacherModel extends BaseUserModel {
  String schoolName;
  int teacherCapacity;
  int currentTeachersCount;
  int studentCapacity;
  int currentEnrolment;
  double studentTeacherRatio;

  TeacherModel({
    required this.schoolName,
    required this.teacherCapacity,
    required this.currentTeachersCount,
    required this.studentCapacity,
    required this.currentEnrolment,
    required this.studentTeacherRatio,
    required int schoolId,
    required String profilePicLocation,
    required String address,
    required String email,
    required String mediumOfInstruction,
    required bool transport,
  }) : super(
    schoolId: schoolId,
    profilePicLocation: profilePicLocation,
    address: address,
    email: email,
    mediumOfInstruction: mediumOfInstruction,
    transport: transport,
  );

  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return TeacherModel(
      schoolName: json['schoolName'] ?? '',
      teacherCapacity: json['teacherCapacity'] ?? 0,
      currentTeachersCount: json['currentTeachersCount'] ?? 0,
      studentCapacity: json['studentCapacity'] ?? 0,
      currentEnrolment: json['currentEnrolment'] ?? 0,
      studentTeacherRatio: (json['studentTeacherRatio'] ?? 0).toDouble(),
      schoolId: json['schoolId'] ?? 0,
      profilePicLocation: json['profilePicLocation'] ?? '',
      address: json['address'] ?? '',
      email: json['email'] ?? '',
      mediumOfInstruction: json['mediumOfInstruction'] ?? '',
      transport: json['transport'] ?? false,
    );
  }
}
