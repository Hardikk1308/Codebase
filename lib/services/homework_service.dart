// import 'dart:convert';
// import 'dart:ffi';
// import 'package:erp_school/api/api_util.dart';
// import 'package:erp_school/constants/app_constants.dart';
// import 'package:erp_school/data/models/response/homework_summary.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../utils/api_cache_manager.dart';
// import 'School_service.dart';
// class HomeworkService {
//   List<dynamic> classMappings = [];
//   List<String> grades = [];
//   List<String> sections = [];
//   String? selectedGrade;
//   String? selectedSection;
//   String? selectedGradeId;
//   String? selectedSectionId;
//
//   Future<void> loadData(Function(List<dynamic>, List<String>) onDataLoaded) async {
//     final apiCacheManager = ApiCacheManager();
//     List<dynamic> data = await apiCacheManager.getClassMappings();
//     classMappings = data;
//     grades = data.map((e) => e[ApiCacheManager.KEY_GRADE] as String).toSet().toList();
//     onDataLoaded(classMappings, grades);
//   }
//
//   void updateSections(String grade, Function(List<String>, String?) onSectionsUpdated) {
//     final filtered = classMappings.where((e) => e[ApiCacheManager.KEY_GRADE] == grade).toList();
//     selectedGrade = grade;
//     selectedGradeId = filtered.first[ApiCacheManager.KEY_GRADE_ID];
//     sections = filtered.map((e) => e[ApiCacheManager.KEY_SECTION] as String).toSet().toList();
//     onSectionsUpdated(sections, null);
//   }
//   // Future<StudentHomework> fetchStudentHomework() async {
//   //   try {
//   //     // Get the saved username from SharedPreferences
//   //     SharedPreferences prefs = await SharedPreferences.getInstance();
//   //     String? savedUsername = prefs.getString('username');
//   //     String? type = prefs.getString('type')?.toLowerCase();
//   //     int? schoolId = await SchoolService.getSchoolId();
//   //     final date = DateFormat("yyyy").format(DateTime.now());
//   //     print('The saved use name --> $savedUsername $type');
//   //     final monthdate = DateFormat("MM").format(DateTime.now());
//   //     final yeardate = DateFormat("yyyy").format(DateTime.now());
//   //     print("print class id check $selectedGradeId Selected sectionId $selectedSectionId");
//   //     final String apiUrl = "https://www.sutramsol.in/academic-service-dev/api/v1/homework/teacher/$savedUsername/02/$yeardate/$selectedGradeId/$selectedSectionId/$schoolId";
//   //     // final String apiUrl = "https://www.sutramsol.in/academic-service-dev/api/v1/homework/teacher/$savedUsername/02/$yeardate/$selectedGradeId/$selectedSectionId/$schoolId";
//   //     print("get homework api ink ---> $apiUrl");
//   //     // final String apiUrl = "https://www.sutramsol.in/academic-service-dev/api/v1/homework/teacher/SH1S32S6T9/01/2025/7/7/1";
//   //     // final String apiUrl = "$apiBaseUrl$academicPrefix/homework/$type/$savedUsername/$schoolId/$date";
//   //     final response = await ApiUtil.getRequest(apiUrl); // await http.get(Uri.parse(apiUrl));
//   //     print("The respone--->  response${response.body}");
//   //     print("The respone--->  body $jsonDecode{response}");
//   //
//   //     if (response.statusCode == 200) {
//   //       final data = json.decode(response.body);
//   //       print("The data --> $data");
//   //       return StudentHomework.fromJson(data);
//   //     } else {
//   //       print("Failed to load homework data: ${response.statusCode}");
//   //       throw Exception("No homework submitted");
//   //     }
//   //   } catch (e) {
//   //     print("Error occurred while fetching homework data: $e");
//   //     throw Exception("No homework data found");
//   //   }
//   // }
//   Future<StudentHomework> fetchStudentHomework() async {
//     try {
//       // Get the saved username from SharedPreferences
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String? savedUsername = prefs.getString('username');
//       String? type = prefs.getString('type')?.toLowerCase();
//       int? schoolId = await SchoolService.getSchoolId();
//       final yeardate = DateFormat("yyyy").format(DateTime.now());
//
//       print("Fetching homework for Grade: $selectedGradeId, Section: $selectedSectionId");
//
//       final String apiUrl = "https://www.sutramsol.in/academic-service-dev/api/v1/homework/teacher/$savedUsername/02/$yeardate/$selectedGradeId/$selectedSectionId/$schoolId";
//       print("Fetching homework from API: $apiUrl");
//
//       final response = await ApiUtil.getRequest(apiUrl);
//       print("Response received: ${response.body}");
//
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         print("Received Homework Data: $data");
//         return StudentHomework.fromJson(data);
//       } else {
//         print("Failed to load homework data: ${response.statusCode}");
//         return StudentHomework(
//           homeworkDetailsList: [],
//           homeworkSummary: HomeworkSummary.empty(), // ✅ Use default empty constructor
//         );
//       }
//     } catch (e) {
//       print("Error occurred while fetching homework data: $e");
//
//       return StudentHomework(
//         homeworkDetailsList: [],
//         homeworkSummary: HomeworkSummary.empty(), // ✅ Use default empty constructor
//       );
//     }
//   }
//
//
//   /// 🔹 **Helper Function: Remove Duplicate Homework by `homeworkId`**
//   List<Map<String, dynamic>> removeDuplicateHomeworks(List<Map<String, dynamic>> homeworks) {
//     final uniqueHomeworks = <int, Map<String, dynamic>>{}; // Map to store unique homework entries
//
//     for (var hw in homeworks) {
//       if (hw.containsKey('homeworkId')) {
//         uniqueHomeworks[hw['homeworkId']] = hw;
//       }
//     }
//
//     return uniqueHomeworks.values.toList();
//   }
//
// }

