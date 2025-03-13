import 'dart:convert';
import 'package:erp_school/api/api_util.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'School_service.dart';
class StudentClassdairyService {
  List<dynamic> classMappings = [];
  List<String> grades = [];
  List<String> sections = [];
  String? selectedGrade;
  String? selectedSection;
  String? selectedGradeId;
  String? selectedSectionId;

  // Future<void> loadData(Function(List<dynamic>, List<String>) onDataLoaded) async {
  //   try {
  //     final apiCacheManager = ApiCacheManager();
  //     List<dynamic> data = await apiCacheManager.getClassMappings();
  //     if (data.isNotEmpty) {
  //       classMappings = data;
  //       grades = data
  //           .map((e) => e[ApiCacheManager.KEY_GRADE] as String?)
  //           .where((e) => e != null)
  //           .cast<String>()
  //           .toSet()
  //           .toList();
  //       onDataLoaded(classMappings, grades);
  //     } else {
  //       onDataLoaded([], []);
  //     }
  //   } catch (e) {
  //     print("Error loading class mappings: $e");
  //     onDataLoaded([], []);
  //   }
  // }
  //
  // void updateSections(String grade, Function(List<String>, String?) onSectionsUpdated) {
  //   final filtered = classMappings.where((e) => e[ApiCacheManager.KEY_GRADE] == grade).toList();
  //
  //   if (filtered.isNotEmpty) {
  //     selectedGrade = grade;
  //     selectedGradeId = filtered.first[ApiCacheManager.KEY_GRADE_ID];
  //     sections = filtered
  //         .map((e) => e[ApiCacheManager.KEY_SECTION] as String?)
  //         .where((e) => e != null)
  //         .cast<String>()
  //         .toSet()
  //         .toList();
  //     onSectionsUpdated(sections, null);
  //   } else {
  //     selectedGrade = null;
  //     selectedGradeId = null;
  //     sections = [];
  //     onSectionsUpdated([], null);
  //   }
  // }
  String? moduleSelected = "";
  Future<StudentViewClassDiary> fetchStudentClassDiaryDetails() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? savedUsername = prefs.getString('username');
      int? schoolId = await SchoolService.getSchoolId();
      final yeardate = DateFormat("yyyy").format(DateTime.now());
      final monthdate = DateFormat("MM").format(DateTime.now());

      print("Fetching homework for Grade: $selectedGradeId, Section: $selectedSectionId");
      moduleSelected = prefs.getString('type')?.toLowerCase();
      int? studentId = prefs.getInt('studentId');
      int? studentGradeId = prefs.getInt('gradeId');
      int? studentSectionId = prefs.getInt('sectionId');
      print("print $studentGradeId");
      print("print $studentSectionId");

      // final url = type == STUDENT
      // final Apiurl = moduleSelected == 'student'? 'https://www.sutramsol.in/ssapigw-dev/academic-dev/api/v1/classdairy/student/$studentGradeId/$studentSectionId/$schoolId'
      //      : "https://www.sutramsol.in/academic-service-dev/api/v1/classdairy/teacher/$savedUsername/$monthdate/$yeardate/$selectedGradeId/$selectedSectionId/$schoolId" ;

      final Apiurl = 'https://www.sutramsol.in/ssapigw-dev/academic-dev/api/v1/classdairy/student/$studentGradeId/$studentSectionId/$schoolId';
          // : "https://www.sutramsol.in/academic-service-dev/api/v1/classdairy/teacher/$savedUsername/$monthdate/$yeardate/$selectedGradeId/$selectedSectionId/$schoolId" ;

      // final String apiUrl =
      //     "https://www.sutramsol.in/academic-service-dev/api/v1/classdairy/teacher/$savedUsername/$monthdate/$yeardate/$selectedGradeId/$selectedSectionId/$schoolId";
      print("Fetching homework from API: $Apiurl");

      final response = await ApiUtil.getRequest(Apiurl);
      print("Response received: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print("Received Homework Data: $data");
        return StudentViewClassDiary.fromJson(data);
      } else {
        print("Failed to load homework data: ${response.statusCode}");
        return StudentViewClassDiary(classDiaryList: []);
      }
    } catch (e) {
      print("Error occurred while fetching homework data: $e");
      return StudentViewClassDiary(classDiaryList: []);
    }
  }
}

class StudentViewClassDiary {
  List<StudentClassDiaryList>? classDiaryList;

  StudentViewClassDiary({this.classDiaryList});

  factory StudentViewClassDiary.fromJson(Map<String, dynamic> json) {
    return StudentViewClassDiary(
      classDiaryList: (json['classDairyList'] as List?)
          ?.map((v) => StudentClassDiaryList.fromJson(v))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'classDairyList': classDiaryList?.map((v) => v.toJson()).toList(),
    };
  }
}

class StudentClassDiaryList {
  int? classDiaryId;
  String? className;
  String? sectionName;
  String? subjectName;
  String? teacherName;
  String? title;
  String? description;
  String? createDate;

  StudentClassDiaryList({
    this.classDiaryId,
    this.className,
    this.sectionName,
    this.subjectName,
    this.teacherName,
    this.title,
    this.description,
    this.createDate,
  });

  factory StudentClassDiaryList.fromJson(Map<String, dynamic> json) {
    return StudentClassDiaryList(
      classDiaryId: json['classDairyId'] ?? "",
      className: json['className'] ?? "",
      sectionName: json['sectionName'] ?? "",
      subjectName: json['subjectName'] ?? "",
      teacherName: json['teacherName'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      createDate: json['createdOn'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'classDairyId': classDiaryId,
      'className': className,
      'sectionName': sectionName,
      'subjectName': subjectName,
      'teacherName': teacherName,
      'title': title,
      'description': description,
      'createdOn': createDate,
    };
  }
}

class ModuleSelectionClass {
  static Future<String?> selectmoduletype() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('type')?.toLowerCase();
  }
}
