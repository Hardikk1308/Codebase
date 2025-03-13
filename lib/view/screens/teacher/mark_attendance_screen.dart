// import 'package:erp_school/data/models/response/attendance_model.dart';
// import 'package:erp_school/themes/light.dart';
// import 'package:erp_school/utils/dimensions.dart';
// import 'package:erp_school/utils/styles.dart';
// import 'package:erp_school/view/base/custom_appbar.dart';
// import 'package:erp_school/view/base/custom_button.dart';
// import 'package:erp_school/view/screens/teacher/teacher_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import '../../../services/School_service.dart';
// import '../../../utils/api_cache_manager.dart';
// import 'attendance_pagesss.dart';
// import 'attendance_screens.dart';
//
// class MarkAttendanceScreen extends StatefulWidget {
//   final List<AttendanceDetail> attendanceDetails;
//   final AttendanceModel attendanceModel;
//   final sectionID;
//   final grade;
//
//   MarkAttendanceScreen(this.attendanceDetails, this.attendanceModel, this.sectionID, this.grade, {super.key});
//
//   @override
//   _MarkAttendanceScreenState createState() => _MarkAttendanceScreenState();
// }
//
// class _MarkAttendanceScreenState extends State<MarkAttendanceScreen> {
//   late List<AttendanceDetail> attendanceDetails;
//   late AttendanceModel attendanceModel;
//
//   @override
//   void initState() {
//     super.initState();
//     attendanceDetails = widget.attendanceDetails;
//     attendanceModel = widget.attendanceModel;
//   }
//   Future<void> submitAttendance() async {
//     // Check if all students have a valid attendance status
//     final invalidEntries = attendanceDetails.where((detail) =>
//     detail.attendanceStatus == null ||
//         !(detail.attendanceStatus!.toUpperCase() == 'PRESENT' ||
//             detail.attendanceStatus!.toUpperCase() == 'ABSENT')).toList();
//
//     if (invalidEntries.isNotEmpty) {
//       // Show a warning message if any student is missing a valid status
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please mark attendance for all students (Present/Absent).'),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }
//     // Proceed with attendance submission
//     int? schoolId = await SchoolService.getSchoolId();
//     if (schoolId == null) {
//       print('School ID not found. Cannot submit attendance.');
//       return;
//     }
//     final date = DateFormat('yyyy-MM-dd').format(DateTime.now());
//     final mappings = await ApiCacheManager().getClassMappings();
//
//     String sectionId = "";
//     String gradeId = "";
//
//     for (final mapping in mappings) {
//       String section = mapping[ApiCacheManager.KEY_SECTION];
//       String grade = mapping[ApiCacheManager.KEY_GRADE];
//
//       if (section == widget.sectionID && grade == widget.grade) {
//         sectionId = mapping[ApiCacheManager.KEY_SECTION_ID];
//         gradeId = mapping[ApiCacheManager.KEY_SECTION_ID];
//         break;
//       }
//     }
//     if (sectionId.isEmpty) {
//       print('No matching section ID found for the given section.');
//       return;
//     }
//     // Map attendance details to DTO
//     List<AttendanceDTO> attendanceList = attendanceDetails.map((detail) {
//       return AttendanceDTO(
//         studentId: detail.studentID,
//         schoolId: schoolId,
//         gradeId: gradeId,
//         sectionId: sectionId,
//         attendanceStatus: detail.attendanceStatus!.toUpperCase(),
//         attendanceDate: date,
//       );
//     }).toList();
//
//     bool success = await AttendanceService.saveAttendance(attendanceList);
//
//     if (success) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(backgroundColor: Theme.of(context).primaryColor, content: Text('Attendance saved successfully!'),
//         ),
//       );
//       // Get.to(AttendanceScreens)
//       Navigator.pop(context);
//       Navigator.pop(context);
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AttendanceScreens()));
//
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(backgroundColor: Theme.of(context).primaryColor, content: Text('Failed to save attendance.')),
//       );
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).cardColor,
//       appBar: CustomAppBar(title: 'mark_attendance'.tr),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: attendanceDetails.length,
//                 itemBuilder: (context, index) {
//                   return AttendanceCard(attendanceDetails[index]);
//                 },
//               ),
//               SizedBox(height: 30),
//               CustomButton(
//                 height: 50,
//                 fontSize: 16,
//                 color: true,
//                 radius: 50,
//                 title: 'mark_attendance'.tr,
//                 onPressed: submitAttendance,
//               ),
//               // InkWell(
//               //   onTap: widget.attendanceDetails.firstOrNull?.attendanceStatus == null ? submitAttendance : null,
//               //   child: Container(
//               //     height: 50,
//               //     width: double.infinity,
//               //     decoration: BoxDecoration(
//               //         color: widget.attendanceDetails.any((detail) => detail.attendanceStatus == null)
//               //             ?  Theme.of(context).primaryColor
//               //             :Colors.grey ,
//               //         borderRadius: BorderRadius.circular(16)
//               //     ),
//               //     child: Center(child: Text("Mark Attendance",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)),
//               //   ),
//               // ),
//               SizedBox(height: 50),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class AttendanceCard extends StatefulWidget {
//   final AttendanceDetail attendance;
//
//   AttendanceCard(this.attendance);
//
//   @override
//   State<AttendanceCard> createState() => _AttendanceCardState();
// }
//
// class _AttendanceCardState extends State<AttendanceCard> {
//
//   void _onStatusTap([bool present = false]) {
//     setState(() {
//       if (present) {
//         widget.attendance.attendanceStatus = "absent";
//       } else {
//         widget.attendance.attendanceStatus = "present";
//       }
//     });
//     print("new:changed: ${widget.attendance.attendanceStatus?.toLowerCase()}");
//   }
//   final date = DateFormat("yyyy-MM-dd").format(DateTime.now());
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4.0,
//       color: Theme.of(context).cardColor,
//       margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 const CircleAvatar(
//                   child: Icon(
//                     Icons.person,
//                     color: Colors.white,
//                   ),
//                   backgroundColor: Colors.blue,
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Roll No: ${widget.attendance.studentRollNo}',
//                         style: const TextStyle(fontSize: 14, color: Colors.black),
//                       ),
//                       Text(
//                         widget.attendance.studentName,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                       Text(
//                         'Date: ${date}',
//                         style: TextStyle(fontSize: 14, color: Colors.black54),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Icon(
//                   widget.attendance.attendanceStatus?.toLowerCase() == "present"
//                       ? Icons.check_circle
//                       : Icons.cancel,
//                   color: widget.attendance.attendanceStatus?.toLowerCase() == "present"
//                       ? Colors.green
//                       : Colors.red,
//                   size: 28,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 12),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 InkWell(
//                   onTap: () => _onStatusTap(true),
//                   child: AttendanceStatusSumision(
//                     color: widget.attendance.attendanceStatus?.toLowerCase() == "present" ? Colors.green : Colors.black12,
//                     title: 'Present',
//                     number: '',
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: ()=> _onStatusTap(false),
//                   child: AttendanceStatusSumision(
//                     color: widget.attendance.attendanceStatus?.toLowerCase() == "absent" ? Colors.green : Colors.black12,
//                     title: 'Absent',
//                     number: '',
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Checkbox(
//                       value: true,
//                       onChanged: (bool? value) {},
//                     ),
//                     Text(
//                       'Any Remark',
//                       style: interRegular.copyWith(
//                           fontSize: 12,
//                           color: Theme.of(context).disabledColor),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class AttendanceStatusSumision extends StatelessWidget {
//   final Color color;
//   final String title;
//   final String number;
//
//   AttendanceStatusSumision({
//     super.key,
//     required this.color,
//     required this.title,
//     required this.number,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
//       height: 30,
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:erp_school/data/models/response/attendance_model.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../services/School_service.dart';
import '../../../utils/api_cache_manager.dart';
import 'attendance_pagesss.dart';
import 'attendance_screens.dart';

class MarkAttendanceScreen extends StatefulWidget {
  final List<AttendanceDetail> attendanceDetails;
  final AttendanceModel attendanceModel;
  final sectionID;
  final grade;
  final isSelected;

  MarkAttendanceScreen(this.attendanceDetails, this.attendanceModel, this.sectionID, this.grade, this.isSelected, {super.key});

  @override
  _MarkAttendanceScreenState createState() => _MarkAttendanceScreenState();
}

class _MarkAttendanceScreenState extends State<MarkAttendanceScreen> {
  late List<AttendanceDetail> attendanceDetails;
  late AttendanceModel attendanceModel;

  @override
  void initState() {
    super.initState();
    attendanceDetails = widget.attendanceDetails;
    attendanceModel = widget.attendanceModel;
  }
  Future<void> submitAttendance() async {
    // Check if all students have a valid attendance status
    final invalidEntries = attendanceDetails.where((detail) =>
    detail.attendanceStatus == null ||
        !(detail.attendanceStatus!.toUpperCase() == 'PRESENT' ||
            detail.attendanceStatus!.toUpperCase() == 'ABSENT')).toList();

    if (invalidEntries.isNotEmpty) {
      // Show a warning message if any student is missing a valid status
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please mark attendance for all students (Present/Absent).'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    // Proceed with attendance submission
    int? schoolId = await SchoolService.getSchoolId();
    if (schoolId == null) {
      print('School ID not found. Cannot submit attendance.');
      return;
    }
    final date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final mappings = await ApiCacheManager().getClassMappings();

    String sectionId = "";
    String gradeId = "";

    for (final mapping in mappings) {
      String section = mapping[ApiCacheManager.KEY_SECTION];
      String grade = mapping[ApiCacheManager.KEY_GRADE];

      if (section == widget.sectionID && grade == widget.grade) {
        sectionId = mapping[ApiCacheManager.KEY_SECTION_ID];
        gradeId = mapping[ApiCacheManager.KEY_SECTION_ID];
        break;
      }
    }
    if (sectionId.isEmpty) {
      print('No matching section ID found for the given section.');
      return;
    }
    // Map attendance details to DTO
    List<AttendanceDTO> attendanceList = attendanceDetails.map((detail) {
      return AttendanceDTO(
        studentId: detail.studentID,
        schoolId: schoolId,
        gradeId: gradeId,
        sectionId: sectionId,
        attendanceStatus: detail.attendanceStatus!.toUpperCase(),
        attendanceDate: date,
      );
    }).toList();

    bool success = await AttendanceService.saveAttendance(attendanceList);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Theme.of(context).primaryColor, content: Text('Attendance saved successfully!'),
        ),
      );
      // Get.to(AttendanceScreens)
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AttendanceScreens()));

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Theme.of(context).primaryColor, content: Text('Failed to save attendance.')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: CustomAppBar(title: 'submit_attendance'.tr),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: attendanceDetails.length,
                itemBuilder: (context, index) {
                  return AttendanceCard(attendanceDetails[index]);
                },
              ),
              SizedBox(height: 30),
              // CustomButton(
              //   height: 50,
              //   fontSize: 16,
              //   color: true,
              //   radius: 50,
              //   title: 'mark_attendance'.tr,
              //   onPressed: (attendance.attendanceStatus != null){
              // submitAttendance ();
              //   }
              // ),
              InkWell(
                onTap: widget.isSelected ? submitAttendance : null,
                child: Container(
                  height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: widget.isSelected
                      ?  Theme.of(context).primaryColor
                      :Colors.grey ,
                  borderRadius: BorderRadius.circular(16)
                ),
                  child: Center(child: Text("Submit Attendance",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
class AttendanceCard extends StatefulWidget {
  final AttendanceDetail attendance;

  AttendanceCard(this.attendance);

  @override
  State<AttendanceCard> createState() => _AttendanceCardState();
}
class _AttendanceCardState extends State<AttendanceCard> {
  @override
  void initState() {
    super.initState();
    // Set default attendance status to "present" if not already set
    // if (widget.attendance.attendanceStatus == null) {
    //   widget.attendance.attendanceStatus = "present";
    // }
  }

  // void _onStatusTap(bool isPresent) {
  //   setState(() {
  //     widget.attendance.attendanceStatus = isPresent ? "present" : "absent";
  //   });
  //   print("Changed Status: ${widget.attendance.attendanceStatus}");
  // }

  void _onStatusTap(bool isPresent) {
    setState(() {
     //widget.attendance.attendanceStatus ??= "present";
      widget.attendance.attendanceStatus = isPresent ? "present" : "absent";
    });
    print("Changed Status: ${widget.attendance.attendanceStatus}");
  }

  final date = DateFormat("yyyy-MM-dd").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      color: Theme.of(context).cardColor,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  child: Icon(Icons.person, color: Colors.white),
                  backgroundColor: Colors.blue,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Roll No: ${widget.attendance.studentRollNo}',
                        style: const TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      Text(
                        widget.attendance.studentName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Date: $date',
                        style: const TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                Icon(
                  widget.attendance.attendanceStatus?.toLowerCase() == "present"
                      ? Icons.check_circle
                      : Icons.cancel,
                  color: widget.attendance.attendanceStatus?.toLowerCase() == "present"
                      ? Colors.green
                      : Colors.red,
                  size: 28,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => _onStatusTap(true),
                  child: AttendanceStatusSumision(
                    color: widget.attendance.attendanceStatus?.toLowerCase() == "present"
                        ? Colors.green
                        : Colors.black12,
                    title: 'Present',
                    number: '',
                  ),
                ),
                InkWell(
                  onTap: () => _onStatusTap(false),
                  child: AttendanceStatusSumision(
                    color: widget.attendance.attendanceStatus?.toLowerCase() == "absent"
                        ? Colors.red
                        : Colors.black12,
                    title: 'Absent',
                    number: '',
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (bool? value) {},
                    ),
                    Text(
                      'Any Remark',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).disabledColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// class AttendanceCard extends StatefulWidget {
//   final AttendanceDetail attendance;
//
//   AttendanceCard(this.attendance);
//
//   @override
//   State<AttendanceCard> createState() => _AttendanceCardState();
// }
//
// class _AttendanceCardState extends State<AttendanceCard> {
//   void _onStatusTap(bool isPresent) {
//     setState(() {
//       widget.attendance.attendanceStatus = isPresent ? "present" : "absent";
//     });
//     print("Changed Status: ${widget.attendance.attendanceStatus}");
//   }
//
//   final date = DateFormat("yyyy-MM-dd").format(DateTime.now());
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4.0,
//       color: Theme.of(context).cardColor,
//       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 const CircleAvatar(
//                   child: Icon(Icons.person, color: Colors.white),
//                   backgroundColor: Colors.blue,
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Roll No: ${widget.attendance.studentRollNo}',
//                         style: const TextStyle(fontSize: 14, color: Colors.black),
//                       ),
//                       Text(
//                         widget.attendance.studentName,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                       Text(
//                         'Date: $date',
//                         style: const TextStyle(fontSize: 14, color: Colors.black54),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Icon(
//                   widget.attendance.attendanceStatus?.toLowerCase() == "present"
//                       ? Icons.check_circle
//                       : Icons.cancel,
//                   color: widget.attendance.attendanceStatus?.toLowerCase() == "present"
//                       ? Colors.green
//                       : Colors.red,
//                   size: 28,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 12),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 InkWell(
//                   onTap: () => _onStatusTap(true),
//                   child: AttendanceStatusSumision(
//                     color: widget.attendance.attendanceStatus?.toLowerCase() == "present"
//                         ? Colors.green
//                         : Colors.black12,
//                     title: 'Present',
//                     number: '',
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () => _onStatusTap(false),
//                   child: AttendanceStatusSumision(
//                     color: widget.attendance.attendanceStatus?.toLowerCase() == "absent"
//                         ? Colors.red
//                         : Colors.black12,
//                     title: 'Absent',
//                     number: '',
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Checkbox(
//                       value: true,
//                       onChanged: (bool? value) {},
//                     ),
//                     Text(
//                       'Any Remark',
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Theme.of(context).disabledColor,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class AttendanceStatusSumision extends StatelessWidget {
  final Color color;
  final String title;
  final String number;

  AttendanceStatusSumision({
    super.key,
    required this.color,
    required this.title,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
      height: 30,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
