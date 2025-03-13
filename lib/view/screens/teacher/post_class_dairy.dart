// import 'dart:convert';
// import 'package:erp_school/utils/dimensions.dart';
// import 'package:erp_school/utils/styles.dart';
// import 'package:erp_school/view/base/custom_appbar.dart';
// import 'package:erp_school/view/base/custom_button.dart';
// import 'package:erp_school/view/base/custom_dropdown.dart';
// import 'package:erp_school/view/screens/teacher/teacher_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../services/class_dairy_service.dart';
// import '../../../utils/api_cache_manager.dart';
// class PostClassDairy extends StatefulWidget {
//   const PostClassDairy({super.key});
//   @override
//   State<PostClassDairy> createState() => _PostClassDairyState();
// }
// class _PostClassDairyState extends State<PostClassDairy> {
//   List<dynamic> classMappings = [];
//   String? selectedGrade;
//   String? selectedGradeId;
//   String? selectedSection;
//   String? selectedSectionId;
//   String? selectedSubject;
//   String? selectedSubjectId;
//   List<String> grades = [];
//   List<String> sections = [];
//   List<String> subjects = [];
//   bool isGradeValid = true;
//   bool isSectionValid = true;
//   bool isSubjectValid = true;
//   bool isTitleValid = true;
//   bool isDescriptionValid = true;
//
//   TextEditingController titleController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   @override
//   void initState() {
//     super.initState();
//     loadData();
//   }
//   Future<void> loadData() async {
//     final apiCacheManager = ApiCacheManager();
//     List<dynamic> data = await apiCacheManager.getClassMappings();
//
//     setState(() {
//       classMappings = data;
//       grades = data.map((e) => e[ApiCacheManager.KEY_GRADE] as String).toSet().toList();
//     });
//   }
//   void updateSections(String grade) {
//     final filtered = classMappings.where((e) => e[ApiCacheManager.KEY_GRADE] == grade).toList();
//     setState(() {
//       selectedGrade = grade;
//       selectedGradeId = filtered.first[ApiCacheManager.KEY_GRADE_ID]; // Store Grade ID
//       sections = filtered.map((e) => e[ApiCacheManager.KEY_SECTION] as String).toSet().toList();
//       selectedSection = null;
//       selectedSectionId = null;
//       subjects = [];
//       selectedSubject = null;
//     });
//   }
//   void updateSubjectsss(String section) {
//     final filtered = classMappings.firstWhere(
//           (e) => e[ApiCacheManager.KEY_GRADE] == selectedGrade && e[ApiCacheManager.KEY_SECTION] == section,
//       orElse: () => {},
//     );
//     if (filtered.isNotEmpty) {
//       List<dynamic> subjectList = jsonDecode(filtered[ApiCacheManager.KEY_SUBJECT]);
//       setState(() {
//         selectedSection = section;
//         selectedSectionId = filtered[ApiCacheManager.KEY_SECTION_ID]; // Store Section ID
//         subjects = subjectList.map((e) => e[ApiCacheManager.KEY_SUBJECT_NAME] as String).toList();
//         selectedSubject = null;
//         selectedSubjectId = null; // Reset the subject ID
//       });
//     }
//   }
//   String _getSubjectIdFromName(String subjectName) {
//     final selectedGradeData = classMappings.firstWhere(
//           (e) => e[ApiCacheManager.KEY_GRADE] == selectedGrade && e[ApiCacheManager.KEY_SECTION] == selectedSection,
//       orElse: () => {},
//     );
//     if (selectedGradeData.isNotEmpty) {
//       List<dynamic> subjectsList = jsonDecode(selectedGradeData[ApiCacheManager.KEY_SUBJECT]);
//       final subjectData = subjectsList.firstWhere(
//             (subject) => subject[ApiCacheManager.KEY_SUBJECT_NAME] == subjectName,
//         orElse: () => {},
//       );
//       return subjectData.isNotEmpty ? subjectData[ApiCacheManager.KEY_SUBJECT_ID] : '';
//     }
//     return ''; // Return an empty string if no subject is found
//   }
//   void updateSubjects(String section) {
//     // Find the filtered class data for the selected grade and section
//     final filtered = classMappings.firstWhere(
//           (e) => e[ApiCacheManager.KEY_GRADE] == selectedGrade && e[ApiCacheManager.KEY_SECTION] == section,
//       orElse: () => {},
//     );
//     if (filtered.isNotEmpty) {
//       // Decode the subjects JSON data
//       List<dynamic> subjectList = jsonDecode(filtered[ApiCacheManager.KEY_SUBJECT]);
//
//       print("Selected subject ${subjectList}");
//       // Find the selected subject data
//       final selectedSubjectData = subjectList.firstWhere(
//             (e) => e[ApiCacheManager.KEY_SUBJECT_NAME] == selectedSubject,
//         orElse: () => {},
//       );
//       setState(() {
//         selectedSection = section;
//         selectedSectionId = filtered[ApiCacheManager.KEY_SECTION_ID]; // Store Section ID
//         // Map the subjects list and set it
//         subjects = subjectList.map((e) => e[ApiCacheManager.KEY_SUBJECT_NAME] as String).toList();
//
//         // Set the selected subject and subject ID
//         selectedSubjectId = selectedSubjectData.isNotEmpty
//             ? selectedSubjectData[ApiCacheManager.KEY_SUBJECT_ID] // Get subject ID
//             : null;
//         print("Selected Grade: $selectedGrade, Grade ID: $selectedGradeId");
//         print("Selected Section: $selectedSection, Section ID: $selectedSectionId");
//         print("Selected Subject: $selectedSubject");
//         print("Selected Subject ID: $selectedSubjectId");
//       });
//     }
//   }
//   Future<void> submitClassDairy() async {
//     setState(() {
//       isGradeValid = selectedGrade != null && selectedGrade!.isNotEmpty;
//       isSectionValid = selectedSection != null && selectedSection!.isNotEmpty;
//       isSubjectValid = selectedSubject != null && selectedSubject!.isNotEmpty;
//       isTitleValid = titleController.text.isNotEmpty;
//       isDescriptionValid = descriptionController.text.isNotEmpty;
//     });
//
//     if (!isGradeValid || !isSectionValid || !isSubjectValid || !isTitleValid || !isDescriptionValid) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(backgroundColor: Colors.red, content: Text("Please fill all the required fields.")),
//       );
//       return;
//     }
//     Get.to(TeacherScreen());
//     try {
//       int? teacherId = await ClassDairyService.getTeacherId();
//
//       if (teacherId == null) {
//         print("Error: Teacher ID not found!");
//         return;
//       }
//       // Create the request DTO
//       ClassDairyServiceRequestDTO classDairy = ClassDairyServiceRequestDTO(
//         classId: int.parse(selectedGradeId!),
//         sectionId: int.parse(selectedSectionId!) ,
//         subjectId: int.parse(selectedSubjectId!),
//         teacherId: teacherId,
//         schoolId: 1,
//         title: titleController.text,
//         description: descriptionController.text,
//       );
//       // Call API service with the DTO object
//       ClassDairyServiceResponseDTO? response =
//       await ClassDairyService.saveClassDairyService(classDairy);
//
//       if (response != null) {
//         print("Data saved successfully! Response ID: ${response.id}");
//       } else {
//         print(" Failed to save data. API returned null.");
//       }
//     } catch (e) {
//       print("Exception while submitting Class Diary: $e");
//     }
//   }
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).highlightColor,
//       appBar: CustomAppBar(
//         title: 'Add class Diary'.tr,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: 12),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 20,
//               ),
//               Center(
//                 child: Text(
//                   'Manage your daily classroom activities effortlessly.'.tr,
//                   style: interMedium.copyWith(
//                       fontSize: 13, color: Theme.of(context).disabledColor),
//                 ),
//               ),
//               SizedBox(
//                 height: 25,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                       child: Column(
//                         children: [
//                           Align(
//                             alignment: Alignment.topLeft,
//                             child: Text(
//                               "select_class".tr,
//                               style: interMedium.copyWith(
//                                   fontSize: Dimensions.fontSizeExtraSmall,
//                                   height: 1.4,
//                                   color: Theme.of(context).disabledColor),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: Dimensions.radiusSmall,
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Theme.of(context).cardColor,
//                               boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 4)],
//                               borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
//                             ),
//                             child: DropdownButton<String>(
//                               dropdownColor: Colors.white,
//                               focusColor: Colors.black,
//                               underline: SizedBox(),
//                               value: selectedGrade,
//                               hint: Text("Select Class"),
//                               items: grades.map((String grade) {
//                                 return DropdownMenuItem<String>(
//                                   value: grade,
//                                   child: Text(grade, style: TextStyle(color: Colors.black45)),
//                                 );
//                               }).toList(),
//                               onChanged: (value) {
//                                 updateSections(value!);
//                                 isGradeValid = value != null && value.isNotEmpty;
//                                 print("Selected Grade: $value, Grade ID: $selectedGradeId"); // This will print the selected grade and its ID
//                               },
//                             ),
//                           ),
//                         ],
//                       )),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Expanded(
//                       child: Column(
//                         children: [
//                           Align(
//                             alignment: Alignment.topLeft,
//                             child: Text(
//                               "select_section".tr,
//                               style: interMedium.copyWith(
//                                   fontSize: Dimensions.fontSizeExtraSmall,
//                                   height: 1.4,
//                                   color: Theme.of(context).disabledColor),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: Dimensions.radiusSmall,
//                           ),
//                           // Section Dropdown
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Theme.of(context).cardColor,
//                               boxShadow: [BoxShadow()],
//                               borderRadius:
//                               BorderRadius.circular(Dimensions.radiusDefault),
//                             ),
//                             child: Center(
//                               child: DropdownButton<String>(
//                                 dropdownColor: Colors.white,
//                                 focusColor: Colors.black,
//                                 underline: SizedBox(),
//                                 value: selectedSection,
//                                 hint: Text("Select Section"),
//                                 items: sections.map((String section) {
//                                   return DropdownMenuItem<String>(
//                                     value: section,
//                                     child: Text(section,style: TextStyle(color: Colors.black45)),
//                                   );
//                                 }).toList(),
//                                 onChanged: (value) {
//                                   updateSubjects(value!);
//                                   isSectionValid = value != null && value.isNotEmpty;
//                                 },
//                               ),
//                             ),
//                           ),
//
//                         ],
//                       ))
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Column(
//                 children: [
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Text(
//                       "select_subject".tr,
//                       style: interMedium.copyWith(
//                           fontSize: Dimensions.fontSizeExtraSmall,
//                           height: 1.4,
//                           color: Theme.of(context).disabledColor),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: Dimensions.radiusSmall,
//                   ),
//                   // Subject Dropdown
//                   Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).cardColor,
//                       boxShadow: [BoxShadow()],
//                       borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
//                     ),
//                     child: Center(
//                       child: DropdownButton<String>(
//                         dropdownColor: Colors.white,
//                         focusColor: Colors.black,
//                         underline: SizedBox(),
//                         value: selectedSubject,
//                         hint: Text("Select Subject"),
//                         items: subjects.map((String subject) {
//                           return DropdownMenuItem<String>(
//                             value: subject,
//                             child: Text(subject, style: TextStyle(color: Colors.black45)),
//                           );
//                         }).toList(),
//                         onChanged: (value) {
//                           setState(() {
//                             selectedSubject = value;
//                             selectedSubjectId = _getSubjectIdFromName(value!); // Update subject ID
//                             isSubjectValid = value != null && value.isNotEmpty;
//                           });
//                           print("Selected Subject: $selectedSubject, Subject ID: $selectedSubjectId");
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Column(
//                 children: [
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Text(
//                       "title".tr + '*',
//                       style: interMedium.copyWith(
//                           fontSize: Dimensions.fontSizeExtraSmall,
//                           height: 1.4,
//                           color: Theme.of(context).disabledColor),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: Dimensions.radiusSmall,
//                   ),
//                   Container(
//                     height: 100,
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).cardColor,
//                       boxShadow: [BoxShadow()],
//                       borderRadius:
//                       BorderRadius.circular(Dimensions.radiusDefault),
//                     ),
//                     child: TextField(
//                       controller: titleController,
//                       maxLines: 5,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: 'enter_title_here'.tr,
//                         contentPadding:
//                         EdgeInsets.symmetric(horizontal: 12, vertical: 5),
//                         hintStyle: interMedium.copyWith(
//                             fontSize: Dimensions.fontSizeExtraSmall,
//                             color: Theme.of(context).disabledColor),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Column(
//                 children: [
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Text(
//                       "description".tr + '*',
//                       style: interMedium.copyWith(
//                           fontSize: Dimensions.fontSizeExtraSmall,
//                           height: 1.4,
//                           color: Theme.of(context).disabledColor),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: Dimensions.radiusSmall,
//                   ),
//                   Container(
//                       height: 100,
//                       decoration: BoxDecoration(
//                         color: Theme.of(context).cardColor,
//                         boxShadow: [BoxShadow()],
//                         borderRadius:
//                         BorderRadius.circular(Dimensions.radiusDefault),
//                       ),
//                       child: TextField(
//                         controller: descriptionController,
//                         maxLines: 5,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: 'enter_description_here'.tr,
//                           contentPadding:
//                           EdgeInsets.symmetric(horizontal: 12, vertical: 5),
//                           hintStyle: interMedium.copyWith(
//                               fontSize: Dimensions.fontSizeExtraSmall,
//                               color: Theme.of(context).disabledColor),
//                         ),
//                       )),
//                 ],
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               CustomButton(
//                 title: 'mark_attendance'.tr,
//                 fontSize: 16,
//                 onPressed: () {
//                   submitClassDairy();
//                 },
//
//                 border: false,
//                 radius: 50,
//                 color: true,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:erp_school/view/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../services/School_service.dart';
import '../../../services/class_dairy_service.dart';
import '../../../utils/api_cache_manager.dart';
class PostClassDairy extends StatefulWidget {
  const PostClassDairy({super.key});
  @override
  State<PostClassDairy> createState() => _PostClassDairyState();
}
class _PostClassDairyState extends State<PostClassDairy> {
  List<dynamic> classMappings = [];
  String? selectedGrade;
  String? selectedGradeId;
  String? selectedSection;
  String? selectedSectionId;
  String? selectedSubject;
  String? selectedSubjectId;
  List<String> grades = [];
  List<String> sections = [];
  List<String> subjects = [];
  bool isGradeValid = true;
  bool isSectionValid = true;
  bool isSubjectValid = true;
  bool isTitleValid = true;
  bool isDescriptionValid = true;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  void initState() {
    super.initState();
    loadData();
  }
  Future<void> loadData() async {
    final apiCacheManager = ApiCacheManager();
    List<dynamic> data = await apiCacheManager.getClassMappings();

    setState(() {
      classMappings = data;
      grades = data.map((e) => e[ApiCacheManager.KEY_GRADE] as String).toSet().toList();
    });
  }
  void updateSections(String grade) {
    final filtered = classMappings.where((e) => e[ApiCacheManager.KEY_GRADE] == grade).toList();
    setState(() {
      selectedGrade = grade;
      selectedGradeId = filtered.first[ApiCacheManager.KEY_GRADE_ID]; // Store Grade ID
      sections = filtered.map((e) => e[ApiCacheManager.KEY_SECTION] as String).toSet().toList();
      selectedSection = null;
      selectedSectionId = null;
      subjects = [];
      selectedSubject = null;
    });
  }
  void updateSubjectsss(String section) {
    final filtered = classMappings.firstWhere(
          (e) => e[ApiCacheManager.KEY_GRADE] == selectedGrade && e[ApiCacheManager.KEY_SECTION] == section,
      orElse: () => {},
    );
    if (filtered.isNotEmpty) {
      List<dynamic> subjectList = jsonDecode(filtered[ApiCacheManager.KEY_SUBJECT]);
      setState(() {
        selectedSection = section;
        selectedSectionId = filtered[ApiCacheManager.KEY_SECTION_ID]; // Store Section ID
        subjects = subjectList.map((e) => e[ApiCacheManager.KEY_SUBJECT_NAME] as String).toList();
        selectedSubject = null;
        selectedSubjectId = null; // Reset the subject ID
      });
    }
  }
  String _getSubjectIdFromName(String subjectName) {
    final selectedGradeData = classMappings.firstWhere(
          (e) => e[ApiCacheManager.KEY_GRADE] == selectedGrade && e[ApiCacheManager.KEY_SECTION] == selectedSection,
      orElse: () => {},
    );
    if (selectedGradeData.isNotEmpty) {
      List<dynamic> subjectsList = jsonDecode(selectedGradeData[ApiCacheManager.KEY_SUBJECT]);
      final subjectData = subjectsList.firstWhere(
            (subject) => subject[ApiCacheManager.KEY_SUBJECT_NAME] == subjectName,
        orElse: () => {},
      );
      return subjectData.isNotEmpty ? subjectData[ApiCacheManager.KEY_SUBJECT_ID] : '';
    }
    return ''; // Return an empty string if no subject is found
  }
  void updateSubjects(String section) {
    // Find the filtered class data for the selected grade and section
    final filtered = classMappings.firstWhere(
          (e) => e[ApiCacheManager.KEY_GRADE] == selectedGrade && e[ApiCacheManager.KEY_SECTION] == section,
      orElse: () => {},
    );
    if (filtered.isNotEmpty) {
      // Decode the subjects JSON data
      List<dynamic> subjectList = jsonDecode(filtered[ApiCacheManager.KEY_SUBJECT]);

      print("Selected subject ${subjectList}");
      // Find the selected subject data
      final selectedSubjectData = subjectList.firstWhere(
            (e) => e[ApiCacheManager.KEY_SUBJECT_NAME] == selectedSubject,
        orElse: () => {},
      );
      setState(() {
        selectedSection = section;
        selectedSectionId = filtered[ApiCacheManager.KEY_SECTION_ID]; // Store Section ID
        // Map the subjects list and set it
        subjects = subjectList.map((e) => e[ApiCacheManager.KEY_SUBJECT_NAME] as String).toList();

        // Set the selected subject and subject ID
        selectedSubjectId = selectedSubjectData.isNotEmpty
            ? selectedSubjectData[ApiCacheManager.KEY_SUBJECT_ID] // Get subject ID
            : null;
        print("Selected Grade: $selectedGrade, Grade ID: $selectedGradeId");
        print("Selected Section: $selectedSection, Section ID: $selectedSectionId");
        print("Selected Subject: $selectedSubject");
        print("Selected Subject ID: $selectedSubjectId");
      });
    }
  }
  Future<void> submitClassDairy() async {
    setState(() {
      isGradeValid = selectedGrade != null && selectedGrade!.isNotEmpty;
      isSectionValid = selectedSection != null && selectedSection!.isNotEmpty;
      isSubjectValid = selectedSubject != null && selectedSubject!.isNotEmpty;
      isTitleValid = titleController.text.isNotEmpty;
      isDescriptionValid = descriptionController.text.isNotEmpty;
    });

    if (!isGradeValid || !isSectionValid || !isSubjectValid || !isTitleValid || !isDescriptionValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text("Please fill all the required fields.")),
      );
      return;
    }


    // SnackBar(
    //     backgroundColor: Colors.blue,
    //     content: Text(
    //       "Class Diary Posted successfully",
    //       style: TextStyle(fontSize: 12, color: Colors.blue),
    //     ));
    // Get.offAll(ViewDairyScreen());
    try {
      // int? teacherId = await ClassDairyService.getTeacherId();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? schoolId = await SchoolService.getSchoolId();
      int? teacherId = await prefs.getInt('teacherId');

      if (teacherId == null || schoolId == null) {
        print("Error: Teacher ID not found!");
        return;
      }
      // Create the request DTO
      ClassDairyServiceRequestDTO classDairy = ClassDairyServiceRequestDTO(
        classId: int.parse(selectedGradeId!),
        sectionId: int.parse(selectedSectionId!) ,
        subjectId: int.parse(selectedSubjectId!),
        teacherId: teacherId,
        schoolId: schoolId /*int.parse(schoolId)*/ ,
        title: titleController.text,
        description: descriptionController.text,
      );
      // Call API service with the DTO object
      ClassDairyServiceResponseDTO? response =
      await ClassDairyService.saveClassDairyService(classDairy);
      if (response != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).primaryColor,
            content: Text("Class diary posted successfully"),
          ),
        );
        Navigator.pop(context);
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ViewDairyScreen()));
        print("Data saved successfully! Response ID: ${response.id}");
        SnackBar(backgroundColor: Colors.blue, content: Text("Class Diary Posted successfully5"));
      } else {
        print(" Failed to save data. API returned null.");
      }
    } catch (e) {
      print("Exception while submitting Class Diary: $e");
    }
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      appBar: CustomAppBar(
        title: 'Add class Diary'.tr,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Manage your daily classroom activities effortlessly.'.tr,
                  style: interMedium.copyWith(
                      fontSize: 13, color: Theme.of(context).disabledColor),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: Dimensions.radiusSmall,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 4)],
                      borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      dropdownColor: Colors.white,
                      focusColor: Colors.black,
                      underline: SizedBox(),
                      value: selectedGrade,
                      hint: RichText(text: TextSpan(
                          children: [
                            TextSpan(text: "   Select Class",style: TextStyle(color: Colors.grey[600],fontSize: 16 ,fontWeight: FontWeight.w400)),
                            TextSpan(text: "*",style: TextStyle(color: Colors.red)),
                          ]
                      )),
                      items: grades.map((String grade) {
                        return DropdownMenuItem<String>(
                          value: grade,
                          child: Row(
                            children: [
                              Radio<String>(
                                activeColor: Colors.blue,
                                fillColor: WidgetStateProperty.resolveWith(
                                      (states) {
                                    if (states.contains(WidgetState.selected)) {
                                      return Colors.blue;
                                    }
                                    return Colors.blue;
                                  },
                                ),
                                value: grade,
                                groupValue: selectedGrade,
                                onChanged: /*(String? value) {
                                  if (value != null) {
                                    setState(() {
                                      selectedGrade = value;
                                    });
                                    updateSections(value);
                                    updateSubjects(value);
                                    Navigator.pop(context);
                                  }
                                },*/
                                null
                              ),
                              Text(grade, style: TextStyle(color: Colors.black45)),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        updateSections(value!);
                        isGradeValid = value.isNotEmpty;
                        Future.microtask(() {
                          // Navigator.pop(context);
                        });
                        print("Selected Grade: $value, Grade ID: $selectedGradeId"); // This will print the selected grade and its ID
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
              height: 10,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: Dimensions.radiusSmall,
                  ),
                  // Section Dropdown
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 4)],
                      borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      dropdownColor: Colors.white,
                      focusColor: Colors.black,
                      underline: SizedBox(),
                      value: selectedSection,
                      hint: RichText(text: TextSpan(
                          children: [
                            TextSpan(text: "   Select Section",style: TextStyle(color: Colors.grey[600],fontSize: 16 ,fontWeight: FontWeight.w400)),
                            TextSpan(text: "*",style: TextStyle(color: Colors.red)),
                          ]
                      )),
                      items: sections.map((String section) {
                        return DropdownMenuItem<String>(
                          value: section,
                          child: Row(
                            children: [
                              Radio<String>(
                                activeColor: Colors.blue,
                                fillColor: WidgetStateProperty.resolveWith(
                                      (states) {
                                    if (states.contains(WidgetState.selected)) {
                                      return Colors.blue;
                                    }
                                    return Colors.blue;
                                  },
                                ),
                                value: section,
                                groupValue: selectedSection,
                                onChanged:/* (String? value) {
                                  if (value != null) {
                                    setState(() {
                                      selectedSection = value;
                                    });
                                    // updateSections(value);
                                    updateSubjects(value);
                                    Navigator.pop(context);
                                  }
                                },*/
                                null
                              ),
                              Text(section,style: TextStyle(color: Colors.black45)),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        updateSubjects(value!);
                        isSectionValid = value.isNotEmpty;
                        Future.microtask(() {
                          // Navigator.pop(context);
                        });
                      },
                    ),
                  ),

                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: Dimensions.radiusSmall,
                  ),
                  // Subject Dropdown
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 4)],
                      borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      dropdownColor: Colors.white,
                      focusColor: Colors.black,
                      underline: SizedBox(),
                      value: selectedSubject,
                      hint: RichText(text: TextSpan(
                          children: [
                            TextSpan(text: "   Select Subject",style: TextStyle(color: Colors.grey[600],fontSize: 16 ,fontWeight: FontWeight.w400)),
                            TextSpan(text: "*",style: TextStyle(color: Colors.red)),
                          ]
                      )),
                      items: subjects.map((String subject) {
                        return DropdownMenuItem<String>(
                          value: subject,
                          child: Row(
                            children: [
                              Radio<String>(
                                activeColor: Colors.blue,
                                fillColor: WidgetStateProperty.resolveWith(
                                      (states) {
                                    if (states.contains(WidgetState.selected)) {
                                      return Colors.blue;
                                    }
                                    return Colors.blue;
                                  },
                                ),
                                value: subject,
                                groupValue: selectedSubject,
                                onChanged: /*(String? value) {
                                  if (value != null) {
                                    setState(() {
                                      selectedSubject = value;
                                    });
                                    // updateSections(value);
                                    updateSubjects(value);
                                    Navigator.pop(context);
                                  }
                                },*/
                                null
                              ),
                              Text(subject, style: TextStyle(color: Colors.black45)),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedSubject = value;
                          selectedSubjectId = _getSubjectIdFromName(value!); // Update subject ID
                          isSubjectValid = value.isNotEmpty;
                        });
                        Future.microtask(() {
                          // Navigator.pop(context);
                        });
                        print("Selected Subject: $selectedSubject, Subject ID: $selectedSubjectId");
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    // child: Text(
                    //   "title".tr + '*',
                    //   style: interMedium.copyWith(
                    //       fontSize: Dimensions.fontSizeExtraSmall,
                    //       height: 1.4,
                    //       color: Theme.of(context).disabledColor
                    //   ),
                    // ),
                    child:  RichText(text: TextSpan(
                        children: [
                          TextSpan(text: "Title",style: TextStyle(color: Colors.black,fontSize: 16 ,fontWeight: FontWeight.w400)),
                          TextSpan(text: "*",style: TextStyle(color: Colors.red)),
                        ]
                    )),
                  ),
                  const SizedBox(
                    height: Dimensions.radiusSmall,
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      boxShadow: [BoxShadow()],
                      borderRadius:
                      BorderRadius.circular(Dimensions.radiusDefault),
                    ),
                    child: TextField(
                      controller: titleController,
                      style: TextStyle(color: Colors.black),
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'enter_title_here'.tr,
                        focusColor: Colors.black,
                        // filled: true,
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        hintStyle: interMedium.copyWith(
                            fontSize: Dimensions.fontSizeExtraSmall,
                            color: Theme.of(context).disabledColor),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    // child: Text(
                    //   "description".tr + '*',
                    //   style: interMedium.copyWith(
                    //       fontSize: Dimensions.fontSizeExtraSmall,
                    //       height: 1.4,
                    //       color: Theme.of(context).disabledColor),
                    // ),
                    child: RichText(text: TextSpan(
                        children: [
                          TextSpan(text: "description".tr,style: TextStyle(color: Colors.black,fontSize: 16 ,fontWeight: FontWeight.w400)),
                          TextSpan(text: "*",style: TextStyle(color: Colors.red)),
                        ]
                    )),
                  ),
                  const SizedBox(
                    height: Dimensions.radiusSmall,
                  ),
                  Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        boxShadow: [BoxShadow()],
                        borderRadius:
                        BorderRadius.circular(Dimensions.radiusDefault),
                      ),
                      child: TextField(
                        controller: descriptionController,
                        style: TextStyle(color: Colors.black),
                        maxLines: 5,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'enter_description_here'.tr,
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                          hintStyle: interMedium.copyWith(
                              fontSize: Dimensions.fontSizeExtraSmall,
                              color: Theme.of(context).disabledColor),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              CustomButton(
                title: 'Post Dairy'.tr,
                fontSize: 16,
                onPressed: () {
                  submitClassDairy();
                },
                border: false,
                radius: 50,
                color: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
