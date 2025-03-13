// import 'package:erp_school/constants/app_constants.dart';
// import 'package:erp_school/data/models/response/student_timetable_model.dart';
// import 'package:erp_school/data/models/response/teacher_timetable_model.dart';
// import 'package:erp_school/services/timetable_service.dart';
// import 'package:erp_school/view/base/custom_dropdown.dart';
// import 'package:erp_school/view/screens/homework/widget/time_table_widget.dart';
// import 'package:erp_school/view/screens/parents/add_timetable.dart';
// import 'package:flutter/material.dart';
// import 'package:erp_school/utils/dimensions.dart';
// import 'package:erp_school/utils/styles.dart';
// import 'package:erp_school/view/base/custom_appbar.dart';
// import 'package:get/get.dart';
//
// class TimeTableScreen extends StatefulWidget {
//   final bool isclass;
//   final bool isaddtable;
//   const TimeTableScreen(
//       {super.key, this.isclass = false, this.isaddtable = false});
//
//   @override
//   State<TimeTableScreen> createState() => _TimeTableScreenState();
// }
//
// class _TimeTableScreenState extends State<TimeTableScreen> {
//   final List<DropdownItem<int>> selectClass = [
//     DropdownItem(
//         value: 1,
//         child: Text(
//           'Class 1',
//           style: interMedium.copyWith(
//               fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
//         )),
//     DropdownItem(
//         value: 2,
//         child: Text(
//           'Class 2',
//           style: interMedium.copyWith(
//               fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
//         )),
//     DropdownItem(
//         value: 3,
//         child: Text(
//           'Class 3',
//           style: interMedium.copyWith(
//               fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
//         )),
//     DropdownItem(
//         value: 4,
//         child: Text(
//           'Class 4',
//           style: interMedium.copyWith(
//               fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
//         )),
//     DropdownItem(
//         value: 5,
//         child: Text(
//           'Class 5',
//           style: interMedium.copyWith(
//               fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
//         )),
//   ];
//   final List<DropdownItem<int>> selectSection = [
//     DropdownItem(
//         value: 1,
//         child: Text(
//           'Section A',
//           style: interMedium.copyWith(
//               fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
//         )),
//     DropdownItem(
//         value: 2,
//         child: Text(
//           'Section B',
//           style: interMedium.copyWith(
//               fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
//         )),
//     DropdownItem(
//         value: 3,
//         child: Text(
//           'Section C',
//           style: interMedium.copyWith(
//               fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
//         )),
//     DropdownItem(
//         value: 4,
//         child: Text(
//           'Section D',
//           style: interMedium.copyWith(
//               fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
//         )),
//     DropdownItem(
//         value: 5,
//         child: Text(
//           'Section E',
//           style: interMedium.copyWith(
//               fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
//         )),
//   ];
//
//   late Future<TeacherTimetableModel> timeTableFuture;
//   var studentTimetableModel;
//   late Future<StudentTimetableModel> studentTimetableFuture;
//
//   final TimeTableService _timeTableService = TimeTableService();
//
//   @override
//   void initState() {
//     print('isclass: ${widget.isclass}, isaddtable: ${widget.isaddtable}');
//     if (!widget.isclass && !widget.isaddtable) {
//       studentTimetableFuture = _timeTableService.fetchStudentTimeTable();
//     } else if (!widget.isaddtable) {
//       timeTableFuture = _timeTableService.fetchTeacherTimeTable();
//     }
//     // timeTableFuture = _timeTableService.fetchTeacherTimeTable();
//     super.initState();
//   }
//
//   int? selectedIndex = 1;
//   List<String> days = [
//     "Monday",
//     "Tuesday",
//     "Wednesday",
//     "Thursday",
//     "Friday",
//     "Saturday",
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: widget.isaddtable
//           ? FloatingActionButton(
//         backgroundColor: Theme.of(context).primaryColor,
//         onPressed: () {
//           Get.to(const AddTimeTableScreen());
//         },
//         child: Container(
//           height: 64,
//           width: 64,
//           decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Theme.of(context).primaryColor),
//           child: Center(
//             child: Icon(
//               Icons.add,
//               color: Theme.of(context).cardColor,
//             ),
//           ),
//         ),
//       )
//           : null,
//       backgroundColor: Theme.of(context).cardColor,
//       appBar: CustomAppBar(
//         title: 'time_table'.tr,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 8),
//         child: SafeArea(
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               // widget.isclass
//               //     ? Column(
//               //         children: [
//               //           Column(
//               //             children: [
//               //               Align(
//               //                 alignment: Alignment.topLeft,
//               //                 child: Text(
//               //                   "select_class".tr,
//               //                   style: interMedium.copyWith(
//               //                       fontSize: Dimensions.fontSizeExtraSmall,
//               //                       height: 1.4,
//               //                       color: Theme.of(context).disabledColor),
//               //                 ),
//               //               ),
//               //               const SizedBox(
//               //                 height: Dimensions.radiusSmall,
//               //               ),
//               //               Container(
//               //                 decoration: BoxDecoration(
//               //                   color: Theme.of(context).cardColor,
//               //                   boxShadow: const [BoxShadow()],
//               //                   borderRadius: BorderRadius.circular(
//               //                       Dimensions.radiusDefault),
//               //                 ),
//               //                 child: CustomDropdown<int>(
//               //                   onChange: (int? value, int index) {},
//               //                   items: selectClass,
//               //                   dropdownStyle:
//               //                       DropdownStyle(color: Get.theme.cardColor),
//               //                   itemTextStyle: interMedium.copyWith(
//               //                       fontSize: Dimensions.fontSizeExtraSmall,
//               //                       color: Theme.of(context).hintColor),
//               //                   icon: Icon(
//               //                     Icons.arrow_drop_down,
//               //                     color: Theme.of(context).hintColor,
//               //                   ),
//               //                   dropdownButtonStyle: DropdownButtonStyle(
//               //                     height: 55,
//               //                     primaryColor: Theme.of(context).primaryColor,
//               //                   ),
//               //                   child: Padding(
//               //                     padding: const EdgeInsets.symmetric(
//               //                         horizontal: Dimensions.paddingSizeSMALL),
//               //                     child: Text(
//               //                       "select_class".tr,
//               //                       style: interMedium.copyWith(
//               //                           fontSize: Dimensions.fontSizeExtraSmall,
//               //                           color: Theme.of(context).disabledColor),
//               //                     ),
//               //                   ),
//               //                 ),
//               //               ),
//               //               const SizedBox(
//               //                 height: 20,
//               //               ),
//               //             ],
//               //           ),
//               //           Column(
//               //             children: [
//               //               Align(
//               //                 alignment: Alignment.topLeft,
//               //                 child: Text(
//               //                   "select_section".tr,
//               //                   style: interMedium.copyWith(
//               //                       fontSize: Dimensions.fontSizeExtraSmall,
//               //                       height: 1.4,
//               //                       color: Theme.of(context).disabledColor),
//               //                 ),
//               //               ),
//               //               const SizedBox(
//               //                 height: Dimensions.radiusSmall,
//               //               ),
//               //               Container(
//               //                 decoration: BoxDecoration(
//               //                   color: Theme.of(context).cardColor,
//               //                   boxShadow: const [BoxShadow()],
//               //                   borderRadius: BorderRadius.circular(
//               //                       Dimensions.radiusDefault),
//               //                 ),
//               //                 child: CustomDropdown<int>(
//               //                   onChange: (int? value, int index) {},
//               //                   items: selectSection,
//               //                   dropdownStyle:
//               //                       DropdownStyle(color: Get.theme.cardColor),
//               //                   itemTextStyle: interMedium.copyWith(
//               //                       fontSize: Dimensions.fontSizeExtraSmall,
//               //                       color: Theme.of(context).hintColor),
//               //                   icon: Icon(
//               //                     Icons.arrow_drop_down,
//               //                     color: Theme.of(context).hintColor,
//               //                   ),
//               //                   dropdownButtonStyle: DropdownButtonStyle(
//               //                     height: 55,
//               //                     primaryColor: Theme.of(context).primaryColor,
//               //                   ),
//               //                   child: Padding(
//               //                     padding: const EdgeInsets.symmetric(
//               //                         horizontal: Dimensions.paddingSizeSMALL),
//               //                     child: Text(
//               //                       "select_section".tr,
//               //                       style: interMedium.copyWith(
//               //                           fontSize: Dimensions.fontSizeExtraSmall,
//               //                           color: Theme.of(context).disabledColor),
//               //                     ),
//               //                   ),
//               //                 ),
//               //               ),
//               //               const SizedBox(
//               //                 height: 20,
//               //               ),
//               //             ],
//               //           ),
//               //         ],
//               //       )
//               //     : SizedBox(),
//
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: List.generate(6, (index) {
//                     List<String> days = [
//                       "Monday",
//                       "Tuesday",
//                       "Wednesday",
//                       "Thursday",
//                       "Friday",
//                       "Saturday",
//                     ];
//
//                     return Padding(
//                       padding: const EdgeInsets.only(right: 15),
//                       child: GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             selectedIndex = index + 1;
//                           });
//                         },
//                         child: Container(
//                           height: 40,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(8),
//                             color: selectedIndex == index + 1
//                                 ? Theme.of(context).primaryColor
//                                 : Colors.black12,
//                             border: Border.all(
//                               color: selectedIndex == index + 1
//                                   ? Theme.of(context).primaryColor
//                                   : Colors.transparent,
//                             ),
//                           ),
//                           alignment: Alignment.center,
//                           padding: const EdgeInsets.symmetric(horizontal: 12),
//                           child: Text(
//                             days[index],
//                             style: interMedium.copyWith(
//                               fontSize: 13,
//                               color: selectedIndex == index + 1
//                                   ? Theme.of(context).cardColor
//                                   : Theme.of(context).disabledColor,
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   }),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               if (!widget.isclass && !widget.isaddtable)
//                 FutureBuilder<StudentTimetableModel>(
//                   future: studentTimetableFuture,
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       var studentTimetableFuture = snapshot.data!;
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                         child: ListView.builder(
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemCount: studentTimetableFuture
//                               .timeTableList[days[selectedIndex! - 1]]
//                               ?.length ??
//                               0,
//                           itemBuilder: (context, index) {
//                             var timeEntry =
//                             studentTimetableFuture.timeTableList[
//                             days[selectedIndex! - 1]]![index];
//                             return TimeTableWidget(
//                               lunch: false,
//                               subject: timeEntry.subject,
//                               teacher: timeEntry.teacher,
//                               timeslot: timeEntry.timeslot,
//                               roomNumber: timeEntry.roomNumber,
//                               type: STUDENT,
//                             );
//                           },
//                         ),
//                       );
//                     } else if (snapshot.hasError) {
//                       return Text('${snapshot.error}');
//                     }
//                     return const Center(child: CircularProgressIndicator());
//                   },
//                 )
//               else
//                 FutureBuilder<TeacherTimetableModel>(
//                   future: timeTableFuture,
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       var teacherTimetableData = snapshot.data!;
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                         child: ListView.builder(
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemCount: getSessionsForDay(teacherTimetableData,
//                               days[selectedIndex! - 1])!.length,
//                           itemBuilder: (context, index) {
//                             var timeEntry = getSessionsForDay(
//                                 teacherTimetableData,
//                                 days[selectedIndex! - 1])![index];
//                             return TimeTableWidget(
//                               lunch: false,
//                               subject: timeEntry.subject,
//                               roomNumber: timeEntry.roomNumber,
//                               startTime: timeEntry.timeslot,
//                               className: timeEntry.gradeSection,
//                               type: TEACHER,
//                             );
//                           },
//                         ),
//                       );
//                     } else if (snapshot.hasError) {
//                       return Text('${snapshot.error}');
//                     }
//                     return const Center(child: CircularProgressIndicator());
//                   },
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// List<Session>? getSessionsForDay(TeacherTimetableModel timetable, String day) {
//   return timetable.timeTableList[day];
//   // studentTimetableFuture.timeTableList[
//   // days[selectedIndex! - 1]]![index];
// }
import 'package:erp_school/constants/app_constants.dart';
import 'package:erp_school/data/models/response/student_timetable_model.dart';
import 'package:erp_school/data/models/response/teacher_timetable_model.dart';
import 'package:erp_school/services/timetable_service.dart';
import 'package:erp_school/view/base/custom_dropdown.dart';
import 'package:erp_school/view/screens/homework/widget/time_table_widget.dart';
import 'package:erp_school/view/screens/parents/add_timetable.dart';
import 'package:flutter/material.dart';
import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:get/get.dart';

class TimeTableScreen extends StatefulWidget {
  final bool isclass;
  final bool isaddtable;
  const TimeTableScreen(
      {super.key, this.isclass = false, this.isaddtable = false});

  @override
  State<TimeTableScreen> createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  final List<DropdownItem<int>> selectClass = [
    DropdownItem(
        value: 1,
        child: Text(
          'Class 1',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 2,
        child: Text(
          'Class 2',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 3,
        child: Text(
          'Class 3',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 4,
        child: Text(
          'Class 4',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 5,
        child: Text(
          'Class 5',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
  ];
  final List<DropdownItem<int>> selectSection = [
    DropdownItem(
        value: 1,
        child: Text(
          'Section A',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 2,
        child: Text(
          'Section B',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 3,
        child: Text(
          'Section C',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 4,
        child: Text(
          'Section D',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
    DropdownItem(
        value: 5,
        child: Text(
          'Section E',
          style: interMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Colors.black),
        )),
  ];

  late Future<TeacherTimetableModel> timeTableFuture;
  var studentTimetableModel;
  late Future<StudentTimetableModel> studentTimetableFuture;

  final TimeTableService _timeTableService = TimeTableService();

  @override
  void initState() {
    print('isclass: ${widget.isclass}, isaddtable: ${widget.isaddtable}');
    if (!widget.isclass && !widget.isaddtable) {
      studentTimetableFuture = _timeTableService.fetchStudentTimeTable();
    } else if (!widget.isaddtable) {
      timeTableFuture = _timeTableService.fetchTeacherTimeTable();
    }
    // timeTableFuture = _timeTableService.fetchTeacherTimeTable();
    super.initState();
  }

  int? selectedIndex = 1;
  List<String> days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: widget.isaddtable
          ? FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Get.to(const AddTimeTableScreen());
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
        title: 'time_table'.tr,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(6, (index) {
                    List<String> days = [
                      "Monday",
                      "Tuesday",
                      "Wednesday",
                      "Thursday",
                      "Friday",
                      "Saturday",
                    ];

                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index + 1;
                          });
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: selectedIndex == index + 1
                                ? Theme.of(context).primaryColor
                                : Colors.black12,
                            border: Border.all(
                              color: selectedIndex == index + 1
                                  ? Theme.of(context).primaryColor
                                  : Colors.transparent,
                            ),
                          ),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            days[index],
                            style: interMedium.copyWith(
                              fontSize: 13,
                              color: selectedIndex == index + 1
                                  ? Theme.of(context).cardColor
                                  : Theme.of(context).disabledColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              if (!widget.isclass && !widget.isaddtable)
                FutureBuilder<StudentTimetableModel>(
                  future: studentTimetableFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.timeTableList.isEmpty) {
                      return const Center(child: Text("No time table data found"));
                    } else {
                      var studentTimetableFuture = snapshot.data!;
                      var timetableData =
                      studentTimetableFuture.timeTableList[days[selectedIndex! - 1]];

                      if (timetableData == null || timetableData.isEmpty) {
                        return const Center(child: Text("No time table data found"));
                      }

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: timetableData.length,
                          itemBuilder: (context, index) {
                            var timeEntry = timetableData[index];
                            return TimeTableWidget(
                              lunch: false,
                              subject: timeEntry.subject,
                              teacher: timeEntry.teacher,
                              timeslot: timeEntry.timeslot,
                              roomNumber: timeEntry.roomNumber,
                              type: STUDENT,
                            );
                          },
                        ),
                      );
                    }
                  },
                )
              else
                FutureBuilder<TeacherTimetableModel>(
                  future: timeTableFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    } /*else if (!snapshot.hasData || snapshot.data!.sessions.isEmpty) {
                      return const Center(child: Text("No time table data found"));
                    }*/ else {
                      var teacherTimetableData = snapshot.data!;
                      var sessions = getSessionsForDay(
                          teacherTimetableData, days[selectedIndex! - 1]);

                      if (sessions == null || sessions.isEmpty) {
                        return const Center(child: Text("No time table data found"));
                      }

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: sessions.length,
                          itemBuilder: (context, index) {
                            var timeEntry = sessions[index];
                            return TimeTableWidget(
                              lunch: false,
                              subject: timeEntry.subject,
                              roomNumber: timeEntry.roomNumber,
                              startTime: timeEntry.timeslot,
                              className: timeEntry.gradeSection,
                              type: TEACHER,
                            );
                          },
                        ),
                      );
                    }
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}

List<Session>? getSessionsForDay(TeacherTimetableModel timetable, String day) {
  return timetable.timeTableList[day];
  // studentTimetableFuture.timeTableList[
  // days[selectedIndex! - 1]]![index];
}