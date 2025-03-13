// import 'dart:convert';
//
// import 'package:erp_school/constants/app_constants.dart';
// import 'package:erp_school/data/models/response/login_response.dart';
// import 'package:erp_school/services/login_service.dart';
// import 'package:erp_school/utils/shared_preference_util.dart';
// import 'package:erp_school/view/base/custom_dropdown.dart';
// import 'package:erp_school/view/screens/attendance/attendance_screen.dart';
// import 'package:erp_school/view/screens/exam/upload_result.dart';
// import 'package:erp_school/view/screens/gallery/event_details.dart';
// import 'package:erp_school/view/screens/gallery/gallery_screen.dart';
// import 'package:erp_school/view/screens/leaves/leaves_screen.dart';
// import 'package:erp_school/view/screens/student/post_class_dairy.dart';
// import 'package:erp_school/view/screens/student/event_calender_screen.dart';
// import 'package:erp_school/view/screens/student/student_screen.dart';
// import 'package:erp_school/view/screens/teacher/attendance_screens.dart';
// import 'package:erp_school/view/screens/teacher/view_dairy_screen.dart';
// import 'package:erp_school/view/screens/teacher/widget/go_offline_dilaog.dart';
// import 'package:flutter/material.dart';
// import 'package:erp_school/view/screens/homework/homework.dart';
// import 'package:erp_school/view/screens/homework/time_table_screen.dart';
// import 'package:erp_school/view/screens/notification/notification_screen.dart';
// import 'package:erp_school/view/screens/sidebar/side_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:erp_school/utils/dimensions.dart';
// import 'package:erp_school/utils/images.dart';
// import 'package:erp_school/utils/styles.dart';
// import 'package:erp_school/view/screens/dashboard/widget/student_widget.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../../testin_file.dart';
// import '../exam/mcq_screen.dart';
// import '../student/event_calender_screen_copy.dart';
//
// class TeacherScreen extends StatefulWidget {
//   const TeacherScreen({super.key});
//
//   @override
//   State<TeacherScreen> createState() => _TeacherScreenState();
// }
//
// class _TeacherScreenState extends State<TeacherScreen> {
//   User? _user;
//   User get user =>_user!;
//
//   final LoginService _loginService = LoginService();
//
//   final List<Map<String, dynamic>> items = [
//     {
//       'icon': Images.attendance,
//       'label': 'Attendance',
//       'route': AttendanceScreens()
//     },
//     {
//       'icon': Images.classlibrary,
//       'label': 'Class Diary',
//       'route': ViewDairyScreen()
//       // 'route': ClassDairyScreen()
//     },
//     {
//       'icon': Images.homeworkP,
//       'label': 'Homework',
//       'route': HomeWorkScreen(
//         teacherHomework: true,
//       )
//     },
//     {
//       'icon': Images.sudentTeacher,
//       'label': 'Students',
//       'route': StudentScreen()
//     },
//     {
//       'icon': Images.mcqPng,
//       'label': 'MCQ’s',
//       'route': const McqScreen(
//         student: true,
//       )
//     },
//     {
//       'icon': Images.examResultsPng,
//       'label': 'Exam & results',
//       'route': const UploadResultScreen()
//     },
//   ];
//   final List<Map<String, dynamic>> itemsteacher = [
//     {
//       'icon': Images.myAttendance,
//       'label': 'Attendance',
//       'route': const AttendanceScreens()
//     },
//     {
//       'icon': Images.timeTablePng,
//       'label': 'Timetable',
//       'route': const TimeTableScreen(
//         isclass: true,
//       )
//     },
//     {
//       'icon': Images.annoucementTeacher,
//       'label': 'Announcement',
//       'route': const NotificationScreen(notification: true, userType: 'teacher')
//     },
//     {
//       'icon': Images.pollsPng,
//       'label': 'Polls',
//     },
//
//     {
//       'icon': Images.eventCalender,
//       'label': 'Event Calender',
//       // 'route': const EventDetailsScreen()
//       //'route': const EventsCalendarScreen()
//       'route': const StudentYearModelNew()
//     },
//     {'icon': Images.Leaves, 'label': 'Leaves', 'route': LeavesScreen()},
//     {
//       'icon': Images.galleryProfile,
//       'label': 'Gallery',
//       'route': const GalleryScreen(
//         teacherHomework: true,
//       )
//     },
//     {
//       'icon': Images.hrImage,
//       'label': 'HR',
//     },
//     {
//       'icon': Images.payslipPng,
//       'label': 'Payslip',
//     },
//   ];
//
//   List<Map<String, dynamic>> visibleItems = [];
//   List<Map<String, dynamic>> teacherItems = [];
//
//   Future<void> _initializeLogin() async {
//     // Fetch username from SharedPreferences
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? savedUsername = prefs.getString('username');
//
//     // Check if username exists in SharedPreferences
//     if (savedUsername != null && savedUsername.isNotEmpty) {
//       final prefs = await SharedPreferenceUtil.getInstance();
//       setState(() {
//         _user = LoginResponse.fromJson(jsonDecode(prefs.getString('user') ?? '{}')).user;
//       });
//       print("The login response - student: ${_user}");
//     } else {
//       print("No username found in SharedPreferences.");
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     visibleItems = items.sublist(0, 6);
//     teacherItems = itemsteacher.sublist(0,9);
//     // Fetch username from SharedPreferences
//     _initializeLogin();
//   }
//
//   final GlobalKey<ScaffoldState> key = GlobalKey();
//   bool isSwitched = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).cardColor,
//       key: key,
//       drawer: const SidebarMenu(),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: const BorderRadius.only(
//                 bottomRight: Radius.circular(50),
//               ),
//               child: AppBar(
//                 backgroundColor: Theme.of(context).colorScheme.onSecondary,
//                 elevation: 0,
//                 toolbarHeight: 90,
//                 leading: IconButton(
//                   icon: const Icon(
//                     Icons.menu,
//                     color: Colors.blue,
//                     size: 40,
//                   ),
//                   onPressed: () {
//                     key.currentState?.openDrawer();
//                   },
//                 ),
//                 title: Row(
//                   children: [
//                     Row(
//                       children: [
//                         ClipOval(
//                           child: Image.asset(
//                             Images.profilePng,
//                             height: 70,
//                             width: 70,
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         if (_user == null)
//                           const CircularProgressIndicator()
//                         else
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 user.username,
//                                 style: interMedium.copyWith(
//                                   fontSize: 16,
//                                   color: Theme.of(context).disabledColor,
//                                   overflow: TextOverflow.ellipsis
//                                 ),
//                                 maxLines: 1,
//                               ),
//                               const SizedBox(
//                                 height: 5,
//                               ),
//                               Text(
//                                 user.email,
//                                 maxLines: 1,
//                                 style: interMedium.copyWith(
//                                   fontSize: 12,
//                                   overflow: TextOverflow.ellipsis,
//                                   color: Theme.of(context).disabledColor,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 2,
//                               ),
//                               Text(
//                                 user.phone,
//                                 style: interMedium.copyWith(
//                                   fontSize: 12,
//                                   overflow: TextOverflow.ellipsis,
//                                   color: Theme.of(context).disabledColor,
//                                 ),
//                               ),
//                             ],
//                           )
//                       ],
//                     ),
//                   ],
//                 ),
//                 actions: [
//                   GestureDetector(
//                       onTap: () {
//                         Get.to(const NotificationScreen(
//                             notification: true, userType: 'teacher'));
//                       },
//                       child: Image.asset(
//                         Images.notificationPng,
//                         height: 30,
//                         width: 30,
//                       )),
//                   SizedBox(
//                     width: 20,
//                   )
//                 ],
//                 centerTitle: false,
//               ),
//             ),
//            // 25.h,
//             Container(
//             //  margin: const EdgeInsets.symmetric(horizontal: 16),
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//               //  color: Get.theme.colorScheme.primary,
//               //  borderRadius: BorderRadius.circular(15),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Image.asset(
//                             Images.leavebalancePng,
//                             height: 25,
//                             width: 25,
//                           ),
//                           8.w,
//                           Text(
//                             'leave_balance'.tr,
//                             style: interRegular.copyWith(
//                               fontSize: 15,
//                               color: Theme.of(context).disabledColor,
//                               fontWeight: FontWeight.w600
//                             ),
//                           ),
//                           Text(
//                             ' : 15'.tr,
//                             style: interRegular.copyWith(
//                               fontSize: 15,
//                               color: Theme.of(context).disabledColor,
//                                 fontWeight: FontWeight.w600
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 30,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Switch(
//                               activeColor: Theme.of(context).splashColor,
//                               value: isSwitched,
//                               onChanged: (value) {
//                                 setState(() {
//                                   isSwitched = value;
//                                   if (!value) {
//                                     // Check if the switch is turned off
//                                     showDialog(
//                                       context: context,
//                                       builder: (context) => GoOfflineDialog(),
//                                     );
//                                   }
//                                 });
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           //  25.h,
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 16),
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Get.theme.colorScheme.onPrimary,
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'General Announcement',
//                     style: interMedium.copyWith(
//                       fontSize: 15,
//                       color: Theme.of(context).disabledColor,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     'We hope this message finds you well. Please be informed that the school will remain closed on Friday in observance of the upcoming public holiday.',
//                     style: interMedium.copyWith(
//                       color: Theme.of(context).hintColor,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 16),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               child: Text(
//                 'academics'.tr,
//                 style: interMedium.copyWith(
//                   fontSize: 16,
//                   color: Theme.of(context).disabledColor,
//                 ),
//               ),
//             ),
//             Column(
//               children: [
//                 SizedBox(
//                   height: 280,
//                   child: GridView.builder(
//                     padding: const EdgeInsets.all(16),
//                     physics: const NeverScrollableScrollPhysics(),
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3,
//                       crossAxisSpacing: 16,
//                       mainAxisSpacing: 16,
//                     ),
//                     itemCount: visibleItems.length,
//                     itemBuilder: (context, index) {
//                       return StudentWidget(
//                         icon: visibleItems[index]['icon']!,
//                         label: visibleItems[index]['label']!,
//                         onpressed: () {
//                           Get.to(visibleItems[index]['route']);
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 8),
//               width: Get.width,
//               height: 500,
//               decoration: BoxDecoration(
//                   color: Theme.of(context).colorScheme.onSecondary,
//                   borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(30),
//                       topLeft: Radius.circular(30))),
//               child: SafeArea(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 12),
//                       child: Text(
//                         'my_information'.tr,
//                         style: interMedium.copyWith(
//                           fontSize: 16,
//                           color: Theme.of(context).disabledColor,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 400,
//                       child: GridView.builder(
//                         padding: const EdgeInsets.all(16),
//                         physics: const NeverScrollableScrollPhysics(),
//                         gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 3,
//                           crossAxisSpacing: 16,
//                           mainAxisSpacing: 16,
//                         ),
//                         itemCount: teacherItems.length,
//                         itemBuilder: (context, index) {
//                           return StudentWidget(
//                             icon: teacherItems[index]['icon']!,
//                             label: teacherItems[index]['label']!,
//                             onpressed: () {
//                               Get.to(teacherItems[index]['route']);
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// import 'dart:convert';
//
// import 'package:erp_school/constants/app_constants.dart';
// import 'package:erp_school/data/models/response/login_response.dart';
// import 'package:erp_school/services/login_service.dart';
// import 'package:erp_school/utils/shared_preference_util.dart';
// import 'package:erp_school/view/base/custom_dropdown.dart';
// import 'package:erp_school/view/screens/attendance/attendance_screen.dart';
// import 'package:erp_school/view/screens/exam/upload_result.dart';
// import 'package:erp_school/view/screens/gallery/event_details.dart';
// import 'package:erp_school/view/screens/gallery/gallery_screen.dart';
// import 'package:erp_school/view/screens/leaves/leaves_screen.dart';
// import 'package:erp_school/view/screens/teacher/post_class_dairy.dart';
// import 'package:erp_school/view/screens/student/event_calender_screen.dart';
// import 'package:erp_school/view/screens/student/student_screen.dart';
// import 'package:erp_school/view/screens/teacher/attendance_screens.dart';
// import 'package:erp_school/view/screens/teacher/view_dairy_screen.dart';
// import 'package:erp_school/view/screens/teacher/widget/go_offline_dilaog.dart';
// import 'package:flutter/material.dart';
// import 'package:erp_school/view/screens/homework/homework.dart';
// import 'package:erp_school/view/screens/homework/time_table_screen.dart';
// import 'package:erp_school/view/screens/notification/notification_screen.dart';
// import 'package:erp_school/view/screens/sidebar/side_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:erp_school/utils/dimensions.dart';
// import 'package:erp_school/utils/images.dart';
// import 'package:erp_school/utils/styles.dart';
// import 'package:erp_school/view/screens/dashboard/widget/student_widget.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../../testin_file.dart';
// import '../exam/mcq_screen.dart';
// import '../student/event_calender_screen_copy.dart';
//
// class TeacherScreen extends StatefulWidget {
//   final LoginResponse? loginResponse;
//   const TeacherScreen({super.key, this.loginResponse});
//
//   @override
//   State<TeacherScreen> createState() => _TeacherScreenState();
// }
//
// class _TeacherScreenState extends State<TeacherScreen> {
//   User? _user;
//   User get user =>_user!;
//
//   final LoginService _loginService = LoginService();
//
//   final List<Map<String, dynamic>> items = [
//     {
//       'icon': Images.attendance,
//       'label': 'Attendance',
//       'route': AttendanceScreens()
//     },
//     {
//       'icon': Images.classlibrary,
//       'label': 'Class Diary',
//       'route': ViewDairyScreen()
//       // 'route': ClassDairyScreen()
//     },
//     {
//       'icon': Images.homeworkP,
//       'label': 'Homework',
//       'route': HomeWorkScreen(
//         teacherHomework: true,
//       )
//     },
//     // {
//     //   'icon': Images.sudentTeacher,
//     //   'label': 'Students',
//     //   'route': StudentScreen()
//     // },
//     // {
//     //   'icon': Images.mcqPng,
//     //   'label': 'MCQ’s',
//     //   'route': const McqScreen(
//     //     student: true,
//     //   )
//     // },
//     // {
//     //   'icon': Images.examResultsPng,
//     //   'label': 'Exam & results',
//     //   'route': const UploadResultScreen()
//     // },
//   ];
//   final List<Map<String, dynamic>> itemsteacher = [
//     {
//       'icon': Images.myAttendance,
//       'label': 'Attendance',
//       'route': const AttendanceScreens()
//     },
//     {
//       'icon': Images.timeTablePng,
//       'label': 'Timetable',
//       'route': const TimeTableScreen(
//         isclass: true,
//       )
//     },
//     // {
//     //   'icon': Images.annoucementTeacher,
//     //   'label': 'Announcement',
//     //   'route': const NotificationScreen(notification: true, userType: 'teacher')
//     // },
//     // {
//     //   'icon': Images.pollsPng,
//     //   'label': 'Polls',
//     // },
//
//     {
//       'icon': Images.eventCalender,
//       'label': 'Event Calender',
//       // 'route': const EventDetailsScreen()
//       //'route': const EventsCalendarScreen()
//       'route': const StudentYearModelNew()
//     },
//    // {'icon': Images.Leaves, 'label': 'Leaves', 'route': LeavesScreen()},
//    //  {
//    //    'icon': Images.galleryProfile,
//    //    'label': 'Gallery',
//    //    'route': const GalleryScreen(
//    //      teacherHomework: true,
//    //    )
//    //  },
//    //  {
//    //    'icon': Images.hrImage,
//    //    'label': 'HR',
//    //  },
//    //  {
//    //    'icon': Images.payslipPng,
//    //    'label': 'Payslip',
//    //  },
//   ];
//
//   List<Map<String, dynamic>> visibleItems = [];
//   List<Map<String, dynamic>> teacherItems = [];
//
//   Future<void> _initializeLogin() async {
//     // Fetch username from SharedPreferences
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? savedUsername = prefs.getString('username');
//
//     // Check if username exists in SharedPreferences
//     if (savedUsername != null && savedUsername.isNotEmpty) {
//       final prefs = await SharedPreferenceUtil.getInstance();
//       setState(() {
//         _user = LoginResponse.fromJson(jsonDecode(prefs.getString('user') ?? '{}')).user;
//       });
//       print("The login response - student: ${_user?.toJson()}");
//     } else {
//       print("No username found in SharedPreferences.");
//     }
//   }
//
//   // LoginResponse loginResponse =  LoginService.fetchLoginResponse(); // Yeh API call se aayega
//
//   @override
//   void initState() {
//     super.initState();
//     visibleItems = items.sublist(0, 3);
//     teacherItems = itemsteacher.sublist(0,3);
//     // Fetch username from SharedPreferences
//    _initializeLogin();
//   }
//
//   final GlobalKey<ScaffoldState> key = GlobalKey();
//   bool isSwitched = true;
//
//   @override
//   Widget build(BuildContext context) {
//     print("Abhi print abhi ${widget.loginResponse}");
//     return Scaffold(
//       backgroundColor: Theme.of(context).cardColor,
//       key: key,
//       drawer: SidebarMenu(loginResponse: widget.loginResponse,),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: const BorderRadius.only(
//                 bottomRight: Radius.circular(50),
//               ),
//               child: AppBar(
//                 backgroundColor: Theme.of(context).colorScheme.onSecondary,
//                 elevation: 0,
//                 toolbarHeight: 90,
//                 leading: IconButton(
//                   icon: const Icon(
//                     Icons.menu,
//                     color: Colors.blue,
//                     size: 40,
//                   ),
//                   onPressed: () {
//                     key.currentState?.openDrawer();
//                   },
//                 ),
//                 title: Row(
//               children: [
//               ClipOval(
//               child: Image.asset(
//                 Images.profilePng,
//                 height: 70,
//                 width: 70,
//               ),
//             ),
//             const SizedBox(width: 10),
//             if (_user == null)
//               const CircularProgressIndicator()
//             else
//               Expanded(  // 👈 Ensure karega ki Column ke andar Text properly space le sake
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,  // 👈 Prevents Column from taking full height
//                   children: [
//                       Text(
//                         widget.loginResponse?.user.firstName ?? "No Name", /*user.username,*/
//                         style: interMedium.copyWith(
//                             fontSize: 16,
//                             color: Theme.of(context).disabledColor,
//                             overflow: TextOverflow.ellipsis
//                         ),
//                         maxLines: 1,
//                       ),
//                     const SizedBox(height: 5),
//                     Text(
//                       widget.loginResponse?.user.email ?? "No Name"/*user.email*/,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,  // 👈 Ensures text is truncated properly
//                       style: interMedium.copyWith(
//                         fontSize: 12,
//                         color: Theme.of(context).disabledColor,
//                       ),
//                     ),
//                     const SizedBox(height: 2),
//                     Text(
//                       widget.loginResponse?.user.phone ?? "No Name"/*user.phone*/,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: interMedium.copyWith(
//                         fontSize: 12,
//                         color: Theme.of(context).disabledColor,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//           ],
//         ),
//
//         actions: [
//                   GestureDetector(
//                       onTap: () {
//                         Get.to(const NotificationScreen(
//                             notification: true, userType: 'teacher'));
//                       },
//                       child: Image.asset(
//                         Images.notificationPng,
//                         height: 30,
//                         width: 30,
//                       )),
//                   SizedBox(
//                     width: 20,
//                   )
//                 ],
//                 centerTitle: false,
//               ),
//             ),
//             // 25.h,
//             Container(
//               //  margin: const EdgeInsets.symmetric(horizontal: 16),
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 //  color: Get.theme.colorScheme.primary,
//                 //  borderRadius: BorderRadius.circular(15),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Image.asset(
//                             Images.leavebalancePng,
//                             height: 25,
//                             width: 25,
//                           ),
//                           8.w,
//                           Text(
//                             'leave_balance'.tr,
//                             style: interRegular.copyWith(
//                                 fontSize: 15,
//                                 color: Theme.of(context).disabledColor,
//                                 fontWeight: FontWeight.w600
//                             ),
//                           ),
//                           Text(
//                             ' : 15'.tr,
//                             style: interRegular.copyWith(
//                                 fontSize: 15,
//                                 color: Theme.of(context).disabledColor,
//                                 fontWeight: FontWeight.w600
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 30,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Switch(
//                               activeColor: Theme.of(context).splashColor,
//                               value: isSwitched,
//                               onChanged: (value) {
//                                 setState(() {
//                                   isSwitched = value;
//                                   if (!value) {
//                                     // Check if the switch is turned off
//                                     /*showDialog(
//                                       context: context,
//                                       builder: (context) => GoOfflineDialog(),
//                                     );*/
//                                   }
//                                 });
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             //  25.h,
//             Card(
//               elevation: 4,
//               margin: const EdgeInsets.symmetric(horizontal: 16),
//               color: Colors.white,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 16, vertical: 10),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.vertical(
//                         top: Radius.circular(10),
//                       ),
//                       color: Theme.of(context).colorScheme.secondary,
//                     ),
//                     child: Text(
//                       'General Announcement',
//                       style: interMedium.copyWith(
//                         fontSize: 15,
//                         color: Colors.blue,
//                         // color: Theme.of(context).disabledColor,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: Text(
//                       'We hope this message finds you well. Please be informed that the school will remain closed on Friday in observance of the upcoming public holiday.',
//                       textAlign: TextAlign.justify,
//                       style: interMedium.copyWith(
//                         color: Theme.of(context).hintColor,
//                         fontSize: 12,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 16),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               child: Text(
//                 'academics'.tr,
//                 style: interMedium.copyWith(
//                   fontSize: 16,
//                   color: Theme.of(context).disabledColor,
//                 ),
//               ),
//             ),
//             Column(
//               children: [
//                 SizedBox(
//                   height: 150,
//                   // height: 280,
//                   child: GridView.builder(
//                     padding: const EdgeInsets.all(16),
//                     physics: const NeverScrollableScrollPhysics(),
//                     gridDelegate:
//                     const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3,
//                       crossAxisSpacing: 16,
//                       mainAxisSpacing: 16,
//                     ),
//                     itemCount: visibleItems.length,
//                     itemBuilder: (context, index) {
//                       return StudentWidget(
//                         icon: visibleItems[index]['icon']!,
//                         label: visibleItems[index]['label']!,
//                         onpressed: () {
//                           Get.to(visibleItems[index]['route']);
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 8),
//               width: Get.width,
//               // height: 280,
//               decoration: BoxDecoration(
//                   color: Theme.of(context).colorScheme.onSecondary,
//                   borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(30),
//                       topLeft: Radius.circular(30))),
//               child: SafeArea(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 12),
//                       child: Text(
//                         'my_information'.tr,
//                         style: interMedium.copyWith(
//                           fontSize: 16,
//                           color: Theme.of(context).disabledColor,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 130,
//                       child: GridView.builder(
//                         padding: const EdgeInsets.all(16),
//                         physics: const NeverScrollableScrollPhysics(),
//                         gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 3,
//                           crossAxisSpacing: 16,
//                           mainAxisSpacing: 16,
//                         ),
//                         itemCount: teacherItems.length,
//                         itemBuilder: (context, index) {
//                           return StudentWidget(
//                             icon: teacherItems[index]['icon']!,
//                             label: teacherItems[index]['label']!,
//                             onpressed: () {
//                               Get.to(teacherItems[index]['route']);
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// import 'dart:convert';
//
// import 'package:erp_school/constants/app_constants.dart';
// import 'package:erp_school/data/models/response/login_response.dart';
// import 'package:erp_school/services/login_service.dart';
// import 'package:erp_school/utils/shared_preference_util.dart';
// import 'package:erp_school/view/base/custom_dropdown.dart';
// import 'package:erp_school/view/screens/attendance/attendance_screen.dart';
// import 'package:erp_school/view/screens/exam/upload_result.dart';
// import 'package:erp_school/view/screens/gallery/event_details.dart';
// import 'package:erp_school/view/screens/gallery/gallery_screen.dart';
// import 'package:erp_school/view/screens/leaves/leaves_screen.dart';
// import 'package:erp_school/view/screens/teacher/post_class_dairy.dart';
// import 'package:erp_school/view/screens/student/event_calender_screen.dart';
// import 'package:erp_school/view/screens/student/student_screen.dart';
// import 'package:erp_school/view/screens/teacher/attendance_screens.dart';
// import 'package:erp_school/view/screens/teacher/view_dairy_screen.dart';
// import 'package:erp_school/view/screens/teacher/widget/go_offline_dilaog.dart';
// import 'package:flutter/material.dart';
// import 'package:erp_school/view/screens/homework/homework.dart';
// import 'package:erp_school/view/screens/homework/time_table_screen.dart';
// import 'package:erp_school/view/screens/notification/notification_screen.dart';
// import 'package:erp_school/view/screens/sidebar/side_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:erp_school/utils/dimensions.dart';
// import 'package:erp_school/utils/images.dart';
// import 'package:erp_school/utils/styles.dart';
// import 'package:erp_school/view/screens/dashboard/widget/student_widget.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../../testin_file.dart';
// import '../exam/mcq_screen.dart';
// import '../student/event_calender_screen_copy.dart';
//
// class TeacherScreen extends StatefulWidget {
//   final LoginResponse? loginResponse;
//   const TeacherScreen({super.key, this.loginResponse});
//
//   @override
//   State<TeacherScreen> createState() => _TeacherScreenState();
// }
//
// class _TeacherScreenState extends State<TeacherScreen> {
//   User? _user;
//   User get user =>_user!;
//
//   final LoginService _loginService = LoginService();
//
//   final List<Map<String, dynamic>> items = [
//     {
//       'icon': Images.attendance,
//       'label': 'Attendance',
//       'route': AttendanceScreens()
//     },
//     {
//       'icon': Images.classlibrary,
//       'label': 'Class Diary',
//       'route': ViewDairyScreen()
//       // 'route': ClassDairyScreen()
//     },
//     {
//       'icon': Images.homeworkP,
//       'label': 'Homework',
//       'route': HomeWorkScreen(
//         teacherHomework: true,
//       )
//     },
//     // {
//     //   'icon': Images.sudentTeacher,
//     //   'label': 'Students',
//     //   'route': StudentScreen()
//     // },
//     // {
//     //   'icon': Images.mcqPng,
//     //   'label': 'MCQ’s',
//     //   'route': const McqScreen(
//     //     student: true,
//     //   )
//     // },
//     // {
//     //   'icon': Images.examResultsPng,
//     //   'label': 'Exam & results',
//     //   'route': const UploadResultScreen()
//     // },
//   ];
//   final List<Map<String, dynamic>> itemsteacher = [
//     {
//       'icon': Images.myAttendance,
//       'label': 'Attendance',
//       'route': const AttendanceScreens()
//     },
//     {
//       'icon': Images.timeTablePng,
//       'label': 'Timetable',
//       'route': const TimeTableScreen(
//         isclass: true,
//       )
//     },
//     // {
//     //   'icon': Images.annoucementTeacher,
//     //   'label': 'Announcement',
//     //   'route': const NotificationScreen(notification: true, userType: 'teacher')
//     // },
//     // {
//     //   'icon': Images.pollsPng,
//     //   'label': 'Polls',
//     // },
//
//     {
//       'icon': Images.eventCalender,
//       'label': 'Event Calender',
//       // 'route': const EventDetailsScreen()
//       //'route': const EventsCalendarScreen()
//       'route': const StudentYearModelNew()
//     },
//     // {'icon': Images.Leaves, 'label': 'Leaves', 'route': LeavesScreen()},
//     //  {
//     //    'icon': Images.galleryProfile,
//     //    'label': 'Gallery',
//     //    'route': const GalleryScreen(
//     //      teacherHomework: true,
//     //    )
//     //  },
//     //  {
//     //    'icon': Images.hrImage,
//     //    'label': 'HR',
//     //  },
//     //  {
//     //    'icon': Images.payslipPng,
//     //    'label': 'Payslip',
//     //  },
//   ];
//
//   List<Map<String, dynamic>> visibleItems = [];
//   List<Map<String, dynamic>> teacherItems = [];
//   //
//   // Future<void> _initializeLogin() async {
//   //   // Fetch username from SharedPreferences
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   String? savedUsername = prefs.getString('username');
//   //
//   //   // Check if username exists in SharedPreferences
//   //   if (savedUsername != null && savedUsername.isNotEmpty) {
//   //     final prefs = await SharedPreferenceUtil.getInstance();
//   //     setState(() {
//   //       _user = LoginResponse.fromJson(jsonDecode(prefs.getString('user') ?? '{}')).user;
//   //     });
//   //     print("The login response - student: ${_user?.toJson()}");
//   //   } else {
//   //     print("No username found in SharedPreferences.");
//   //   }
//   // }
//
//   // LoginResponse loginResponse =  LoginService.fetchLoginResponse(); // Yeh API call se aayega
//
//   @override
//   void initState() {
//     super.initState();
//     visibleItems = items.sublist(0, 3);
//     teacherItems = itemsteacher.sublist(0,3);
//     // Fetch username from SharedPreferences
//     //_initializeLogin();
//   }
//
//   final GlobalKey<ScaffoldState> key = GlobalKey();
//   bool isSwitched = true;
//
//   @override
//   Widget build(BuildContext context) {
//     print("Abhi print abhi ${widget.loginResponse}");
//     return Scaffold(
//       backgroundColor: Theme.of(context).cardColor,
//       key: key,
//       drawer: SidebarMenu(loginResponse: widget.loginResponse,),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: const BorderRadius.only(
//                 bottomRight: Radius.circular(50),
//               ),
//               child: AppBar(
//                 backgroundColor: Theme.of(context).colorScheme.onSecondary,
//                 elevation: 0,
//                 toolbarHeight: 90,
//                 leading: IconButton(
//                   icon: const Icon(
//                     Icons.menu,
//                     color: Colors.blue,
//                     size: 40,
//                   ),
//                   onPressed: () {
//                     key.currentState?.openDrawer();
//                   },
//                 ),
//                 title: Row(
//                   children: [
//                     ClipOval(
//                       child: Image.asset(
//                         Images.profilePng,
//                         height: 70,
//                         width: 70,
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     /*if (_user == null)
//                       const CircularProgressIndicator()
//                     else*/
//                       Expanded(  // 👈 Ensure karega ki Column ke andar Text properly space le sake
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisSize: MainAxisSize.min,  // 👈 Prevents Column from taking full height
//                           children: [
//                             Text(
//                               widget.loginResponse?.user.firstName ?? "No Name", /*user.username,*/
//                               style: interMedium.copyWith(
//                                   fontSize: 16,
//                                   color: Theme.of(context).disabledColor,
//                                   overflow: TextOverflow.ellipsis
//                               ),
//                               maxLines: 1,
//                             ),
//                             const SizedBox(height: 5),
//                             Text(
//                               widget.loginResponse?.user.email ?? "No Name"/*user.email*/,
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,  // 👈 Ensures text is truncated properly
//                               style: interMedium.copyWith(
//                                 fontSize: 12,
//                                 color: Theme.of(context).disabledColor,
//                               ),
//                             ),
//                             const SizedBox(height: 2),
//                             Text(
//                               widget.loginResponse?.user.phone ?? "No Name"/*user.phone*/,
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               style: interMedium.copyWith(
//                                 fontSize: 12,
//                                 color: Theme.of(context).disabledColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                   ],
//                 ),
//
//                 actions: [
//                   GestureDetector(
//                       onTap: () {
//                         Get.to(const NotificationScreen(
//                             notification: true, userType: 'teacher'));
//                       },
//                       child: Image.asset(
//                         Images.notificationPng,
//                         height: 30,
//                         width: 30,
//                       )),
//                   SizedBox(
//                     width: 20,
//                   )
//                 ],
//                 centerTitle: false,
//               ),
//             ),
//             // 25.h,
//             Container(
//               //  margin: const EdgeInsets.symmetric(horizontal: 16),
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 //  color: Get.theme.colorScheme.primary,
//                 //  borderRadius: BorderRadius.circular(15),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Image.asset(
//                             Images.leavebalancePng,
//                             height: 25,
//                             width: 25,
//                           ),
//                           8.w,
//                           Text(
//                             'leave_balance'.tr,
//                             style: interRegular.copyWith(
//                                 fontSize: 15,
//                                 color: Theme.of(context).disabledColor,
//                                 fontWeight: FontWeight.w600
//                             ),
//                           ),
//                           Text(
//                             ' : 15'.tr,
//                             style: interRegular.copyWith(
//                                 fontSize: 15,
//                                 color: Theme.of(context).disabledColor,
//                                 fontWeight: FontWeight.w600
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 30,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Switch(
//                               activeColor: Theme.of(context).splashColor,
//                               value: isSwitched,
//                               onChanged: (value) {
//                                 setState(() {
//                                   isSwitched = value;
//                                   if (!value) {
//                                     // Check if the switch is turned off
//                                     /*showDialog(
//                                       context: context,
//                                       builder: (context) => GoOfflineDialog(),
//                                     );*/
//                                   }
//                                 });
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             //  25.h,
//             Card(
//               elevation: 4,
//               margin: const EdgeInsets.symmetric(horizontal: 16),
//               color: Colors.white,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 16, vertical: 10),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.vertical(
//                         top: Radius.circular(10),
//                       ),
//                       color: Theme.of(context).colorScheme.secondary,
//                     ),
//                     child: Text(
//                       'General Announcement',
//                       style: interMedium.copyWith(
//                         fontSize: 15,
//                         color: Colors.blue,
//                         // color: Theme.of(context).disabledColor,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: Text(
//                       'We hope this message finds you well. Please be informed that the school will remain closed on Friday in observance of the upcoming public holiday.',
//                       textAlign: TextAlign.justify,
//                       style: interMedium.copyWith(
//                         color: Theme.of(context).hintColor,
//                         fontSize: 12,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 16),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               child: Text(
//                 'academics'.tr,
//                 style: interMedium.copyWith(
//                   fontSize: 16,
//                   color: Theme.of(context).disabledColor,
//                 ),
//               ),
//             ),
//             Column(
//               children: [
//                 SizedBox(
//                   height: 150,
//                   // height: 280,
//                   child: GridView.builder(
//                     padding: const EdgeInsets.all(16),
//                     physics: const NeverScrollableScrollPhysics(),
//                     gridDelegate:
//                     const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3,
//                       crossAxisSpacing: 16,
//                       mainAxisSpacing: 16,
//                     ),
//                     itemCount: visibleItems.length,
//                     itemBuilder: (context, index) {
//                       return StudentWidget(
//                         icon: visibleItems[index]['icon']!,
//                         label: visibleItems[index]['label']!,
//                         onpressed: () {
//                           Get.to(visibleItems[index]['route']);
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 8),
//               width: Get.width,
//               // height: 280,
//               decoration: BoxDecoration(
//                   color: Theme.of(context).colorScheme.onSecondary,
//                   borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(30),
//                       topLeft: Radius.circular(30))),
//               child: SafeArea(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 12),
//                       child: Text(
//                         'my_information'.tr,
//                         style: interMedium.copyWith(
//                           fontSize: 16,
//                           color: Theme.of(context).disabledColor,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 130,
//                       child: GridView.builder(
//                         padding: const EdgeInsets.all(16),
//                         physics: const NeverScrollableScrollPhysics(),
//                         gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 3,
//                           crossAxisSpacing: 16,
//                           mainAxisSpacing: 16,
//                         ),
//                         itemCount: teacherItems.length,
//                         itemBuilder: (context, index) {
//                           return StudentWidget(
//                             icon: teacherItems[index]['icon']!,
//                             label: teacherItems[index]['label']!,
//                             onpressed: () {
//                               Get.to(teacherItems[index]['route']);
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:erp_school/constants/app_constants.dart';
import 'package:erp_school/data/models/response/login_response.dart';
import 'package:erp_school/services/login_service.dart';
import 'package:erp_school/utils/shared_preference_util.dart';
import 'package:erp_school/view/screens/teacher/attendance_screens.dart';
import 'package:erp_school/view/screens/teacher/view_dairy_screen.dart';
import 'package:erp_school/view/screens/teacher/widget/go_offline_dilaog.dart';
import 'package:flutter/material.dart';
import 'package:erp_school/view/screens/homework/homework.dart';
import 'package:erp_school/view/screens/homework/time_table_screen.dart';
import 'package:erp_school/view/screens/notification/notification_screen.dart';
import 'package:erp_school/view/screens/sidebar/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/images.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/screens/dashboard/widget/student_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../testin_file.dart';
import '../dashboard/DashboradController.dart';
import '../edit_profile/edit_profile_screen.dart';
import '../exam/mcq_screen.dart';
import '../student/event_calender_screen_copy.dart';

class TeacherScreen extends StatefulWidget {
  // final LoginResponse? loginResponse;
  const TeacherScreen({super.key, /*this.loginResponse*/});

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> with WidgetsBindingObserver{
  // final UserController userController = Get.put(UserController());
  User? _user;
  User get user =>_user!;

  final LoginService _loginService = LoginService();

  final List<Map<String, dynamic>> items = [
    {
      'icon': Images.attendance,
      'label': 'Attendance',
      'route': AttendanceScreens()
    },
    {
      'icon': Images.teacherClasslibrary,
      'label': 'Class Diary',
      'route': ViewDairyScreen()
      // 'route': ClassDairyScreen()
    },
    {
      'icon': Images.homeworkP,
      'label': 'Homework',
      'route': HomeWorkScreen(
        teacherHomework: true,
      )
    },
    // {
    //   'icon': Images.sudentTeacher,
    //   'label': 'Students',
    //   'route': StudentScreen()
    // },
    // {
    //   'icon': Images.mcqPng,
    //   'label': 'MCQ’s',
    //   'route': const McqScreen(
    //     student: true,
    //   )
    // },
    // {
    //   'icon': Images.examResultsPng,
    //   'label': 'Exam & results',
    //   'route': const UploadResultScreen()
    // },
  ];
  final List<Map<String, dynamic>> itemsteacher = [
    {
      'icon': Images.myAttendance,
      'label': 'Attendance',
      'route': const AttendanceScreens()
    },
    {
      'icon': Images.timeTablePng,
      'label': 'Timetable',
      'route': const TimeTableScreen(
        isclass: true,
      )
    },
    // {
    //   'icon': Images.annoucementTeacher,
    //   'label': 'Announcement',
    //   'route': const NotificationScreen(notification: true, userType: 'teacher')
    // },
    // {
    //   'icon': Images.pollsPng,
    //   'label': 'Polls',
    // },

    {
      'icon': Images.eventCalender,
      'label': 'Event Calender',
      // 'route': const EventDetailsScreen()
      //'route': const EventsCalendarScreen()
      'route': const StudentYearModelNew()
    },
    // {'icon': Images.Leaves, 'label': 'Leaves', 'route': LeavesScreen()},
    //  {
    //    'icon': Images.galleryProfile,
    //    'label': 'Gallery',
    //    'route': const GalleryScreen(
    //      teacherHomework: true,
    //    )
    //  },
    //  {
    //    'icon': Images.hrImage,
    //    'label': 'HR',
    //  },
    //  {
    //    'icon': Images.payslipPng,
    //    'label': 'Payslip',
    //  },
  ];

  List<Map<String, dynamic>> visibleItems = [];
  List<Map<String, dynamic>> teacherItems = [];

  Future<void> _initializeLogin() async {
    // Fetch username from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUsername = prefs.getString('username');

    // Check if username exists in SharedPreferences
    if (savedUsername != null && savedUsername.isNotEmpty) {
      final prefs = await SharedPreferenceUtil.getInstance();
      setState(() {
        _user = LoginResponse.fromJson(jsonDecode(prefs.getString('user') ?? '{}')).user;
      });
      print("The login response - student: ${_user?.toJson()}");
    } else {
      print("No username found in SharedPreferences.");
    }
  }

  // LoginResponse loginResponse =  LoginService.fetchLoginResponse(); // Yeh API call se aayega

  final sharedPrefController = Get.find<SharedPrefController>();
  // @override
  // void initState() {
  //   super.initState();
  //   visibleItems = items.sublist(0, 8); // Initially show 8 items
  //   _loadUserData();
  //   _initializeLogin();
  //   WidgetsBinding.instance.addObserver(this); // Observe lifecycle changes
  //
  // }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    visibleItems = items.sublist(0, 3);
    teacherItems = itemsteacher.sublist(0,3);
    // Fetch username from SharedPreferences
    // userController.loadUserData();
    WidgetsBinding.instance.addObserver(this);
    Get.put(SharedPrefController()).loadUserData();
    _initializeLogin();
  }

  final GlobalKey<ScaffoldState> key = GlobalKey();
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    // print("Abhi print abhi ${widget.loginResponse}");
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      key: key,
      drawer: SidebarMenu(/*loginResponse:*//* widget.loginResponse,*/),
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
                    ClipOval(
                      child: Image.asset(
                        Images.profilePng,
                        height: 70,
                        width: 70,
                      ),
                    ),
                    const SizedBox(width: 10),
                    if (_user == null)
                      const CircularProgressIndicator()
                    else
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,  // Prevents Column from taking full height
                          children: [
                            Obx(() =>   Text(
                                 /* "${user.firstName ?? "Loading.."} ${user.lastName}"*/ "${sharedPrefController.userData['user']['firstName'] ?? ''} ${sharedPrefController.userData['user']['lastName'] ?? ''} ",
                              style: interMedium.copyWith(
                                  fontSize: 16,
                                  color: Theme.of(context).disabledColor,
                                  overflow: TextOverflow.ellipsis
                              ),
                              maxLines: 1,
                            ),),
                            //Obx(() => Text("${userController.firstName.value}")),
                            const SizedBox(height: 5),
                             Obx(() =>   Text(
                              /*widget.loginResponse?.user.email ?? "No Name"*/ /*user.email*/ "${sharedPrefController.userData['user']['email'] ?? ''} ",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: interMedium.copyWith(
                                fontSize: 12,
                                color: Theme.of(context).disabledColor,
                              ),
                            )),
                            const SizedBox(height: 2),
                            Text(
                              /*widget.loginResponse?.user.phone ?? "No Name"*/
                              user.userId,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: interMedium.copyWith(
                                fontSize: 12,
                                color: Theme.of(context).disabledColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),

                actions: [
                  GestureDetector(
                      onTap: () {
                        Get.to(const NotificationScreen(
                            notification: true, userType: 'teacher'));
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
            // 25.h,
            Container(
              //  margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                //  color: Get.theme.colorScheme.primary,
                //  borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            Images.leavebalancePng,
                            height: 25,
                            width: 25,
                          ),
                          8.w,
                          Text(
                            'leave_balance'.tr,
                            style: interRegular.copyWith(
                                fontSize: 15,
                                color: Theme.of(context).disabledColor,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          Text(
                            ' : 15'.tr,
                            style: interRegular.copyWith(
                                fontSize: 15,
                                color: Theme.of(context).disabledColor,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Switch(
                              activeColor: Theme.of(context).splashColor,
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                  if (!value) {
                                    // Check if the switch is turned off
                                    /*showDialog(
                                      context: context,
                                      builder: (context) => GoOfflineDialog(),
                                    );*/
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //  25.h,
            Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: Text(
                      'General Announcement',
                      style: interMedium.copyWith(
                        fontSize: 15,
                        color: Colors.blue,
                        // color: Theme.of(context).disabledColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'We hope this message finds you well. Please be informed that the school will remain closed on Friday in observance of the upcoming public holiday.',
                      textAlign: TextAlign.justify,
                      style: interMedium.copyWith(
                        color: Theme.of(context).hintColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                  height: 150,
                  // height: 280,
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
                      return Card(
                        color: Colors.white,
                        elevation: 4,
                        clipBehavior: Clip.hardEdge,
                        child: StudentWidget(
                          icon: visibleItems[index]['icon']!,
                          label: visibleItems[index]['label']!,
                          onpressed: () {
                            Get.to(visibleItems[index]['route']);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              width: Get.width,
              // height: 280,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSecondary,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'my_information'.tr,
                        style: interMedium.copyWith(
                          fontSize: 16,
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 130,
                      child: GridView.builder(
                        padding: const EdgeInsets.all(16),
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
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