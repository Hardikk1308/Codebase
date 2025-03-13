import 'dart:convert';
import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:erp_school/view/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../services/School_service.dart';
import '../../../services/add_homework_service.dart';
import '../../../utils/api_cache_manager.dart';
class AddHomeWorkScreen extends StatefulWidget {
  const AddHomeWorkScreen({super.key});
  @override
  State<AddHomeWorkScreen> createState() => _AddHomeWorkScreenState();
}

class _AddHomeWorkScreenState extends State<AddHomeWorkScreen> {
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
  bool isCommentsValid = true;
  bool isDateTime = true;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController commentsController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
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
      grades = data
          .map((e) => e[ApiCacheManager.KEY_GRADE] as String)
          .toSet()
          .toList();
    });
  }

  void updateSections(String grade) {
    final filtered = classMappings
        .where((e) => e[ApiCacheManager.KEY_GRADE] == grade)
        .toList();
    setState(() {
      selectedGrade = grade;
      selectedGradeId =
          filtered.first[ApiCacheManager.KEY_GRADE_ID]; // Store Grade ID
      sections = filtered
          .map((e) => e[ApiCacheManager.KEY_SECTION] as String)
          .toSet()
          .toList();
      selectedSection = null;
      selectedSectionId = null;
      subjects = [];
      selectedSubject = null;
    });
  }

  void updateSubjectsss(String section) {
    final filtered = classMappings.firstWhere(
      (e) =>
          e[ApiCacheManager.KEY_GRADE] == selectedGrade &&
          e[ApiCacheManager.KEY_SECTION] == section,
      orElse: () => {},
    );
    if (filtered.isNotEmpty) {
      List<dynamic> subjectList =
          jsonDecode(filtered[ApiCacheManager.KEY_SUBJECT]);
      setState(() {
        selectedSection = section;
        selectedSectionId =
            filtered[ApiCacheManager.KEY_SECTION_ID]; // Store Section ID
        subjects = subjectList
            .map((e) => e[ApiCacheManager.KEY_SUBJECT_NAME] as String)
            .toList();
        selectedSubject = null;
        selectedSubjectId = null; // Reset the subject ID
      });
    }
  }

  String _getSubjectIdFromName(String subjectName) {
    final selectedGradeData = classMappings.firstWhere(
      (e) =>
          e[ApiCacheManager.KEY_GRADE] == selectedGrade &&
          e[ApiCacheManager.KEY_SECTION] == selectedSection,
      orElse: () => {},
    );
    if (selectedGradeData.isNotEmpty) {
      List<dynamic> subjectsList =
          jsonDecode(selectedGradeData[ApiCacheManager.KEY_SUBJECT]);
      final subjectData = subjectsList.firstWhere(
        (subject) => subject[ApiCacheManager.KEY_SUBJECT_NAME] == subjectName,
        orElse: () => {},
      );
      return subjectData.isNotEmpty
          ? subjectData[ApiCacheManager.KEY_SUBJECT_ID]
          : '';
    }
    return ''; // Return an empty string if no subject is found
  }

  void updateSubjects(String section) {
    // Find the filtered class data for the selected grade and section
    final filtered = classMappings.firstWhere(
      (e) =>
          e[ApiCacheManager.KEY_GRADE] == selectedGrade &&
          e[ApiCacheManager.KEY_SECTION] == section,
      orElse: () => {},
    );
    if (filtered.isNotEmpty) {
      // Decode the subjects JSON data
      List<dynamic> subjectList =
          jsonDecode(filtered[ApiCacheManager.KEY_SUBJECT]);
      print("Selected subject ${subjectList}");
      // Find the selected subject data
      final selectedSubjectData = subjectList.firstWhere(
        (e) => e[ApiCacheManager.KEY_SUBJECT_NAME] == selectedSubject,
        orElse: () => {},
      );
      setState(() {
        selectedSection = section;
        selectedSectionId =
            filtered[ApiCacheManager.KEY_SECTION_ID]; // Store Section ID
        // Map the subjects list and set it
        subjects = subjectList
            .map((e) => e[ApiCacheManager.KEY_SUBJECT_NAME] as String)
            .toList();

        // Set the selected subject and subject ID
        selectedSubjectId = selectedSubjectData.isNotEmpty
            ? selectedSubjectData[
                ApiCacheManager.KEY_SUBJECT_ID] // Get subject ID
            : null;
        print("Selected Grade: $selectedGrade, Grade ID: $selectedGradeId");
        print(
            "Selected Section: $selectedSection, Section ID: $selectedSectionId");
        print("Selected Subject: $selectedSubject");
        print("Selected Subject ID: $selectedSubjectId");
      });
    }
  }

  Future<void> submitHomework() async {
    setState(() {
      isGradeValid = selectedGrade != null && selectedGrade!.isNotEmpty;
      isSectionValid = selectedSection != null && selectedSection!.isNotEmpty;
      isSubjectValid = selectedSubject != null && selectedSubject!.isNotEmpty;
      isTitleValid = titleController.text.isNotEmpty;
      isDescriptionValid = descriptionController.text.isNotEmpty;
      isCommentsValid = commentsController.text.isNotEmpty;
      isDateTime = _dateController.text.isNotEmpty;
    });

    // Fix validation logic (ensure isDateTime is correctly checked)
    if (!isGradeValid || !isSectionValid || !isSubjectValid || !isDateTime || !isTitleValid || !isDescriptionValid || !isCommentsValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text("Please fill all the required fields.")),
      );
      return;
    }

    try {
      // int? teacherId = await ClassDairyService.getTeacherId();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? teacherId = prefs.getInt('teacherId');

      int? schoolId = await SchoolService.getSchoolId();

      print("Teacher ID $teacherId or School ID $schoolId not found!");

      if (teacherId == null || schoolId == null) {
        print("Error: Teacher ID or School ID not found!");
        return;
      }

      // Get.offAll(HomeWorkScreen(teacherHomework: true,));
      // Create the request DTO (ensuring non-null values)
      AddHomeworkServiceRequestDTO homework = AddHomeworkServiceRequestDTO(
        gradeId: int.parse(selectedGradeId!),
        sectionId: int.parse(selectedSectionId!),
        subjectId: int.parse(selectedSubjectId!),
        teacherId: teacherId,
        schoolId: schoolId,
        title: titleController.text,
        moreDetails: descriptionController.text,
        dueDate: _dateController.text,
        comments: "${commentsController.text}" ,
      );

      // Call API service with the DTO object
      AddHomeworkResponseDTO? response =
      await AddHomeworkService.saveClassDairyService(homework);

      if (response != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).primaryColor,
            content: Text("Class homework posted successfully"),
          ),
        );
        Navigator.pop(context);
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeWorkScreen(teacherHomework: true)));
        print("Data saved successfully! Response ID: ${response.id}");
      } else {
        print("Failed to save data. API returned null.");
      }
    } catch (e) {
      print("Exception while submitting Class Diary: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Theme.of(context).highlightColor,
        appBar: CustomAppBar(
          title: 'add_homework'.tr,
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(children: [
              SizedBox(
                height: height*0.015,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: Dimensions.radiusSmall,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade300, blurRadius: 4)
                      ],
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusDefault),
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      dropdownColor: Colors.white,
                      focusColor: Colors.black,
                      underline: SizedBox(),
                      value: selectedGrade,
                      hint: /*Text("  Select Class*"),*/ RichText(text: TextSpan(
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
                                    if (states
                                        .contains(WidgetState.selected)) {
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
                                    // updateSections(value);
                                    updateSubjects(value);
                                    Navigator.pop(context);
                                  }
                                },*/
                                null
                              ),
                              Text(grade,
                                  style: TextStyle(color: Colors.black45)),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        updateSections(value!);
                        isGradeValid = value.isNotEmpty;
                        print(
                            "Selected Grade: $value, Grade ID: $selectedGradeId"); // This will print the selected grade and its ID
                        Future.microtask(() {
                          // Navigator.pop(context);
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: height*0.015,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 4)
                      ],
                      borderRadius: BorderRadius.circular(
                          Dimensions.radiusDefault),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        dropdownColor: Colors.white,
                        focusColor: Colors.black,
                        underline: SizedBox(),
                        value: selectedSection,
                        hint:/* Text(
                          "   Select Section",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),*/
                        RichText(text: TextSpan(
                            children: [
                              TextSpan(text: "   Select Section",style: TextStyle(color: Colors.grey[600],fontSize: 16 ,fontWeight: FontWeight.w400)),
                              TextSpan(text: "*",style: TextStyle(color: Colors.red)),
                            ]
                        )),
                        items: sections.map((String section) {
                          return DropdownMenuItem<String>(
                            value: section,
                            child: Row(
                              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Radio<String>(
                                  activeColor: Colors.blue,
                                  fillColor: WidgetStateProperty
                                      .resolveWith(
                                        (states) {
                                      if (states.contains(
                                          WidgetState.selected)) {
                                        return Colors.blue;
                                      }
                                      return Colors.blue;
                                    },
                                  ),
                                  value: section,
                                  groupValue: selectedSection,
                                  onChanged: /*(String? value) {
                                    if (value != null) {
                                      setState(() {
                                        selectedSection = value;
                                      });
                                      // updateSections(value);
                                      // updateSubjects(value);
                                      updateSubjects(value);
                                      Navigator.pop(context);
                                    }
                                  },*/
                                  null
                                ),
                                Text(section,
                                    style: TextStyle(
                                        color: Colors.black45)),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          if (value != null) {
                            setState(() {
                              selectedSection = value;
                            });
                            updateSubjects(value);
                            Future.microtask(() {
                              // Navigator.pop(context);
                            });
                          }
                        },
                        /*.toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedGrade = value;
                        });
                        updateSections(value);
                      }
                    },*/
                      ),
                    ),
                  ),

                  SizedBox(
                    height: height*0.015,
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300, blurRadius: 4)
                          ],
                          borderRadius:
                              BorderRadius.circular(Dimensions.radiusDefault),
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          dropdownColor: Colors.white,
                          focusColor: Colors.black,
                          underline: SizedBox(),
                          value: selectedSubject,
                          hint: /*Text("  Select Subject"),*/
                          RichText(text: TextSpan(
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
                                  IgnorePointer(
                              ignoring: true,
                                    child: Radio<String>(
                                      activeColor: Colors.blue,

                                      fillColor:
                                          WidgetStateProperty.resolveWith(
                                        (states) {
                                          if (states.contains(
                                              WidgetState.selected)) {
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
                                          // updateSubjects(value);
                                          updateSubjects(value);
                                          Navigator.pop(context);
                                        }
                                      },*/
                                      null
                                    ),
                                  ),
                                  Text(subject,
                                      style:
                                          TextStyle(color: Colors.black45)),
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedSubject = value;
                              selectedSubjectId = _getSubjectIdFromName(
                                  value!); // Update subject ID
                              isSubjectValid =
                                  value.isNotEmpty;
                            });
                            print(
                                "Selected Subject: $selectedSubject, Subject ID: $selectedSubjectId");
                            Future.microtask(() {
                              // Navigator.pop(context);
                            });
                            },
                        ),
                      ),
                      SizedBox(
                        height: height*0.01,
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: Dimensions.radiusSmall,
                          ),
                          // Container(
                          //   height: 50,
                          //   decoration: BoxDecoration(
                          //     color: Theme.of(context).cardColor,
                          //     boxShadow: [BoxShadow()],
                          //     borderRadius: BorderRadius.circular(
                          //         Dimensions.radiusDefault),
                          //   ),
                          //   child: TextField(
                          //     style: interMedium.copyWith(
                          //       fontSize: Dimensions.fontSizeExtraSmall,
                          //       color: Theme.of(context).disabledColor,),
                          //      controller: _dateController,
                          //     readOnly: true,
                          //     onTap: () async {
                          //       DateTime? pickedDate = await showDatePicker(
                          //         context: context,
                          //         initialDate: DateTime.now(),
                          //         firstDate: DateTime(2000),
                          //         lastDate: DateTime(2100),
                          //         builder: (BuildContext context,
                          //             Widget? child) {
                          //           return Theme(
                          //             data: Theme.of(context).copyWith(
                          //               colorScheme: ColorScheme.light(
                          //                 primary: Theme.of(context)
                          //                     .primaryColor,
                          //                 // Selected date color
                          //                 onSurface: Colors
                          //                     .black, // Text color for dates
                          //               ),
                          //               dialogBackgroundColor: Colors
                          //                   .white, // Background color
                          //             ),
                          //             child: child!,
                          //           );
                          //         },
                          //       );
                          //       String formattedDate =
                          //           DateFormat('yyyy-MM-dd')
                          //               .format(pickedDate!);
                          //       _dateController.text = formattedDate;
                          //     },
                          //     decoration: InputDecoration(
                          //       suffixIcon: Icon(
                          //         Icons.calendar_month,
                          //         color: Theme.of(context).disabledColor,
                          //       ),
                          //       border: InputBorder.none,
                          //       hintText: 'Select date *'.tr,
                          //       contentPadding: const EdgeInsets.only(
                          //           left: 12, top: 12),
                          //       hintStyle: interMedium.copyWith(
                          //         fontSize: Dimensions.fontSizeExtraSmall,
                          //         color: Theme.of(context).disabledColor,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              boxShadow: [BoxShadow()],
                              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                            ),
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                TextField(
                                  style: interMedium.copyWith(
                                    fontSize: Dimensions.fontSizeExtraSmall,
                                    color: Theme.of(context).disabledColor,
                                  ),
                                  controller: _dateController,
                                  readOnly: true,
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2100),
                                      builder: (BuildContext context, Widget? child) {
                                        return Theme(
                                          data: Theme.of(context).copyWith(
                                            colorScheme: ColorScheme.light(
                                              primary: Theme.of(context).primaryColor, // Selected date color
                                              onSurface: Colors.black, // Text color for dates
                                            ),
                                            dialogBackgroundColor: Colors.white, // Background color
                                          ),
                                          child: child!,
                                        );
                                      },
                                    );

                                    if (pickedDate != null) {
                                      setState(() { // ✅ Ensures UI updates when the date is selected
                                        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                        _dateController.text = formattedDate;
                                      });
                                    }
                                  },
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.calendar_month,
                                      color: Theme.of(context).disabledColor,
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.only(left: 12, top: 12),
                                  ),
                                ),
                                if (_dateController.text.isEmpty) // ✅ Hint will disappear after selecting a date
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Select date",
                                            style: interMedium.copyWith(
                                              fontSize: Dimensions.fontSizeExtraSmall,
                                              color: Theme.of(context).disabledColor,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "*",
                                            style: interMedium.copyWith(
                                              fontSize: Dimensions.fontSizeExtraSmall,
                                              color: Colors.red, // Make asterisk red
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
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
                        child: /*Text(
                          "homework_title".tr + '*',
                          style: interMedium.copyWith(
                              fontSize: Dimensions.fontSizeExtraSmall,
                              height: 1.4,
                              color: Theme.of(context).disabledColor),
                        ),*/
                        RichText(text: TextSpan(
                          children: [
                            TextSpan(text: "homework_title".tr,style: TextStyle(color: Colors.grey[600],fontSize: 16 ,fontWeight: FontWeight.w400)),
                            TextSpan(text: "*",style: TextStyle(color: Colors.red)),
                          ]
                        ))
                      ),
                      const SizedBox(
                        height: Dimensions.radiusSmall,
                      ),
                      Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            boxShadow: [BoxShadow()],
                            borderRadius: BorderRadius.circular(
                                Dimensions.radiusDefault),
                          ),
                          child: TextField(
                            controller: titleController,
                            maxLines: 5,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'homework_title'.tr,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 5),
                              hintStyle: interMedium.copyWith(
                                  fontSize: Dimensions.fontSizeExtraSmall,
                                  color: Theme.of(context).disabledColor),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: /*Text(
                          '${"more_details".tr}*',
                          style: interMedium.copyWith(
                              fontSize: Dimensions.fontSizeExtraSmall,
                              height: 1.4,
                              color: Theme.of(context).disabledColor),
                        ),*/
                        RichText(text: TextSpan(
                          children: [
                            TextSpan(text: "more_details".tr,style: TextStyle(color: Colors.grey[600],fontSize: 16 ,fontWeight: FontWeight.w400)),
                            TextSpan(text: "*",style: TextStyle(color: Colors.red)),
                          ]
                        ))
                      ),
                      const SizedBox(
                        height: Dimensions.radiusSmall,
                      ),
                      Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            boxShadow: const [BoxShadow()],
                            borderRadius: BorderRadius.circular(
                                Dimensions.radiusDefault),
                          ),
                          child: TextField(
                            controller: descriptionController,
                            maxLines: 5,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'enter_description_here'.tr,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 5),
                              hintStyle: interMedium.copyWith(
                                  fontSize: Dimensions.fontSizeExtraSmall,
                                  color: Theme.of(context).disabledColor),
                            ),
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: /*Text(
                          '${"more_details".tr}*',
                          style: interMedium.copyWith(
                              fontSize: Dimensions.fontSizeExtraSmall,
                              height: 1.4,
                              color: Theme.of(context).disabledColor),
                        ),*/
                        RichText(text: TextSpan(
                          children: [
                            TextSpan(text: "Comments".tr,style: TextStyle(color: Colors.grey[600],fontSize: 16 ,fontWeight: FontWeight.w400)),
                            TextSpan(text: "*",style: TextStyle(color: Colors.red)),
                          ]
                        ))
                      ),
                      const SizedBox(
                        height: Dimensions.radiusSmall,
                      ),
                      Container(
                          height: 55,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            boxShadow: const [BoxShadow()],
                            borderRadius: BorderRadius.circular(
                                Dimensions.radiusDefault),
                          ),
                          child: TextField(
                            controller: commentsController,
                            maxLines: 2,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your comments..'.tr,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 5),
                              hintStyle: interMedium.copyWith(
                                  fontSize: Dimensions.fontSizeExtraSmall,
                                  color: Theme.of(context).disabledColor),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  20.h,
                  CustomButton(
                    title: 'upload_homework'.tr,
                    fontSize: 16,
                    onPressed: () {
                      submitHomework();
                    },
                    border: false,
                    radius: 50,
                    color: true,
                  ),
                ],
              ),
            ])));
  }
}
