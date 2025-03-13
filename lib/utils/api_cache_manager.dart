// import 'dart:convert';
// import 'package:erp_school/utils/shared_preference_util.dart';
// class ApiCacheManager {
//   static const KEY_CLASS_MAPPINGS = 'class_mappings';
//   static const KEY_GRADE = 'grade';
//   static const KEY_GRADE_ID = 'grade_id';
//   static const KEY_SECTION = 'section';
//   static const KEY_SECTION_ID = 'section_id';
//   static const KEY_SUBJECT = 'subjects';  // New key for subjectId
//   static const KEY_SUBJECT_ID = 'subject_id';  // New key for subjectId
//   static const KEY_SUBJECT_NAME = 'subject_name';  // New key for subjectName
//
//   static ApiCacheManager _instance = ApiCacheManager._internal();
//
//   // Private constructor
//   ApiCacheManager._internal();
//
//   factory ApiCacheManager() {
//     return _instance;
//   }
//
//   void temp(dynamic message) {
//     print("ishwar:new: $message");
//   }
//
//   Future<void> saveClassMappings(Map<String, dynamic> data) async {
//     List<Map<String, String>> result = [];
//
//     Map<String, dynamic> mappings = data['user']['classMappings'];
//     for (final mapping in mappings.entries) {
//       final classData = mapping.key.split('-');
//       final gradeData = classData.first.split(':');
//       final sectionData = classData.last.split(':');
//
//       // Creating a Map to store class details
//       Map<String, String> item = {};
//       item[KEY_GRADE] = gradeData.last;
//       item[KEY_GRADE_ID] = gradeData.first;
//       item[KEY_SECTION] = sectionData.last;
//       item[KEY_SECTION_ID] = sectionData.first;
//
//       // Now we need to process the subjects
//       List<Map<String, String>> subjectList = [];
//       for (var subject in mapping.value) {
//         final subjectData = subject.split(':');
//         if (subjectData.length == 2) {
//           Map<String, String> subjectItem = {};
//           subjectItem[KEY_SUBJECT_ID] = subjectData.first;
//           subjectItem[KEY_SUBJECT_NAME] = subjectData.last;
//           subjectList.add(subjectItem);
//         }
//       }
//
//       // Adding the subject data to the main item
//       item[KEY_SUBJECT] = jsonEncode(subjectList); // Save as JSON string
//       result.add(item);
//     }
//
//     print("Mapping result: $result");
//
//     // Saving the final data to shared preferences
//     final shared = await SharedPreferenceUtil.getInstance();
//     shared.setString(KEY_CLASS_MAPPINGS, jsonEncode(result));
//   }
//
//   Future<List<dynamic>> getClassMappings() async {
//     final shared = await SharedPreferenceUtil.getInstance();
//     return Future.value(jsonDecode(shared.getString(KEY_CLASS_MAPPINGS) ?? '[]'));
//
//   }
//
//
//   static int extractTeacherId(String loginID) {
//
//     final pattern = RegExp(r'^[^\s]+T([0-9]+)$');
//     final result = pattern.firstMatch(loginID);
//     return int.parse(result?.group(1) ?? '0');
//   }
// }
import 'dart:convert';
import 'package:erp_school/utils/shared_preference_util.dart';

class ApiCacheManager {
  static const KEY_CLASS_MAPPINGS = 'class_mappings';
  static const KEY_GRADE = 'grade';
  static const KEY_GRADE_ID = 'grade_id';
  static const KEY_SECTION = 'section';
  static const KEY_SECTION_ID = 'section_id';
  static const KEY_SUBJECT = 'subjects';  // New key for subjectId
  static const KEY_SUBJECT_ID = 'subject_id';  // New key for subjectId
  static const KEY_SUBJECT_NAME = 'subject_name';  // New key for subjectName

  static ApiCacheManager _instance = ApiCacheManager._internal();

  // Private constructor
  ApiCacheManager._internal();

  factory ApiCacheManager() {
    return _instance;
  }

  void temp(dynamic message) {
    print("ishwar:new: $message");
  }

  Future<void> saveClassMappings(Map<String, dynamic> data) async {
    List<Map<String, String>> result = [];

    Map<String, dynamic> mappings = data['user']['classMappings'];
    for (final mapping in mappings.entries) {
      final classData = mapping.key.split('-');
      final gradeData = classData.first.split(':');
      final sectionData = classData.last.split(':');

      // Creating a Map to store class details
      Map<String, String> item = {};
      item[KEY_GRADE] = gradeData.last;
      item[KEY_GRADE_ID] = gradeData.first;
      item[KEY_SECTION] = sectionData.last;
      item[KEY_SECTION_ID] = sectionData.first;

      // Now we need to process the subjects
      List<Map<String, String>> subjectList = [];
      for (var subject in mapping.value) {
        final subjectData = subject.split(':');
        if (subjectData.length == 2) {
          Map<String, String> subjectItem = {};
          subjectItem[KEY_SUBJECT_ID] = subjectData.first;
          subjectItem[KEY_SUBJECT_NAME] = subjectData.last;
          subjectList.add(subjectItem);
        }
      }

      // Adding the subject data to the main item
      item[KEY_SUBJECT] = jsonEncode(subjectList); // Save as JSON string
      result.add(item);
    }

    print("Mapping result: $result");

    // Saving the final data to shared preferences
    final shared = await SharedPreferenceUtil.getInstance();
    shared.setString(KEY_CLASS_MAPPINGS, jsonEncode(result));
  }
  Future<List<dynamic>> getClassMappings() async {
    final shared = await SharedPreferenceUtil.getInstance();
    List<dynamic> mappings = jsonDecode(shared.getString(KEY_CLASS_MAPPINGS) ?? '[]');

    // Sort mappings dynamically based on grade
    mappings.sort((a, b) => a[KEY_GRADE].compareTo(b[KEY_GRADE]));

    return Future.value(mappings);
  }

  static int extractTeacherId(String loginID) {
    final pattern = RegExp(r'^[^\s]+T([0-9]+)$');
    final result = pattern.firstMatch(loginID);
    return int.parse(result?.group(1) ?? '0');
  }
}
