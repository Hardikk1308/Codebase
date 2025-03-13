//
// import 'package:erp_school/data/models/response/homework_summary.dart';
// import 'package:erp_school/services/homework_service.dart';
// import 'package:erp_school/view/base/custom_dropdown.dart';
// import 'package:erp_school/view/screens/homework/add_homework.dart';
// import 'package:erp_school/view/screens/homework/home_work_details.dart';
// import 'package:flutter/material.dart';
// import 'package:erp_school/utils/dimensions.dart';
// import 'package:erp_school/utils/styles.dart';
// import 'package:erp_school/view/base/custom_appbar.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
//
// import '../../../utils/api_cache_manager.dart';
//
// class HomeWorkScreen extends StatefulWidget {
//   final bool teacherHomework;
//
//   const HomeWorkScreen({super.key, this.teacherHomework = false});
//   @override
//   State<HomeWorkScreen> createState() => _HomeWorkScreenState();
// }
//
// class _HomeWorkScreenState extends State<HomeWorkScreen> {
//   late double height;
//   late double width;
//   Future<StudentHomework>? classhomeWorkFuture;
//   final HomeworkService homeworkService = HomeworkService();
//   List<String> grades = [];
//   List<String> sections = [];
//   String? selectedGrade;
//   String? selectedSection;
//   bool isSeeMore = false;
//
//   // late Future<StudentHomework> homeworkSummary;
//
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   homeworkSummary = homeworkService.fetchStudentHomework();
//   // }
//   @override
//   void initState() {
//     super.initState();
//     // classDairyFuture = ViewDairyScreenService()
//     //     .fetchClassDairyDetails();
//     homeworkService.loadData((classMappings, loadedGrades) {
//       grades = loadedGrades;
//       if (grades.isNotEmpty) {
//         updateSections(grades.first);
//       }
//     });
//   }
//
//   void updateSections(String grade) {
//     homeworkService.updateSections(grade, (updatedSections, _) {
//       setState(() {
//         selectedGrade = grade;
//         sections = updatedSections;
//         selectedSection = sections.firstOrNull;
//         classhomeWorkFuture = null; // Reset data when grade changes
//         if (selectedSection != null) {
//           updateSubjects(selectedSection!);
//         }
//       });
//     });
//   }
//   void updateSubjects(String section) {
//     final filtered = homeworkService.classMappings.firstWhere(
//       (e) =>
//           e[ApiCacheManager.KEY_GRADE] == selectedGrade &&
//           e[ApiCacheManager.KEY_SECTION] == section,
//       orElse: () => {},
//     );
//     if (filtered.isNotEmpty) {
//       setState(() {
//         selectedSection = section;
//         homeworkService.selectedSectionId =
//             filtered[ApiCacheManager.KEY_SECTION_ID]; // Corrected this
//         classhomeWorkFuture = homeworkService.fetchStudentHomework();
//       });
//     } else {
//       print("No matching section found!");
//     }
//   }
//   int? selectedIndex = 1;
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       floatingActionButton: widget.teacherHomework
//           ? FloatingActionButton(
//               backgroundColor: Theme.of(context).primaryColor,
//               onPressed: () {
//                 Get.to(AddHomeWorkScreen());
//               },
//               child: Container(
//                 height: 64,
//                 width: 64,
//                 decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Theme.of(context).primaryColor),
//                 child: Center(
//                   child: Icon(
//                     Icons.add,
//                     color: Theme.of(context).cardColor,
//                   ),
//                 ),
//               ),
//             )
//           : null,
//       backgroundColor: Theme.of(context).cardColor,
//       appBar: CustomAppBar(
//         title: 'Homework'.tr,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 8),
//         child: FutureBuilder<StudentHomework>(
//           future: classhomeWorkFuture,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               final homeworkData = snapshot.data!;
//               // Apply filtering based on selected index
//               List<HomeworkDetails> filteredHomework =
//                   homeworkData.homeworkDetailsList;
//
//               if (selectedIndex == 2) {
//                 filteredHomework = filteredHomework
//                     .where((details) => details.status == 'NEW')
//                     .toList();
//               } else if (selectedIndex == 3) {
//                 filteredHomework = filteredHomework
//                     .where((details) => details.status == 'PENDING')
//                     .toList();
//               } else if (selectedIndex == 4) {
//                 filteredHomework = filteredHomework
//                     .where((details) => details.status == 'SUBMITTED')
//                     .toList();
//               } else if (selectedIndex == 5) {
//                 filteredHomework = filteredHomework
//                     .where((details) => details.status == 'COMPLETED')
//                     .toList();
//               }
//               return filteredHomework.isEmpty ? Column(
//                 children: [
//                   SizedBox(
//                     height: height * 0.0,
//                   ),
//                   widget.teacherHomework
//                       ? Column(children: [
//                           SizedBox(
//                             height: height * 0.025,
//                           ),
//                           Column(
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                   color: Theme.of(context).cardColor,
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color: Colors.grey.shade300,
//                                         blurRadius: 4)
//                                   ],
//                                   borderRadius: BorderRadius.circular(
//                                       Dimensions.radiusDefault),
//                                 ),
//                                 child: Align(
//                                   alignment: Alignment.center,
//                                   child: DropdownButton<String>(
//                                     isExpanded: true,
//                                     dropdownColor: Colors.white,
//                                     focusColor: Colors.black,
//                                     underline: SizedBox(),
//                                     value: selectedGrade,
//                                     hint: Text(
//                                       "   Select Class",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w500,
//                                           fontSize: 14),
//                                     ),
//                                     items: grades.map((String grade) {
//                                       return DropdownMenuItem<String>(
//                                         value: grade,
//                                         child: Row(
//                                           //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Radio<String>(
//                                               activeColor: Colors.blue,
//                                               fillColor: MaterialStateProperty
//                                                   .resolveWith(
//                                                 (states) {
//                                                   if (states.contains(
//                                                       MaterialState.selected)) {
//                                                     return Colors.blue;
//                                                   }
//                                                   return Colors.blue;
//                                                 },
//                                               ),
//                                               value: grade,
//                                               groupValue: selectedGrade,
//                                               onChanged: (String? value) {
//                                                 if (value != null) {
//                                                   setState(() {
//                                                     selectedGrade = value;
//                                                   });
//                                                   updateSections(value);
//                                                 }
//                                               },
//                                             ),
//                                             Text(grade,
//                                                 style: TextStyle(
//                                                     color: Colors.black45)),
//                                           ],
//                                         ),
//                                       );
//                                     }).toList(),
//                                     onChanged: (value) {
//                                       if (value != null) {
//                                         setState(() {
//                                           selectedGrade = value;
//                                         });
//                                         updateSections(value);
//                                       }
//                                     },
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(height: Dimensions.radiusSmall),
//                               // Proper spacing
//                               // Section Selection Dropdown
//                               Container(
//                                 decoration: BoxDecoration(
//                                   color: Theme.of(context).cardColor,
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color: Colors.grey.shade300,
//                                         blurRadius: 4)
//                                   ],
//                                   borderRadius: BorderRadius.circular(
//                                       Dimensions.radiusDefault),
//                                 ),
//                                 child: Align(
//                                   alignment: Alignment.center,
//                                   child: DropdownButton<String>(
//                                     isExpanded: true,
//                                     dropdownColor: Colors.white,
//                                     focusColor: Colors.black,
//                                     underline: SizedBox(),
//                                     value: selectedSection,
//                                     hint: Text(
//                                       "   Select Class",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w500,
//                                           fontSize: 14),
//                                     ),
//                                     items: sections.map((String section) {
//                                       return DropdownMenuItem<String>(
//                                         value: section,
//                                         child: Row(
//                                           //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Radio<String>(
//                                               activeColor: Colors.blue,
//                                               fillColor: MaterialStateProperty
//                                                   .resolveWith(
//                                                 (states) {
//                                                   if (states.contains(
//                                                       MaterialState.selected)) {
//                                                     return Colors.blue;
//                                                   }
//                                                   return Colors.blue;
//                                                 },
//                                               ),
//                                               value: section,
//                                               groupValue: selectedSection,
//                                               onChanged: (String? value) {
//                                                 if (value != null) {
//                                                   setState(() {
//                                                     selectedSection = value;
//                                                   });
//                                                   updateSections(value);
//                                                 }
//                                               },
//                                             ),
//                                             Text(section,
//                                                 style: TextStyle(
//                                                     color: Colors.black45)),
//                                           ],
//                                         ),
//                                       );
//                                     }).toList(),
//                                     onChanged: (value) {
//                                       if (value != null) {
//                                         setState(() {
//                                           selectedSection = value;
//                                         });
//                                         updateSubjects(value);
//                                       }
//                                     },
//                                     /*.toList(),
//                     onChanged: (value) {
//                       if (value != null) {
//                         setState(() {
//                           selectedGrade = value;
//                         });
//                         updateSections(value);
//                       }
//                     },*/
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: height * 0.02,
//                               ),
//                             ],
//                           )
//                         ])
//                       : SizedBox(),
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               selectedIndex = 1;
//                             });
//                           },
//                           child: Container(
//                             height: height * 0.045,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                               color: selectedIndex == 1
//                                   ? Theme.of(context).primaryColor
//                                   : Theme.of(context).colorScheme.surface,
//                               border: Border.all(
//                                 color: selectedIndex == 1
//                                     ? Theme.of(context).primaryColor
//                                     : Colors.transparent,
//                               ),
//                             ),
//                             alignment: Alignment.center,
//                             padding: const EdgeInsets.symmetric(horizontal: 14),
//                             child: Text(
//                               "${'all'.tr} (${homeworkData.homeworkSummary.totalHomeWorks}) ",
//                               style: interMedium.copyWith(
//                                 fontSize: 14,
//                                 color: selectedIndex == 1
//                                     ? Theme.of(context).cardColor
//                                     : Theme.of(context).disabledColor,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               selectedIndex = 2;
//                             });
//                           },
//                           child: Container(
//                             height: height * 0.045,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                               color: selectedIndex == 2
//                                   ? Theme.of(context).primaryColor
//                                   : Theme.of(context).colorScheme.surface,
//                               border: Border.all(
//                                 color: selectedIndex == 2
//                                     ? Theme.of(context).primaryColor
//                                     : Colors.transparent,
//                               ),
//                             ),
//                             alignment: Alignment.center,
//                             padding: EdgeInsets.symmetric(horizontal: 12),
//                             child: Text(
//                               "${'New'.tr} (${homeworkData.homeworkSummary.newTasks}) ",
//                               style: interMedium.copyWith(
//                                 fontSize: 14,
//                                 color: selectedIndex == 2
//                                     ? Theme.of(context).cardColor
//                                     : Theme.of(context).disabledColor,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               selectedIndex = 3;
//                             });
//                           },
//                           child: Container(
//                             height: height * 0.045,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                               color: selectedIndex == 3
//                                   ? Theme.of(context).primaryColor
//                                   : Theme.of(context).colorScheme.surface,
//                               border: Border.all(
//                                 color: selectedIndex == 3
//                                     ? Theme.of(context).primaryColor
//                                     : Colors.transparent,
//                               ),
//                             ),
//                             alignment: Alignment.center,
//                             padding: EdgeInsets.symmetric(horizontal: 12),
//                             child: Text(
//                               'pending'.tr +
//                                   " (" +
//                                   homeworkData.homeworkSummary.pending
//                                       .toString() +
//                                   ") ",
//                               style: interMedium.copyWith(
//                                 fontSize: 14,
//                                 color: selectedIndex == 3
//                                     ? Theme.of(context).cardColor
//                                     : Theme.of(context).disabledColor,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 15,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               selectedIndex = 4;
//                             });
//                           },
//                           child: Container(
//                             height: height * 0.045,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                               color: selectedIndex == 4
//                                   ? Theme.of(context).primaryColor
//                                   : Theme.of(context).colorScheme.surface,
//                               border: Border.all(
//                                 color: selectedIndex == 4
//                                     ? Theme.of(context).primaryColor
//                                     : Colors.transparent,
//                               ),
//                             ),
//                             alignment: Alignment.center,
//                             padding: EdgeInsets.symmetric(horizontal: 12),
//                             child: Text(
//                               "${'submitted'.tr} (${homeworkData.homeworkSummary.submitted}) ",
//                               style: interMedium.copyWith(
//                                 fontSize: 14,
//                                 color: selectedIndex == 4
//                                     ? Theme.of(context).cardColor
//                                     : Theme.of(context).disabledColor,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 15,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               selectedIndex = 5;
//                             });
//                           },
//                           child: Container(
//                             height: height * 0.045,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                               color: selectedIndex == 5
//                                   ? Theme.of(context).primaryColor
//                                   : Theme.of(context).colorScheme.surface,
//                               border: Border.all(
//                                 color: selectedIndex == 5
//                                     ? Theme.of(context).primaryColor
//                                     : Colors.transparent,
//                               ),
//                             ),
//                             alignment: Alignment.center,
//                             padding: EdgeInsets.symmetric(horizontal: 12),
//                             child: Text(
//                               "${'Checked'.tr} ( ${homeworkData.homeworkSummary.completed}) ",
//                               style: interMedium.copyWith(
//                                 fontSize: 14,
//                                 color: selectedIndex == 5
//                                     ? Theme.of(context).cardColor
//                                     : Theme.of(context).disabledColor,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 15,
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: height * 0.01,
//                   ),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemCount: filteredHomework.length,
//                     itemBuilder: (context, index) {
//                       return GestureDetector(
//                         onTap: () {
//                           Get.to(HomeWorkDetailsScreen(
//                             title: filteredHomework[index].status,
//                             filteredHomework: filteredHomework[index],
//                           ));
//                         },
//                         child: Container(
//                           margin: EdgeInsets.symmetric(vertical: 10),
//                           decoration: BoxDecoration(
//                             color: Theme.of(context).colorScheme.secondary,
//                             borderRadius: BorderRadius.circular(12),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.shade300,
//                                 blurRadius: 8,
//                                 offset: Offset(0, 4),
//                               ),
//                             ],
//                           ),
//                           child: Column(
//                             children: [
//                               15.h,
//                               Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 12),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Text(
//                                           'sub'.tr + " :",
//                                           style: interSemiBold.copyWith(
//                                               color: Theme.of(context)
//                                                   .disabledColor,
//                                               fontSize: 14),
//                                         ),
//                                         5.w,
//                                         Text(
//                                           filteredHomework[index].subject,
//                                           style: interSemiBold.copyWith(
//                                               color: Colors.indigo,
//                                               fontSize: 14),
//                                         ),
//                                       ],
//                                     ),
//                                     Container(
//                                       height: 28,
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 12),
//                                       decoration: BoxDecoration(
//                                           color: filteredHomework[index]
//                                                       .status ==
//                                                   'SUBMITTED'
//                                               ? Colors.green
//                                               : filteredHomework[index]
//                                                           .status ==
//                                                       'PENDING'
//                                                   ? Colors.purple
//                                                   : filteredHomework[index]
//                                                               .status ==
//                                                           'NEW'
//                                                       ? Colors.amber
//                                                       : const Color.fromARGB(
//                                                           255, 7, 122, 66),
//                                           borderRadius:
//                                               BorderRadius.circular(8)),
//                                       child: Center(
//                                         child: Text(
//                                           filteredHomework[index].status,
//                                           style: interRegular.copyWith(
//                                               fontSize: 13,
//                                               color:
//                                                   Theme.of(context).cardColor),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               15.h,
//                               Container(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 12),
//                                 width: Get.width,
//                                 decoration: BoxDecoration(
//                                   color: Theme.of(context).cardColor,
//                                 ),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     const SizedBox(height: 10),
//                                     Row(
//                                       children: [
//                                         Text(
//                                           "Student name:  ",
//                                           style: interSemiBold.copyWith(
//                                             color: Colors.indigo,
//                                             fontWeight: FontWeight.w600,
//                                             fontSize: 14,
//                                           ),
//                                           textAlign: TextAlign.start,
//                                         ),
//                                         Text(
//                                           filteredHomework[index].studentName,
//                                           style: interSemiBold.copyWith(
//                                             color: Colors.black,
//                                             fontWeight: FontWeight.w600,
//                                             fontSize: 14,
//                                           ),
//                                           textAlign: TextAlign.start,
//                                         ),
//                                       ],
//                                     ),const SizedBox(height: 10),
//                                     Text(
//                                       filteredHomework[index].title,
//                                       style: interSemiBold.copyWith(
//                                         color: Colors.black,
//                                        // fontWeight: FontWeight.w600,
//                                         fontSize: 14,
//                                       ),
//                                       textAlign: TextAlign.start,
//                                     ),
//                                     const SizedBox(height: 10),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               "Assigned date",
//                                               // details.assignedDate,
//                                               style: interSemiBold.copyWith(
//                                                 color: Colors.indigo,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.w700,
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               height: 5,
//                                             ),
//                                             Text(
//                                               filteredHomework[index]
//                                                   .assignedDate,
//                                               // details.assignedDate,
//                                               style: interRegular.copyWith(
//                                                 color: Theme.of(context)
//                                                     .disabledColor,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.w400,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.end,
//                                           children: [
//                                             Text(
//                                               "Submission date",
//                                               // details.assignedDate,
//                                               style: interSemiBold.copyWith(
//                                                 color: Colors.indigo,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.w700,
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               height: 5,
//                                             ),
//                                             Text(
//                                               filteredHomework[index].dueDate,
//                                               style: interRegular.copyWith(
//                                                 color: Theme.of(context)
//                                                     .disabledColor,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.w400,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: height * 0.02,
//                                     ), // 10.h
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ): Text("No data found");
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error.toString()}');
//             }
//             return Center(
//                 child: CircularProgressIndicator(
//               color: Colors.blue,
//             ));
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:erp_school/data/models/response/homework_summary.dart';
import 'package:erp_school/services/homework_service.dart';
import 'package:erp_school/view/screens/homework/add_homework.dart';
import 'package:erp_school/view/screens/homework/home_work_details.dart';
import 'package:flutter/material.dart';
import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/api_cache_manager.dart';