// import 'dart:convert';
// import 'dart:ffi';
// import 'package:erp_school/api/api_util.dart';
// import 'package:erp_school/constants/app_constants.dart';
// import 'package:erp_school/data/models/response/homework_summary.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../utils/api_cache_manager.dart';
// import 'School_service.dart';
// class HomeworkService {
//   List<dynamic> classMappings = [];
//   List<String> grades = [];
//   List<String> sections = [];
//   String? selectedGrade;
//   String? selectedSection;
//   String? selectedGradeId;
//   String? selectedSectionId;
//
//   Future<void> loadData(Function(List<dynamic>, List<String>) onDataLoaded) async {
//     final apiCacheManager = ApiCacheManager();
//     List<dynamic> data = await apiCacheManager.getClassMappings();
//     classMappings = data;
//     grades = data.map((e) => e[ApiCacheManager.KEY_GRADE] as String).toSet().toList();
//     onDataLoaded(classMappings, grades);
//   }
//
//   void updateSections(String grade, Function(List<String>, String?) onSectionsUpdated) {
//     final filtered = classMappings.where((e) => e[ApiCacheManager.KEY_GRADE] == grade).toList();
//     selectedGrade = grade;
//     selectedGradeId = filtered.first[ApiCacheManager.KEY_GRADE_ID];
//     sections = filtered.map((e) => e[ApiCacheManager.KEY_SECTION] as String).toSet().toList();
//     onSectionsUpdated(sections, null);
//   }
//   Future<StudentHomework> fetchStudentHomework() async {
//     try {
//       // Get the saved username from SharedPreferences
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String? savedUsername = prefs.getString('username');
//       String? type = prefs.getString('type')?.toLowerCase();
//       int? schoolId = await SchoolService.getSchoolId();
//       final yeardate = DateFormat("yyyy").format(DateTime.now());
//
//       print("Fetching homework for Grade: $selectedGradeId, Section: $selectedSectionId");
//
//       final String apiUrl = "https://www.sutramsol.in/academic-service-dev/api/v1/homework/teacher/$savedUsername/02/$yeardate/$selectedGradeId/$selectedSectionId/$schoolId";
//       print("Fetching homework from API: $apiUrl");
//
//       final response = await ApiUtil.getRequest(apiUrl);
//       print("Response received: ${response.body}");
//
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         print("Received Homework Data: $data");
//         return StudentHomework.fromJson(data);
//       } else {
//         print("Failed to load homework data: ${response.statusCode}");
//         return StudentHomework(
//           homeworkDetailsList: [],
//           homeworkSummary: HomeworkSummary.empty(),
//         );
//       }
//     } catch (e) {
//       print("Error occurred while fetching homework data: $e");
//
//       return StudentHomework(
//         homeworkDetailsList: [],
//         homeworkSummary: HomeworkSummary.empty(), // ✅ Use default empty constructor
//       );
//     }
//   }
//   // Future<StudentHomework> fetchFinalStudentHomework() async {
//   //   try {
//   //     // Get the saved username from SharedPreferences
//   //     SharedPreferences prefs = await SharedPreferences.getInstance();
//   //     String? savedUsername = prefs.getString('username');
//   //     String? type = prefs.getString('type')?.toLowerCase();
//   //     int? schoolId = await SchoolService.getSchoolId();
//   //     final date = DateFormat("yyyy").format(DateTime.now());
//   //     print('The saved use name --> $savedUsername $type');
//   //     final monthdate = DateFormat("MM").format(DateTime.now());
//   //     final yeardate = DateFormat("yyyy").format(DateTime.now());
//   //     print("print class id check $selectedGradeId Selected sectionId $selectedSectionId");
//   //     final String apiUrl = "https://www.sutramsol.in/academic-service-dev/api/v1/homework/teacher/$savedUsername/02/$yeardate/$selectedGradeId/$selectedSectionId/$schoolId";
//   //     // final String apiUrl = "https://www.sutramsol.in/academic-service-dev/api/v1/homework/teacher/$savedUsername/02/$yeardate/$selectedGradeId/$selectedSectionId/$schoolId";
//   //     print("get homework api ink ---> $apiUrl");
//   //     // final String apiUrl = "https://www.sutramsol.in/academic-service-dev/api/v1/homework/teacher/SH1S32S6T9/01/2025/7/7/1";
//   //     // final String apiUrl = "$apiBaseUrl$academicPrefix/homework/$type/$savedUsername/$schoolId/$date";
//   //     final response = await ApiUtil.getRequest(apiUrl); // await http.get(Uri.parse(apiUrl));
//   //     print("The respone--->  response${response.body}");
//   //     print("The respone--->  body $jsonDecode{response}");
//   //
//   //     if (response.statusCode == 200) {
//   //       final data = json.decode(response.body);
//   //       print("The data --> $data");
//   //       return StudentHomework.fromJson(data);
//   //     } else {
//   //       print("Failed to load homework data: ${response.statusCode}");
//   //       throw Exception("No homework submitted");
//   //     }
//   //   } catch (e) {
//   //     print("Error occurred while fetching homework data: $e");
//   //     throw Exception("No homework data found");
//   //   }
//   // }
//
//   /// 🔹 **Helper Function: Remove Duplicate Homework by `homeworkId`**
//   List<Map<String, dynamic>> removeDuplicateHomeworks(List<Map<String, dynamic>> homeworks) {
//     final uniqueHomeworks = <int, Map<String, dynamic>>{}; // Map to store unique homework entries
//
//     for (var hw in homeworks) {
//       if (hw.containsKey('homeworkId')) {
//         uniqueHomeworks[hw['homeworkId']] = hw;
//       }
//     }
//
//     return uniqueHomeworks.values.toList();
//   }
//
// }

