//
// import 'dart:convert';
// import 'package:erp_school/utils/dimensions.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../api/api_util.dart';
// import '../../../constants/app_constants.dart';
// import '../../../services/view_dairy_screen_service.dart';
// import '../../../testin_file.dart';
// import '../../../utils/api_cache_manager.dart';
// import '../../../utils/styles.dart';
// import '../../base/custom_appbar.dart';
// import 'post_class_dairy.dart';
// class ViewDairyScreen extends StatefulWidget {
//   const ViewDairyScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ViewDairyScreen> createState() => _ViewDairyScreenState();
// }
//
// class _ViewDairyScreenState extends State<ViewDairyScreen> {
//   late double height;
//   late double width;
//   Future<ViewClassDiary>? classDairyFuture;
//   List<ClassDiaryList>? classDairyList;
//
//   final ClassSectionHelper apiService = ClassSectionHelper();
//   List<String> grades = [];
//   List<String> sections = [];
//   String? selectedGrade;
//   String? selectedSection;
//   bool isSeeMore = false;
//   bool isTextOverflowing = false;
//   bool isOverflowing = false;
//   final GlobalKey textKey = GlobalKey();
//   @override
//   void initState() {
//     super.initState();
//     // classDairyFuture = ViewDairyScreenService()
//     //     .fetchClassDairyDetails();
//     apiService.loadData((classMappings, loadedGrades) {
//       grades = loadedGrades;
//       if(grades.isNotEmpty){
//         updateSections(grades.first);
//       }
//     });
//   }
//
//   void updateSections(String grade) {
//     apiService.updateSections(grade, (updatedSections, _) {
//       setState(() {
//         selectedGrade = grade;
//         sections = updatedSections;
//         selectedSection = sections.firstOrNull;
//         classDairyFuture = null; // Reset data when grade changes
//         if(selectedSection != null){
//           updateSubjects(selectedSection!);
//         }
//       });
//     });
//   }
//   void updateSubjects(String section) {
//     final filtered = apiService.classMappings.firstWhere(
//           (e) =>
//       e[ApiCacheManager.KEY_GRADE] == selectedGrade &&
//           e[ApiCacheManager.KEY_SECTION] == section,
//       orElse: () => {},
//     );
//
//     if (filtered.isNotEmpty) {
//       setState(() {
//         selectedSection = section;
//         apiService.selectedSectionId =
//         filtered[ApiCacheManager.KEY_SECTION_ID]; // Corrected this
//         classDairyFuture = apiService.fetchClassDiaryDetails();
//       });
//     } else {
//       print("No matching section found!");
//     }
//   }
//
//   void checkTextOverflow() {
//     final RenderBox? renderBox = textKey.currentContext?.findRenderObject() as RenderBox?;
//     if (renderBox == null) return;
//
//     final textPainter = TextPainter(
//       text: TextSpan(
//         text: "Waiting..",
//         style: interSemiBold.copyWith(
//           color: Theme.of(context).disabledColor,
//           fontSize: 15,
//           fontWeight: FontWeight.w400,
//         ),
//       ),
//       maxLines: 2,
//       textDirection: TextDirection.ltr,
//     );
//
//     textPainter.layout(maxWidth: renderBox.size.width);
//
//     setState(() {
//       isTextOverflowing = textPainter.didExceedMaxLines;
//     });
//   }
//
//   // static ManageModle () async {
//   //   // String? moduleSelected = "";
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   final moduleSelected = prefs.getString('type')?.toLowerCase();
//   // }
//  
//   @override
//   Widget build(BuildContext context) {
//     height = MediaQuery.of(context).size.height;
//     width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Theme.of(context).primaryColor,
//         child: Icon(Icons.add),
//         onPressed: () async {
//           await Get.to(PostClassDairy());
//           apiService.loadData((classMappings, loadedGrades) {
//             grades = loadedGrades;
//             if(grades.isNotEmpty){
//               updateSections(grades.first);
//             }
//           });
//         },
//       ),
//       appBar: CustomAppBar(
//         title: 'class_diary'.tr,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 15),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Class Selection Dropdown
//               Container(
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).cardColor,
//                   boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 4)],
//                   borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
//                 ),
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: DropdownButton<String>(
//                     isExpanded: true,
//                     dropdownColor: Colors.white,
//                     focusColor: Colors.black,
//                     underline: SizedBox(),
//                     value: selectedGrade,
//                     hint: Text(
//                       "   Select Class",
//                       style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
//                     ),
//                     items: grades.map((String grade) {
//                       return DropdownMenuItem<String>(
//                         value: grade,
//                         child: Row(
//                           //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Radio<String>(
//                               activeColor: Colors.blue,
//                               fillColor: MaterialStateProperty.resolveWith(
//                                     (states) {
//                                   if (states.contains(MaterialState.selected)) {
//                                     return Colors.blue;
//                                   }
//                                   return Colors.blue;
//                                 },
//                               ),
//                               value: grade,
//                               groupValue: selectedGrade,
//                               onChanged: (String? value) {
//                                 if (value != null) {
//                                   setState(() {
//                                     selectedGrade = value;
//                                   });
//                                   updateSections(value);
//                                   Navigator.pop(context);
//                                 }
//                               },
//                             ),
//                             Text(grade, style: TextStyle(color: Colors.black45)),
//                           ],
//                         ),
//                       );
//                     }).toList(),
//                     onChanged: (value) {
//                       if (value != null) {
//                         setState(() {
//                           selectedGrade = value;
//                         });
//                         updateSections(value);
//                         Future.microtask(() {
//                           // Navigator.pop(context);
//                         });
//                       }
//                     },
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Section Selection Dropdown
//               Container(
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).cardColor,
//                   boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 4)],
//                   borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
//                 ),
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: DropdownButton<String>(
//                     isExpanded: true,
//                     dropdownColor: Colors.white,
//                     focusColor: Colors.black,
//                     underline: SizedBox(),
//                     value: selectedSection,
//                     hint: Text(
//                       "   Select Class",
//                       style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
//                     ),
//                     items: sections.map((String section) {
//                       return DropdownMenuItem<String>(
//                         value: section,
//                         child: Row(
//                           //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Radio<String>(
//                               activeColor: Colors.blue,
//                               fillColor: MaterialStateProperty.resolveWith(
//                                     (states) {
//                                   if (states.contains(MaterialState.selected)) {
//                                     return Colors.blue;
//                                   }
//                                   return Colors.blue;
//                                 },
//                               ),
//                               value: section,
//                               groupValue: selectedSection,
//                               onChanged: (String? value) {
//                                 if (value != null) {
//                                   setState(() {
//                                     selectedSection = value;
//                                   });
//                                   updateSections(value);
//                                 }
//                               },
//                             ),
//                             Text(section, style: TextStyle(color: Colors.black45)),
//                           ],
//                         ),
//                       );
//                     }).toList(),
//                     onChanged: (value) {
//                       if (value != null) {
//                         setState(() {
//                           selectedSection = value;
//                         });
//                         updateSubjects(value);
//                       }
//                     },
//                     /*.toList(),
//                     onChanged: (value) {
//                       if (value != null) {
//                         setState(() {
//                           selectedGrade = value;
//                         });
//                         updateSections(value);
//                       }
//                     },*/
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Class Diary Data Display
//       FutureBuilder<ViewClassDiary>(
//         future: classDairyFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator(color: Colors.blue));
//           } else if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           } else if (snapshot.data == null || snapshot.data!.classDiaryList == null || snapshot.data!.classDiaryList!.isEmpty) {
//             return Center(child: Text("No class diary data found"));
//           }
//
//           var classDiaryList = snapshot.data!.classDiaryList!; // Ensure correct naming
//
//
//           return ListView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: classDiaryList.length,
//             itemBuilder: (context, index) {
//               var dairy = classDiaryList[index];
//
//               return GestureDetector(
//                 child: Container(
//                   margin: EdgeInsets.symmetric(vertical: 5),
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).colorScheme.secondary,
//                     borderRadius: BorderRadius.circular(12),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.shade300,
//                         blurRadius: 8,
//                         offset: Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     children: [
//                       SizedBox(height: 15),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 12),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 Text(
//                                   'Class :',
//                                   style: interSemiBold.copyWith(
//                                     color: Colors.indigo,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                                 SizedBox(width: 5),
//                                 Text(
//                                   "${dairy.className ?? 'N/A'}",
//                                   style: interSemiBold.copyWith(
//                                     color: Colors.indigo,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 15),
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 12),
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           color: Theme.of(context).cardColor,
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(height: 10),
//                             Text(
//                               dairy.teacherName ?? 'N/A',
//                               style: interSemiBold.copyWith(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 14,
//                               ),
//                               textAlign: TextAlign.start,
//                             ),
//                             SizedBox(height: 10),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         "Section",
//                                         style: interSemiBold.copyWith(
//                                           color: Colors.indigo,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                       SizedBox(height: 5),
//                                       Text(
//                                         dairy.sectionName ?? 'N/A',
//                                         style: interRegular.copyWith(
//                                           color: Theme.of(context).disabledColor,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         "Published on",
//                                         style: interRegular.copyWith(
//                                           color: Colors.indigo,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                       Text(
//                                         dairy.createDate ?? 'N/A',
//                                         style: interRegular.copyWith(
//                                           color: Colors.black,
//                                           fontSize: 14,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.end,
//                                     children: [
//                                       Text(
//                                         "Subject",
//                                         style: interSemiBold.copyWith(
//                                           color: Colors.indigo,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                       SizedBox(height: 5),
//                                       Text(
//                                         dairy.subjectName ?? 'N/A',
//                                         style: interRegular.copyWith(
//                                           color: Theme.of(context).disabledColor,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 10),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Text(
//                                       "Title: ",
//                                       style: interSemiBold.copyWith(
//                                         color: Colors.indigo,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                       overflow: TextOverflow.ellipsis,
//                                       maxLines: 1,
//                                     ),
//                                     SizedBox(height: 5),
//                                     Flexible(
//                                       child: Text(
//                                         dairy.title ?? 'N/A',
//                                         style: interRegular.copyWith(
//                                           color: Theme.of(context).disabledColor,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                         overflow: TextOverflow.ellipsis,
//                                         maxLines: 1,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(height: 7),
//                                 Text(
//                                   "Description:",
//                                   style: interRegular.copyWith(
//                                     color: Colors.indigo,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                                 SizedBox(height: 5),
//                                 // Text(
//                                 //   (dairy.description ?? 'N/A')
//                                 //       .replaceAll('“', '"')
//                                 //       .replaceAll('”', '"'),
//                                 //   maxLines: isSeeMore ? null : 2,
//                                 //   overflow: isSeeMore ? TextOverflow.visible : TextOverflow.ellipsis,
//                                 //   style: interSemiBold.copyWith(
//                                 //     color: Theme.of(context).disabledColor,
//                                 //     fontSize: 15,
//                                 //     fontWeight: FontWeight.w400,
//                                 //   ),
//                                 // ),
//                                 Text(
//                                   (dairy.description ?? 'N/A')
//                                       .replaceAll('“', '"')
//                                       .replaceAll('”', '"')
//                                       .replaceAll('\u00A0', ' ') // Fixes non-breaking spaces
//                                       .replaceAll(RegExp(r'\s+'), ' ') //  Normalizes multiple spaces
//                                       .trim(), // Removes leading and trailing spaces
//                                   maxLines: isSeeMore ? null : 2,
//                                   overflow: isSeeMore ? TextOverflow.visible : TextOverflow.ellipsis,
//                                   style: interSemiBold.copyWith(
//                                     color: Theme.of(context).disabledColor,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//
//                                 SizedBox(height: 5),
//                                 if ((dairy.description ?? '').length > 80)
//                                   Align(
//                                     alignment: Alignment.centerRight,
//                                     child: GestureDetector(
//                                       onTap: () {
//                                         setState(() {
//                                           isSeeMore = !isSeeMore;
//                                         });
//                                       },
//                                       child: Text(
//                                         isSeeMore ? "See Less" : "See More",
//                                         style: TextStyle(
//                                           color: Colors.indigo,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold,
//                                           decoration: TextDecoration.underline,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 SizedBox(height: 8),
//                               ],
//                             ),
//                             SizedBox(height: 8),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//
//       ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:erp_school/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/view_dairy_screen_service.dart';
import '../../../utils/api_cache_manager.dart';
import '../../../utils/styles.dart';
import '../../base/custom_appbar.dart';
import 'post_class_dairy.dart';
class ViewDairyScreen extends StatefulWidget {
  const ViewDairyScreen({Key? key}) : super(key: key);