class HomeWorkScreen extends StatefulWidget {
  final bool teacherHomework;

  const HomeWorkScreen({super.key, this.teacherHomework = true
  });

  @override
  State<HomeWorkScreen> createState() => _HomeWorkScreenState();
}
//
class _HomeWorkScreenState extends State<HomeWorkScreen> {
  late double height;
  late double width;
  Future<StudentHomework>? classhomeWorkFuture;
  final HomeworkService homeworkService = HomeworkService();
  List<String> grades = [];
  List<String> sections = [];
  String? selectedGrade;
  String? selectedSection;
  bool isSeeMore = false;

  // late Future<StudentHomework> homeworkSummary;

  // @override
  // void initState() {
  //   super.initState();
  //   homeworkSummary = homeworkService.fetchStudentHomework();
  // }
  @override
  void initState() {
    super.initState();
    loadUserType();
    // classDairyFuture = ViewDairyScreenService()
    //     .fetchClassDairyDetails();
    homeworkService.loadData((classMappings, loadedGrades) {
      grades = loadedGrades;
      if (grades.isNotEmpty) {
        updateSections(grades.first);
      }
    });
  }

  void updateSections(String grade) {
    homeworkService.updateSections(grade, (updatedSections, _) {
      setState(() {
        selectedGrade = grade;
        sections = updatedSections;
        selectedSection = sections.firstOrNull;
        classhomeWorkFuture = null; // Reset data when grade changes
        if (selectedSection != null) {
          updateSubjects(selectedSection!);
        }
      });
    });
  }

