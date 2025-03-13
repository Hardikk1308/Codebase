import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;
import 'package:get/get.dart';

import 'package:erp_school/data/models/response/attendance_model.dart';
import 'package:erp_school/services/teacher_attendance_service.dart';
import 'package:erp_school/themes/light.dart';
import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/images.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:erp_school/view/base/custom_button.dart';
import 'package:erp_school/view/screens/teacher/mark_attendance_screen.dart';
import '../../../data/models/response/attendance_summary.dart';
class ViewAttendanceScreen extends StatefulWidget {
  final AttendanceSummary summary ;
  ViewAttendanceScreen({required this.summary,});

  @override
  State<ViewAttendanceScreen> createState() => _ViewAttendanceScreenState();
}

class _ViewAttendanceScreenState extends State<ViewAttendanceScreen> {
  late Future<AttendanceModel> _attendanceFuture;
  late List<AttendanceDetail> attendanceDetails;
  final TeacherAttendanceService _teacherAttendanceService = TeacherAttendanceService();
  bool isSelected = false;
  // @override
  // void initState() {
  //   super.initState();
  //   attendanceDetails = attendanceDetails.map((e) {
  //     if (e.attendanceStatus == null){
  //       isSelected =true;
  //     }
  //     e.attendanceStatus = "present"; return e;
  //   },).toList();
  //   _attendanceFuture = _teacherAttendanceService.getTeacherAttendanceGradeSection(widget.summary.sectionId!, widget.summary.gradeId!);
  // }
  @override
  void initState() {
    super.initState();

    // Pehle ek empty list assign karo warna late initialization error aayega
    attendanceDetails = [];

    _attendanceFuture = _teacherAttendanceService.getTeacherAttendanceGradeSection(
      widget.summary.sectionId!,
      widget.summary.gradeId!,
    );

    // Jab _attendanceFuture complete hoga tab attendanceDetails ko update karna better hoga
    _attendanceFuture.then((attendance) {
      setState(() {
        attendanceDetails = attendance.attendanceDetails.map((e) {
          if (e.attendanceStatus == null) {
            isSelected = true;
            e.attendanceStatus = "present";
          }
          return e;
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("print attendance list ${widget.summary.absent}");
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: CustomAppBar(
        title: 'Attendance Summary'.tr,
      ),
      body: FutureBuilder<AttendanceModel>(
        future: _attendanceFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No Data Available'));
          }
          final attendance = snapshot.data!;
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.h,
                  // Class and Section Container
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    height: 55,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).cardColor,
                      boxShadow: [customBoxShadow()],
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          Images.classPng,
                          height: 30,
                          width: 30,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Class ${widget.summary.grade /*attendance.grade*/} , Section ${ widget.summary.section /*attendance.section*/}',
                          style: interMedium.copyWith(
                              color: Theme.of(context).disabledColor, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  20.h,
                  // Calendar Widget
                  Container(
                    height: Get.height / 2,
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).cardColor,
                      boxShadow: [customBoxShadow()],
                    ),
                    child: CalendarCarousel<Event>(
                      todayTextStyle: TextStyle(
                        color: Colors.white /*Theme.of(context).primaryColor,
                        background: Paint(),*/
                      ),
                      onDayPressed: (DateTime date, List<Event> events) {
                        // Handle date selection
                        print("Selected Date: $date");
                      },
                      weekendTextStyle: interSemiBold.copyWith(
                          color: Theme.of(context).disabledColor,
                          fontSize: 12
                      ),
                      weekdayTextStyle: interSemiBold.copyWith(
                        fontSize: 11,
                        color: Theme.of(context).disabledColor,
                      ),
                      selectedDayBorderColor: Colors.blue,
                      selectedDayButtonColor: Colors.blueAccent,
                      todayBorderColor: Theme.of(context).primaryColor,
                      todayButtonColor: Theme.of(context).primaryColor,
                      daysHaveCircularBorder: true,
                      showOnlyCurrentMonthDate: true,
                      headerTextStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      iconColor: Colors.black,
                      headerMargin: const EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                  30.h,
                  // Attendance Summary Dashboard
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    height: 40,
                    width: Get.width / 1.75,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        color: Theme.of(context).primaryColorLight,
                        boxShadow: [customBoxShadow()]),
                    child: Center(
                      child: Text(
                        'attendance_record_dashboard'.tr,
                        style: interMedium.copyWith(
                            fontSize: 12, color: Theme.of(context).cardColor),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      color: Theme.of(context).cardColor,
                      boxShadow: [customBoxShadow()],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PiechartWidget(
                            color: Theme.of(context).splashColor,
                            title: 'Present',
                            number: widget.summary.present.toString() /*summary.present.toString()*/,
                          ),
                          PiechartWidget(
                            color: Theme.of(context).canvasColor,
                            title: 'Absent',
                            number: widget.summary.absent.toString() /*summary.absent.toString()*/,
                          ),
                          PiechartWidget(
                            color: Theme.of(context).hoverColor,
                            title: 'Total',
                            number: widget.summary.totalStudents.toString() /*summary.totalStudents.toString()*/,
                          ),
                        ],
                      ),
                    ),
                  ),
                  30.h,
                  // Mark Attendance Button
                  CustomButton(
                    height: 50,
                    fontSize: 16,
                    color: true,
                    radius: 50,
                    title: 'mark_attendance'.tr,
                    onPressed: () {
                     // Get.to(MarkAttendanceScreen(attendance.attendanceDetails));
                      Navigator.push(
                        context,
                          MaterialPageRoute(
                            builder: (context)
                            {
                             //SectionMatch();
                              return MarkAttendanceScreen(
                                attendance.attendanceDetails,
                                attendance,widget.summary.section,widget.summary.grade,isSelected
                              );
                            },
                          ),

                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class PiechartWidget extends StatelessWidget {
  final Color color;
  final String title;
  final String number;

  const PiechartWidget({
    super.key,
    required this.color,
    required this.title,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
      height: 40,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$title'.tr,
            style: interRegular.copyWith(
              fontSize: 14,
              color: Theme.of(context).disabledColor,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            '$number'.tr,
            style: interRegular.copyWith(
              fontSize: 14,
              color: Theme.of(context).disabledColor,
            ),
          ),
        ],
      ),
    );
  }
}