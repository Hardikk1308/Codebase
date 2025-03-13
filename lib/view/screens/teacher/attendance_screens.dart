import 'package:erp_school/data/models/response/attendance_summary.dart';
import 'package:erp_school/services/teacher_attendance_service.dart';
import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/images.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:erp_school/view/screens/teacher/view_attendance_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AttendanceScreens extends StatefulWidget {
  const AttendanceScreens({Key? key}) : super(key: key);

  @override
  State<AttendanceScreens> createState() => _AttendanceScreensState();
}

class _AttendanceScreensState extends State<AttendanceScreens> {
  late Future<TeacherAttendance> _attendanceFuture;
  final TeacherAttendanceService _teacherAttendanceService = TeacherAttendanceService();

  @override
  void initState() {
    super.initState();
    _attendanceFuture = _teacherAttendanceService.getTeacherAttendanceGradeSummary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: CustomAppBar(
        title: 'Attendance'.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'manage_class_attendance'.tr,
                  style: interMedium.copyWith(
                      fontSize: 16, color: Theme.of(context).disabledColor),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: Theme.of(context).primaryColor,
                      size: 14,
                    ),
                    5.w,
                    Text(
                      DateFormat('dd MMM yyyy').format(DateTime.now()),
                      style: interMedium.copyWith(
                          fontSize: 12, color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'start_class'.tr,
              style: interRegular.copyWith(
                  fontSize: 14, color: Theme.of(context).hintColor),
            ),
            const SizedBox(height: 16),
            // Use FutureBuilder to fetch and display the attendance data
            FutureBuilder<TeacherAttendance>(
              future: _attendanceFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Error fetching attendance data',
                          style: interMedium.copyWith(
                              fontSize: 16, color: Colors.redAccent),
                        ),
                        const SizedBox(height: 8),
                        // ElevatedButton(
                        //   onPressed: _fetchAttendanceData,
                        //   child: Text('Retry', style: interMedium.copyWith(fontSize: 14)),
                        // ),
                      ],
                    ),
                  );
                } else if (snapshot.hasData) {
                  final teacherAttendance = snapshot.data!;
                  final attendanceSummary = teacherAttendance.attendanceSummary;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: attendanceSummary.length,
                      itemBuilder: (context, index) {
                          final summary = attendanceSummary[index];
                        return Card(
                          color: Theme.of(context).cardColor,
                          elevation: 4,
                          margin:
                          const EdgeInsets.only(bottom: 12, right: 5, left: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${summary.grade}, Section ${summary.section}',
                                      style: interMedium.copyWith(
                                          fontSize: 16,
                                          color: Theme.of(context).disabledColor),
                                    ),
                                    Text(
                                      'Lecture ${index + 1}',
                                      style: interRegular.copyWith(
                                          fontSize: 14,
                                          color: Theme.of(context).disabledColor),
                                    ),
                                  ],
                                ),
                                10.h,
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          Images.studentAttendance,
                                          height: 22,
                                          width: 22,
                                        ),
                                        10.w,
                                        Text(
                                          'Students: ${summary.totalStudents}',
                                          style: interRegular.copyWith(
                                              fontSize: 14,
                                              color: Theme.of(context).hintColor),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to( ViewAttendanceScreen( summary: summary,));
                                      },
                                      child: Text(
                                        'view_attendance'.tr,
                                        style: interMedium.copyWith(
                                            fontSize: 12,
                                            color: Theme.of(context).primaryColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      'No attendance data available',
                      style: interMedium.copyWith(
                          fontSize: 16, color: Theme.of(context).hintColor),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}