import 'dart:convert';
import 'package:erp_school/api/api_util.dart';
import 'package:erp_school/constants/app_constants.dart';
import 'package:erp_school/data/models/response/homework_summary.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/api_cache_manager.dart';
import 'School_service.dart';
class   HomeworkService {
  List<dynamic> classMappings = [];
  List<String> grades = [];
  List<String> sections = [];
  String? selectedGrade;
  String? selectedSection;
  String? selectedGradeId;
  String? selectedSectionId;

  Future<void> loadData(Function(List<dynamic>, List<String>) onDataLoaded) async {
    final apiCacheManager = ApiCacheManager();
    List<dynamic> data = await apiCacheManager.getClassMappings();
    classMappings = data;
    grades = data.map((e) => e[ApiCacheManager.KEY_GRADE] as String).toSet().toList();
    onDataLoaded(classMappings, grades);
  }

  void updateSections(String grade, Function(List<String>, String?) onSectionsUpdated) {
    final filtered = classMappings.where((e) => e[ApiCacheManager.KEY_GRADE] == grade).toList();
    selectedGrade = grade;
    selectedGradeId = filtered.first[ApiCacheManager.KEY_GRADE_ID];
    sections = filtered.map((e) => e[ApiCacheManager.KEY_SECTION] as String).toSet().toList();
    onSectionsUpdated(sections, null);
  }
  Future<StudentHomework> fetchStudentHomework() async {
    try {
      // Get the saved username from SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? savedUsername = prefs.getString('username');
      // String? savedUsername = prefs.getString('username');
      String? type = prefs.getString('type')?.toLowerCase();
      int? schoolId = await SchoolService.getSchoolId();
      int? teacherId = prefs.getInt('teacherId');
      int? studentId = prefs.getInt('studentId');
      int? studentGradeId = prefs.getInt('gradeId');
      int? studentSectionId = prefs.getInt('sectionId');

      final yeardate = DateFormat("yyyy").format(DateTime.now());

      print("Fetching homework for Grade: $selectedGradeId, Section: $selectedSectionId");

      final monthdate = DateFormat("MM").format(DateTime.now());
      final apiUrl = type == STUDENT
       ? "https://www.sutramsol.in/academic-service-dev/api/v1/homework/student/$savedUsername/$monthdate/$yeardate"
          : "https://www.sutramsol.in/academic-service-dev/api/v1/homework/teacher/$savedUsername/$monthdate/$yeardate/$selectedGradeId/$selectedSectionId/$schoolId";

      print("Fetching homework from API: $apiUrl");

      final response = await ApiUtil.getRequest(apiUrl);
      print("Response received: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print("Received Homework Data: $data");
        return StudentHomework.fromJson(data);
      } else {
        print("Failed to load homework data: error ${response.statusCode}");
        return StudentHomework(
          homeworkDetailsList: [],
          homeworkSummary: HomeworkSummary.empty(),
        );
      }
    } catch (e) {
      print("Error occurred while fetching homework data: $e");

      return StudentHomework(
        homeworkDetailsList: [],
        homeworkSummary: HomeworkSummary.empty(),
      );
    }
  }
  Future<StudentHomework> fetchFinalStudentHomework() async {
    try {
      // Get the saved username from SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // String? savedUsername = prefs.getString('username');
      String? savedUsername = prefs.getString('username');
      String? type = prefs.getString('type')?.toLowerCase();
      int? schoolId = await SchoolService.getSchoolId();
      final date = DateFormat("yyyy").format(DateTime.now());
      print('The saved use name --> $savedUsername $type');
      final monthdate = DateFormat("MM").format(DateTime.now());
      final yeardate = DateFormat("yyyy").format(DateTime.now());
      print("print class id check $selectedGradeId Selected sectionId $selectedSectionId");
      final String apiUrl = "https://www.sutramsol.in/academic-service-dev/api/v1/homework/teacher/$savedUsername/$monthdate/$yeardate/$selectedGradeId/$selectedSectionId/$schoolId";
      print("get homework api ink ---> $apiUrl");

      final response = await ApiUtil.getRequest(apiUrl); // await http.get(Uri.parse(apiUrl));
      print("The respone--->  response${response.body}");
      print("The respone--->  body $jsonDecode{response}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print("The data --> $data");
        return StudentHomework.fromJson(data);
      } else {
        print("Failed to load homework data: ${response.statusCode}");
        throw Exception("No homework submitted");
      }
    } catch (e) {
      print("Error occurred while fetching homework data: $e");
      throw Exception("No homework data found");
    }
  }

  /// 🔹 **Helper Function: Remove Duplicate Homework by `homeworkId`**
  List<Map<String, dynamic>> removeDuplicateHomeworks(List<Map<String, dynamic>> homeworks) {
    final uniqueHomeworks = <int, Map<String, dynamic>>{}; // Map to store unique homework entries

    for (var hw in homeworks) {
      if (hw.containsKey('homeworkId')) {
        uniqueHomeworks[hw['homeworkId']] = hw;
      }
    }

    return uniqueHomeworks.values.toList();
  }

}