  void updateSubjects(String section) {
    final filtered = homeworkService.classMappings.firstWhere(
      (e) =>
          e[ApiCacheManager.KEY_GRADE] == selectedGrade &&
          e[ApiCacheManager.KEY_SECTION] == section,
      orElse: () => {},
    );
    if (filtered.isNotEmpty) {
      setState(() {
        selectedSection = section;
        homeworkService.selectedSectionId =
            filtered[ApiCacheManager.KEY_SECTION_ID]; // Corrected this
        classhomeWorkFuture = homeworkService.fetchStudentHomework();
      });
    } else {
      print("No matching section found!");
    }
  }

  int? selectedIndex = 1;
  //
  static Future<String?> getUserType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print("get School idss : ${prefs.getInt("selectedSchoolId")}");
    String? UesrType = await prefs.getString('type');
    return prefs.getString('type');

    // print()
  }
  String? userType;
  Future<void> loadUserType() async {
    userType = await getUserType();
    setState(() {}); // Update UI after getting userType
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: userType == "teacher"
          ? FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: ()async {
              await  Get.to(AddHomeWorkScreen());
              homeworkService.loadData((classMappings, loadedGrades) {
                grades = loadedGrades;
                if (grades.isNotEmpty) {
                  updateSections(grades.first);
                }
              });
              },
              child: Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: Theme.of(context).cardColor,
                  ),
                ),
              ),
            )
          : null,
      backgroundColor: Theme.of(context).cardColor,
      appBar: CustomAppBar(
        title: 'Homework'.tr,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: FutureBuilder<StudentHomework>(
          future: classhomeWorkFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState==ConnectionState.done) {
              // final homeworkData = snapshot.data!;
              // Apply filtering based on selected index
              // List<HomeworkDetails> filteredHomework =
              //     homeworkData.homeworkDetailsList;
              final homeworkData = snapshot.data;
              List<HomeworkDetails> filteredHomework =
                  homeworkData?.homeworkDetailsList ?? [];

              if (selectedIndex == 2) {
                filteredHomework = filteredHomework
                    .where((details) => details.status == 'NEW')
                    .toList();
              } else if (selectedIndex == 3) {
                filteredHomework = filteredHomework
                    .where((details) => details.status == 'PENDING')
                    .toList();
              } else if (selectedIndex == 4) {
                filteredHomework = filteredHomework
                    .where((details) => details.status == 'SUBMITTED')
                    .toList();
              } else if (selectedIndex == 5) {
                filteredHomework = filteredHomework
                    .where((details) => details.status == 'COMPLETED')
                    .toList();
              }
              // ✅ Check if filteredHomework is empty or null
              // if (filteredHomework.isEmpty) {
              //   return const Center(
              //     child: Text(
              //       "No data found",
              //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              //     ),
              //   );
              // }
              return Column(
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  /*widget.teacherHomework*/
                  userType == "teacher"
                      ?  Column(children: [
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  boxShadow: [
                                    BoxShadow(color: Colors.grey.shade300, blurRadius: 4),
                                  ],
                                  borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    dropdownColor: Colors.white,
                                    focusColor: Colors.black,
                                    underline: SizedBox(),
                                    value: selectedGrade,
                                    hint: Text(
                                      "   Select Class",
                                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                                    ),
                                    items: grades.map((String grade) {
                                      return DropdownMenuItem<String>(
                                        value: grade,
                                        child: Row(
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
                                              value: grade,
                                              groupValue: selectedGrade,
                                              onChanged: (String? value) {
                                                if (value != null) {
                                                  setState(() {
                                                    selectedGrade = value;
                                                  });
                                                  updateSections(value);
                                                  // Close the dropdown manually
                                                  Navigator.pop(context);
                                                }
                                              },
                                            ),
                                            Text(
                                              grade,
                                              style: TextStyle(color: Colors.black45),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      if (value != null) {
                                        setState(() {
                                          selectedGrade = value;
                                        });
                                        updateSections(value);
                                        // Close dropdown after selection
                                        Future.microtask(() {
                                          // Navigator.pop(context);
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: Dimensions.radiusSmall),
                              // Proper spacing
                              // Section Selection Dropdown
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
                                    hint: Text(
                                      "   Select Section",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
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
                                              onChanged: (String? value) {
                                                if (value != null) {
                                                  setState(() {
                                                    selectedSection = value;
                                                  });
                                                  updateSections(value);
                                                }
                                              },
                                            ),
                                            Text(section,
                                                style: TextStyle(
                                                    color: Colors.black45)),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      if (value != null) {
                                        setState(() {
                                          selectedSection = value;
                                        });
                                        updateSubjects(value);
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
                                height: height * 0.02,
                              ),
                            ],
                          )
                        ])
                      : SizedBox(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          },
                          child: Container(
                            height: height * 0.045,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: selectedIndex == 1
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).colorScheme.surface,
                              border: Border.all(
                                color: selectedIndex == 1
                                    ? Theme.of(context).primaryColor
                                    : Colors.transparent,
                              ),
                            ),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Text(
                              "${'all'.tr} (${homeworkData?.homeworkSummary.totalHomeWorks}) ",
                              style: interMedium.copyWith(
                                fontSize: 14,
                                color: selectedIndex == 1
                                    ? Theme.of(context).cardColor
                                    : Theme.of(context).disabledColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 2;
                            });
                          },
                          child: Container(
                            height: height * 0.045,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: selectedIndex == 2
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).colorScheme.surface,
                              border: Border.all(
                                color: selectedIndex == 2
                                    ? Theme.of(context).primaryColor
                                    : Colors.transparent,
                              ),
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              "${'New'.tr} (${homeworkData?.homeworkSummary.newTasks}) ",
                              style: interMedium.copyWith(
                                fontSize: 14,
                                color: selectedIndex == 2
                                    ? Theme.of(context).cardColor
                                    : Theme.of(context).disabledColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 3;
                            });
                          },
                          child: Container(
                            height: height * 0.045,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: selectedIndex == 3
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).colorScheme.surface,
                              border: Border.all(
                                color: selectedIndex == 3
                                    ? Theme.of(context).primaryColor
                                    : Colors.transparent,
                              ),
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'pending'.tr +
                                  " (" +
                                  homeworkData!.homeworkSummary.pending
                                      .toString() +
                                  ") ",
                              style: interMedium.copyWith(
                                fontSize: 14,
                                color: selectedIndex == 3
                                    ? Theme.of(context).cardColor
                                    : Theme.of(context).disabledColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 4;
                            });
                          },
                          child: Container(
                            height: height * 0.045,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: selectedIndex == 4
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).colorScheme.surface,
                              border: Border.all(
                                color: selectedIndex == 4
                                    ? Theme.of(context).primaryColor
                                    : Colors.transparent,
                              ),
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              "${'submitted'.tr} (${homeworkData.homeworkSummary.submitted}) ",
                              style: interMedium.copyWith(
                                fontSize: 14,
                                color: selectedIndex == 4
                                    ? Theme.of(context).cardColor
                                    : Theme.of(context).disabledColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 5;
                            });
                          },
                          child: Container(
                            height: height * 0.045,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: selectedIndex == 5
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).colorScheme.surface,
                              border: Border.all(
                                color: selectedIndex == 5
                                    ? Theme.of(context).primaryColor
                                    : Colors.transparent,
                              ),
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              "${'Completed'.tr} ( ${homeworkData.homeworkSummary.completed}) ",
                              style: interMedium.copyWith(
                                fontSize: 14,
                                color: selectedIndex == 5
                                    ? Theme.of(context).cardColor
                                    : Theme.of(context).disabledColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  filteredHomework.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: filteredHomework.length,
                          itemBuilder: (context, index) {
                            return /*GestureDetector(
                              onTap: () async {
                              final result  = await
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeWorkDetailsScreen(
                                title: filteredHomework[index].status,
                                filteredHomework: filteredHomework[index],
                              )));
                              *//*Get.to(
                                    HomeWorkDetailsScreen(
                                  title: filteredHomework[index].status,
                                  filteredHomework: filteredHomework[index],
                                ));*//*
                                if (result == true) {
                                  setState(() {});
                                }
                              },*/
                              GestureDetector(
                                onTap: () async {
                                  final result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeWorkDetailsScreen(
                                        title: filteredHomework[index].status,
                                        filteredHomework: filteredHomework[index],
                                      ),
                                    ),
                                  );
                                  if (result == true) {
                                    setState(() {
                                     loadUserType();
                                      homeworkService.loadData((classMappings, loadedGrades) {
                                        grades = loadedGrades;
                                        if (grades.isNotEmpty) {
                                          updateSections(grades.first);
                                        }
                                      });
                                    });
                                    print("Screen Refreshed Successfully!");
                                  }

                                  /*if (result == true) {
                                    // loadUserType();
                                    // classDairyFuture = ViewDairyScreenService()
                                    //     .fetchClassDairyDetails();
                                    loadUserType();
                                    homeworkService.loadData((classMappings, loadedGrades) {
                                      grades = loadedGrades;
                                      if (grades.isNotEmpty) {
                                        updateSections(grades.first);
                                      }
                                    });
                                    print("refers Screen Refreshing...");
                                    setState(() {});
                                  }*/ else {
                                    print("refers Result false, no refresh");
                                  }

                                },
                                child: Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 8,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    15.h,
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'sub'.tr + " :",
                                                style: interSemiBold.copyWith(
                                                    color: Theme.of(context)
                                                        .disabledColor,
                                                    fontSize: 14),
                                              ),
                                              5.w,
                                              Text(
                                                filteredHomework[index].subject,
                                                style: interSemiBold.copyWith(
                                                    color: Colors.indigo,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: 28,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12),
                                            decoration: BoxDecoration(
                                                color: filteredHomework[index]
                                                            .status ==
                                                        'SUBMITTED'
                                                    ? const Color.fromARGB(255, 7, 122, 66)
                                                    : filteredHomework[index]
                                                                .status ==
                                                            'PENDING'
                                                        ? Colors.purple
                                                        : filteredHomework[
                                                                        index]
                                                                    .status ==
                                                                'NEW'
                                                            ? Colors.amber
                                                            : Colors.blueAccent ,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Center(
                                              child: Text(
                                                filteredHomework[index].status,
                                                style: interRegular.copyWith(
                                                    fontSize: 13,
                                                    color: Theme.of(context)
                                                        .cardColor),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    15.h,
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 10),
                                          userType == "teacher"
                                              ?    Row(
                                            children: [
                                              Text(
                                                "Student name:  ",
                                                style: interSemiBold.copyWith(
                                                  color: Colors.indigo,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                              Text(
                                                filteredHomework[index]
                                                    .studentName,
                                                style: interSemiBold.copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                            ],
                                          ) : SizedBox(),
                                          const SizedBox(height: 10),
                                          Text(
                                            filteredHomework[index].title,
                                            style: interSemiBold.copyWith(
                                              color: Colors.black,
                                              // fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Assigned date",
                                                    // details.assignedDate,
                                                    style:
                                                        interSemiBold.copyWith(
                                                      color: Colors.indigo,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    filteredHomework[index]
                                                        .assignedDate,
                                                    // details.assignedDate,
                                                    style:
                                                        interRegular.copyWith(
                                                      color: Theme.of(context)
                                                          .disabledColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "Submission date",
                                                    // details.assignedDate,
                                                    style:
                                                        interSemiBold.copyWith(
                                                      color: Colors.indigo,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    filteredHomework[index]
                                                        .dueDate,
                                                    style:
                                                        interRegular.copyWith(
                                                      color: Theme.of(context)
                                                          .disabledColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: height * 0.02,
                                          ), // 10.h
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : Center(
                          child: Text(
                            "No homework data found",
                          ),
                        ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error.toString()}');
            }
            return Center(
                child: CircularProgressIndicator(
              color: Colors.blue,
            ));
          },
        ),
      ),
    );
  }
}
