import 'package:erp_school/view/screens/exam/mcq_screen.dart';
import 'package:erp_school/view/screens/exam/upload_result.dart';
import 'package:erp_school/view/screens/gallery/gallery_screen.dart';
import 'package:erp_school/view/screens/homework/homework.dart';
import 'package:erp_school/view/screens/homework/time_table_screen.dart';
import 'package:erp_school/view/screens/student/event_calender_screen.dart';
import 'package:erp_school/view/screens/student/student_screen.dart';
import 'package:erp_school/view/screens/teacher/attendance_screens.dart';
import 'package:erp_school/view/screens/teacher/teacher_availability_screen.dart';
import 'package:flutter/material.dart';
import 'package:erp_school/view/screens/notification/notification_screen.dart';
import 'package:erp_school/view/screens/sidebar/side_bar.dart';
import 'package:get/get.dart';
import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/images.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/screens/dashboard/widget/student_widget.dart';

import '../teacher/view_dairy_screen.dart';

class ParentsScreen extends StatefulWidget {
  const ParentsScreen({super.key});

  @override
  State<ParentsScreen> createState() => _ParentsScreenState();
}

class _ParentsScreenState extends State<ParentsScreen> {
  final List<Map<String, dynamic>> items = [
    {
      'icon': Images.attendance,
      'label': 'Attendance',
      'route': AttendanceScreens()
    },
    {
      'icon': Images.classlibrary,
      'label': 'Class Diary',
      // 'route': ClassDairyScreen()
      'route': ViewDairyScreen()
    },
    {
      'icon': Images.homeworkP,
      'label': 'Homework',
      'route': HomeWorkScreen(
        teacherHomework: true,
      )
    },
    {
      'icon': Images.sudentTeacher,
      'label': 'Students',
      'route': StudentScreen()
    },
    {
      'icon': Images.mcqPng,
      'label': 'MCQ’s',
      'route': const McqScreen(
        student: true,
      )
      // 'route':  const McqScreen()
    },
    {
      'icon': Images.examResultsPng,
      'label': 'Exam & results',
      'route': const UploadResultScreen()
    },
  ];
  final List<Map<String, dynamic>> itemsteacher = [
    {
      'icon': Images.teacherProfile,
      'label': 'Teacher’s Profile',
    },
    {
      'icon': Images.StudentsProfile,
      'label': 'Student Profile',
    },
    {
      'icon': Images.manageClass,
      'label': 'Manage Class',
      'route': const TimeTableScreen(
        isclass: true,
        isaddtable: true,
      )
      // 'route': const AddTimeTableScreen(
      // )
    },
    {
      'icon': Images.myAttendance,
      'label': 'Attendance',
    },
    {
      'icon': Images.assignements,
      'label': 'Assignments',
    },
    {
      'icon': Images.announcement,
      'label': 'Announcement',
      'route': const NotificationScreen(
          notification: true,
          userType: 'parent'
      )
    },
    {
      'icon': Images.eventsCalenderPng,
      'label': 'Event Calendar',
      'route': const EventsCalendarScreen(
        eventCalender: true,
      )
    },
    {
      'icon': Images.galleryParentImage,
      'label': 'Gallery',
      'route': const GalleryScreen(
        teacherHomework: true,
      )
    },
    {
      'icon': Images.Leaves,
      'label': 'Leaves Request',
    },
    {
      'icon': Images.hrImage,
      'label': 'HR',
    },
    {
      'icon': Images.reportAnalytics,
      'label': 'Report',
    },
    {
      'icon': Images.feesManagement,
      'label': 'Fee Management',
    },
  ];

  List<Map<String, dynamic>> visibleItems = [];
  List<Map<String, dynamic>> teacherItems = [];

  @override
  void initState() {
    super.initState();
    visibleItems = items.sublist(0, 6);
    teacherItems = itemsteacher.sublist(0, 12);
  }

  final GlobalKey<ScaffoldState> key = GlobalKey();
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      key: key,
      drawer: const SidebarMenu(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
              child: AppBar(
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
                elevation: 0,
                toolbarHeight: 90,
                leading: IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.blue,
                    size: 40,
                  ),
                  onPressed: () {
                    key.currentState?.openDrawer();
                  },
                ),
                title: Row(
                  children: [
                    Row(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            Images.profilePng,
                            height: 70,
                            width: 70,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sri Kamdev',
                              style: interMedium.copyWith(
                                fontSize: 16,
                                color: Theme.of(context).disabledColor,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Admin',
                              style: interMedium.copyWith(
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
                actions: [
                  GestureDetector(
                      onTap: () {
                        Get.to(const NotificationScreen(
                            notification: true,
                            userType: 'teacher'
                        ));
                      },
                      child: Image.asset(
                        Images.notificationPng,
                        height: 30,
                        width: 30,
                      )),
                  SizedBox(
                    width: 20,
                  )
                ],
                centerTitle: false,
              ),
            ),
            25.h,
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(TeachersAvailabilityScreen());
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Get.theme.colorScheme.onSurface,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'teacher_availability'.tr,
                            style: interMedium.copyWith(
                              fontSize: 14,
                              color: Theme.of(context).disabledColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                Images.teacherAvailable,
                                height: 24,
                                width: 24,
                              ),
                              10.w,
                              Text(
                                '42 / 45',
                                style: interRegular.copyWith(
                                  color: Theme.of(context).disabledColor,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Get.theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'student_availability'.tr,
                          style: interMedium.copyWith(
                            fontSize: 14,
                            color: Theme.of(context).disabledColor,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Image.asset(
                              Images.studentAvailable,
                              height: 24,
                              width: 24,
                            ),
                            10.w,
                            Text(
                              '42 / 45',
                              style: interRegular.copyWith(
                                color: Theme.of(context).disabledColor,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            25.h,
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Leave Request Received',
                    style: interMedium.copyWith(
                      fontSize: 15,
                      color: Theme.of(context).disabledColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Mr. John Smith has submitted a leave request for November 25, 2024. Reason: Personal Leave.',
                    style: interMedium.copyWith(
                      color: Theme.of(context).hintColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'academics'.tr,
                style: interMedium.copyWith(
                  fontSize: 16,
                  color: Theme.of(context).disabledColor,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 280,
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: visibleItems.length,
                    itemBuilder: (context, index) {
                      return StudentWidget(
                        icon: visibleItems[index]['icon']!,
                        label: visibleItems[index]['label']!,
                        onpressed: () {
                          Get.to(visibleItems[index]['route']);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              width: Get.width,
              height: 700,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSecondary,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'administrative'.tr,
                        style: interMedium.copyWith(
                          fontSize: 16,
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 600,
                      child: GridView.builder(
                        padding: const EdgeInsets.all(12),
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemCount: teacherItems.length,
                        itemBuilder: (context, index) {
                          return StudentWidget(
                            icon: teacherItems[index]['icon']!,
                            label: teacherItems[index]['label']!,
                            onpressed: () {
                              Get.to(teacherItems[index]['route']);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