  @override
  State<ViewDairyScreen> createState() => _ViewDairyScreenState();
}

class _ViewDairyScreenState extends State<ViewDairyScreen> {
  late double height;
  late double width;
  Future<ViewClassDiary>? classDairyFuture;
  List<ClassDiaryList>? classDairyList;

  final ClassSectionHelper apiService = ClassSectionHelper();
  List<String> grades = [];
  List<String> sections = [];
  String? selectedGrade;
  String? selectedSection;
  bool isSeeMore = false;
  bool isTextOverflowing = false;
  bool isOverflowing = false;
  final GlobalKey textKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    // classDairyFuture = ViewDairyScreenService()
    //     .fetchClassDairyDetails();
    apiService.loadData((classMappings, loadedGrades) {
      grades = loadedGrades;
      if(grades.isNotEmpty){
        updateSections(grades.first);
      }
    });
  }

  void updateSections(String grade) {
    apiService.updateSections(grade, (updatedSections, _) {
      setState(() {
        selectedGrade = grade;
        sections = updatedSections;
        selectedSection = sections.firstOrNull;
        classDairyFuture = null; // Reset data when grade changes
        if(selectedSection != null){
          updateSubjects(selectedSection!);
        }
      });
    });
  }
  void updateSubjects(String section) {
    final filtered = apiService.classMappings.firstWhere(
          (e) =>
      e[ApiCacheManager.KEY_GRADE] == selectedGrade &&
          e[ApiCacheManager.KEY_SECTION] == section,
      orElse: () => {},
    );

    if (filtered.isNotEmpty) {
      setState(() {
        selectedSection = section;
        apiService.selectedSectionId =
        filtered[ApiCacheManager.KEY_SECTION_ID]; // Corrected this
        classDairyFuture = apiService.fetchClassDiaryDetails();
      });
    } else {
      print("No matching section found!");
    }
  }

  void checkTextOverflow() {
    final RenderBox? renderBox = textKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final textPainter = TextPainter(
      text: TextSpan(
        text: "Waiting..",
        style: interSemiBold.copyWith(
          color: Theme.of(context).disabledColor,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
      maxLines: 2,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(maxWidth: renderBox.size.width);

    setState(() {
      isTextOverflowing = textPainter.didExceedMaxLines;
    });
  }

  // static ManageModle () async {
  //   // String? moduleSelected = "";
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final moduleSelected = prefs.getString('type')?.toLowerCase();
  // }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(Icons.add),
            onPressed: () async {
              await Get.to(PostClassDairy());
              apiService.loadData((classMappings, loadedGrades) {
                grades = loadedGrades;
                if(grades.isNotEmpty){
                  updateSections(grades.first);
                }
              });
            },
          ),
          appBar: CustomAppBar(
            title: 'class_diary'.tr,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 15),
              child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Class Selection Dropdown
                       Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 4)],
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
                                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      onChanged: (String? value) {
                                        if (value != null) {
                                          setState(() {
                                            selectedGrade = value;
                                          });
                                          updateSections(value);
                                          Navigator.pop(context);
                                        }
                                      },
                                    ),
                                    Text(grade, style: TextStyle(color: Colors.black45)),
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
                                Future.microtask(() {
                                  // Navigator.pop(context);
                                });
                              }
                            },
                          ),
                        ),
                      ) ,
                      SizedBox(height: 10),
                      // Section Selection Dropdown
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 4)],
                          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
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
                              "   Select Class",
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                            ),
                            items: sections.map((String section) {
                              return DropdownMenuItem<String>(
                                value: section,
                                child: Row(
                                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      onChanged: (String? value) {
                                        if (value != null) {
                                          setState(() {
                                            selectedSection = value;
                                          });
                                          updateSections(value);
                                        }
                                      },
                                    ),
                                    Text(section, style: TextStyle(color: Colors.black45)),
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
                      SizedBox(height: 10),
                      // Class Diary Data Display
                      FutureBuilder<ViewClassDiary>(
                        future: classDairyFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator(color: Colors.blue));
                          } else if (snapshot.hasError) {
                            return Center(child: Text("Error: ${snapshot.error}"));
                          } else if (snapshot.data == null || snapshot.data!.classDiaryList == null || snapshot.data!.classDiaryList!.isEmpty) {
                            return Center(child: Text("No class diary data found"));
                          }

                          var classDiaryList = snapshot.data!.classDiaryList!; // Ensure correct naming


                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: classDiaryList.length,
                            itemBuilder: (context, index) {
                              var dairy = classDiaryList[index];

                              return GestureDetector(
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.secondary,
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
                                      SizedBox(height: 15),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 12),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'Class :',
                                                  style: interSemiBold.copyWith(
                                                    color: Colors.indigo,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  "${dairy.className ?? 'N/A'}",
                                                  style: interSemiBold.copyWith(
                                                    color: Colors.indigo,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 12),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).cardColor,
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 10),
                                            Text(
                                              "${dairy.teacherName ?? 'No data'}",
                                              style: interSemiBold.copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Section",
                                                        style: interSemiBold.copyWith(
                                                          color: Colors.indigo,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Text(
                                                        dairy.sectionName ?? 'N/A',
                                                        style: interRegular.copyWith(
                                                          color: Theme.of(context).disabledColor,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        "Published on",
                                                        style: interRegular.copyWith(
                                                          color: Colors.indigo,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                      Text(
                                                        dairy.createDate ?? 'N/A',
                                                        style: interRegular.copyWith(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        "Subject",
                                                        style: interSemiBold.copyWith(
                                                          color: Colors.indigo,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Text(
                                                        dairy.subjectName ?? 'N/A',
                                                        style: interRegular.copyWith(
                                                          color: Theme.of(context).disabledColor,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Title: ",
                                                      style: interSemiBold.copyWith(
                                                        color: Colors.indigo,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                    ),
                                                    SizedBox(height: 5),
                                                    Flexible(
                                                      child: Text(
                                                        dairy.title ?? 'N/A',
                                                        style: interRegular.copyWith(
                                                          color: Theme.of(context).disabledColor,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 7),
                                                Text(
                                                  "Description:",
                                                  style: interRegular.copyWith(
                                                    color: Colors.indigo,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                // Text(
                                                //   (dairy.description ?? 'N/A')
                                                //       .replaceAll('“', '"')
                                                //       .replaceAll('”', '"'),
                                                //   maxLines: isSeeMore ? null : 2,
                                                //   overflow: isSeeMore ? TextOverflow.visible : TextOverflow.ellipsis,
                                                //   style: interSemiBold.copyWith(
                                                //     color: Theme.of(context).disabledColor,
                                                //     fontSize: 15,
                                                //     fontWeight: FontWeight.w400,
                                                //   ),
                                                // ),
                                                Text(
                                                  (dairy.description ?? 'N/A')
                                                      .replaceAll('“', '"')
                                                      .replaceAll('”', '"')
                                                      .replaceAll('\u00A0', ' ') // Fixes non-breaking spaces
                                                      .replaceAll(RegExp(r'\s+'), ' ') //  Normalizes multiple spaces
                                                      .trim(), // Removes leading and trailing spaces
                                                  maxLines: isSeeMore ? null : 2,
                                                  overflow: isSeeMore ? TextOverflow.visible : TextOverflow.ellipsis,
                                                  style: interSemiBold.copyWith(
                                                    color: Theme.of(context).disabledColor,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),

                                                SizedBox(height: 5),
                                                if ((dairy.description ?? '').length > 80)
                                                  Align(
                                                    alignment: Alignment.centerRight,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          isSeeMore = !isSeeMore;
                                                        });
                                                      },
                                                      child: Text(
                                                        isSeeMore ? "See Less" : "See More",
                                                        style: TextStyle(
                                                          color: Colors.indigo,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.bold,
                                                          decoration: TextDecoration.underline,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                SizedBox(height: 8),
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),

                    ],
            ),),
          ),
        );
  }
}
