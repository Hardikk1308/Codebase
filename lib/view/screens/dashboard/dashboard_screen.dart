//
// import 'dart:convert';
// import 'package:erp_school/data/models/response/login_response.dart';
// import 'package:erp_school/services/login_service.dart';
// import 'package:erp_school/view/screens/attendance/attendance_screen.dart';
// import 'package:erp_school/view/screens/dashboard/widget/student_widget.dart';
// import 'package:erp_school/view/screens/exam/mcq_screen.dart';
// import 'package:erp_school/view/screens/gallery/gallery_screen.dart';
// // import 'package:erp_school/view/screens/homework/homework.dart';
// import 'package:erp_school/view/screens/homework/time_table_screen.dart';
// import 'package:erp_school/view/screens/notification/notification_screen.dart';
// import 'package:erp_school/view/screens/sidebar/side_bar.dart';
// import 'package:erp_school/view/screens/student/event_calender_screen.dart';
// import 'package:erp_school/view/screens/student/event_calender_screen_copy.dart';
// import 'package:erp_school/view/screens/student/fees_details_screen.dart';
// import 'package:erp_school/view/screens/student/student_performance_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:erp_school/utils/dimensions.dart';
// import 'package:erp_school/utils/images.dart';
// import 'package:erp_school/utils/styles.dart';
// // import 'package:erp_school/view/screens/dashboard/widget/student_widget.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../homework/homework.dart';
// import '../homework/widget/homework_widget.dart';
// import '../student/student_classDairy_screen.dart';
// import '../teacher/view_dairy_screen.dart';
//
// // import '../../../data/models/response/homework_summary.dart';
//
// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key});
//
//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen> {
//   Future<LoginResponse?>? _loginResponse; // Use nullable Future
//   final LoginService _loginService = LoginService();
//   String? moduleSelected = "";
//
//   final List<Map<String, dynamic>> items = [
//     {
//       'icon': Images.homeworkPng,
//       'label': 'Homework',
//       'route': HomeWorkScreen()
//     },
//     {
//       'icon': Images.attendancePng,
//       'label': 'Attendance',
//       'route': AttendanceScreen()
//     },
//
//     {
//       'icon': Images.classlibrary,
//       'label': 'Class Diary',
//       'route': StudentClassdairyScreen()
//       // 'route': ClassDairyScreen()
//     },
//     {
//       'icon': Images.timetablePng,
//       'label': 'Timetable',
//       'route': const TimeTableScreen()
//     },
//     {
//       'icon': Images.academicsPng,
//       'label': 'Performance',
//       'route': StudentPerformanceScreen()
//     },
//     // {
//     //   'icon': Images.connectPng,
//     //   'label': 'Connect',
//     // },
//     {
//       'icon': Images.galleryPng,
//       'label': 'Gallery',
//       'route': const GalleryScreen()
//     },
//     {
//       'icon': Images.eventcalendarPng,
//       'label': 'Calendar',
//       'route': StudentYearModelNew()
//     },
//
//     {'icon': Images.feesPng, 'label': 'Fees', 'route': FeeDetailsScreen()}
//
//
//   ];
//   User? _user;
//
//   // User get user => _user!;
//   List<Map<String, dynamic>> visibleItems = [];
//
//   Future<void> _loadUserData () async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? userJson = prefs.getString('user');
//   if(userJson !=null ){
//     setState(() {
//       _user = LoginResponse.fromJson(jsonDecode(userJson)).user;
//     });
//   }
//   }
//
//   Future<void> _initializeLogin() async {
//     // Fetch username from SharedPreferences
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? savedUsername = prefs.getString('username');
//     moduleSelected = prefs.getString('type')?.toLowerCase();
//     items.first["route"] =
//     moduleSelected == 'student' ? StudentHomeworkClass() : HomeWorkScreen();
//     // Find the Class Diary item and update its route
//     for (var item in items) {
//       if (item['label'] == 'Class Diary') {
//         item['route'] = moduleSelected == 'student'
//             ? StudentClassdairyScreen()
//             : ViewDairyScreen();
//         break; // Exit loop after updating
//       }
//     }
//     // Check if username exists in SharedPreferences
//     if (savedUsername != null && savedUsername.isNotEmpty) {
//       // Fetch login response with saved username
//       setState(() {
//         // _loginResponse = _loginService.fetchLoginResponse(
//         //   type: STUDENT,
//         //   username: savedUsername,
//         //   context: context,
//         // );
//         _user =
//             LoginResponse.fromJson(jsonDecode(prefs.getString('user') ?? '{}'))
//                 .user;
//       });
//       _user =
//           LoginResponse.fromJson(jsonDecode(prefs.getString('user') ?? '{}'))
//               .user;
//       print("The login response - student: ${_user?.toJson()}");
//     } else {
//       print("No username found in SharedPreferences.");
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     visibleItems = items.sublist(0, 8);
//     // _loginResponse = _loginService.fetchLoginResponse(type: STUDENT,username: "LALALALAS1");
//     _loadUserData();
//  //   WidgetsBinding.instance.addObserver(this);
//     _initializeLogin();
//     // print("The login respoinse - studnet  ${_loginResponse}");
//   }
//   // @override
//   // void dispose() {
//   //   WidgetsBinding.instance.removeObserver(this); // Observer remove karo
//   //   super.dispose();
//   // }
//   void loadMoreItems() {
//     setState(() {
//       int remaining = items.length - visibleItems.length;
//       int itemsToAdd = remaining > 4 ? 4 : remaining;
//       visibleItems = items.sublist(0, visibleItems.length + itemsToAdd);
//     });
//   }
//
//   final GlobalKey<ScaffoldState> key = GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).cardColor,
//       key: key,
//       drawer: const SidebarMenu(/*loginResponse: _loginService,*/),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ClipRRect(
//               borderRadius: const BorderRadius.only(
//                 bottomRight: Radius.circular(50),
//               ),
//               child: AppBar(
//                 backgroundColor: Theme.of(context).colorScheme.onSecondary,
//                 leadingWidth: 45,
//                 toolbarHeight: 90,
//                 centerTitle: false,
//                 leading: Container(
//                   child: IconButton(
//                     icon: const Icon(
//                       Icons.menu,
//                       color: Colors.blue,
//                       size: 35,
//                     ),
//                     onPressed: () {
//                       key.currentState?.openDrawer();
//                     },
//                   ),
//                 ),
//                 title: Container(
//                   child: Row(mainAxisSize: MainAxisSize.min, children: [
//                     ClipOval(
//                       child: Image.asset(
//                         Images.profilePng,
//                         height: 70,
//                         width: 70,
//                       ),
//                     ),
//                     const SizedBox(width: 5),
//                     if (_user == null)
//                       CircularProgressIndicator(
//                         color: Colors.blue,
//                       )
//                     else
//                       Expanded(
//                         child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 user.username,
//                                 style: interMedium.copyWith(
//                                   fontSize: 16,
//                                   color: Theme.of(context).disabledColor,
//                                 ),
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                               const SizedBox(
//                                 height: 5,
//                               ),
//                               Text(
//                                 moduleSelected == 'teacher'
//                                     ? '${user.moreDetails.email}'
//                                     : ' Grade: ${user.moreDetails.grade}, Section: ${user.moreDetails.section}',
//                                 style: interMedium.copyWith(
//                                     fontSize: 12,
//                                     color: Theme.of(context).disabledColor,
//                                     overflow: TextOverflow.ellipsis),
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                               const SizedBox(
//                                 height: 2,
//                               ),
//                             ]),
//                       )
//                   ]),
//                 ),
//                 actions: [
//                   GestureDetector(
//                       onTap: () {
//                         Get.to(const NotificationScreen(
//                             notification: true, userType: 'student'));
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
//               ),
//             ),
//             25.h,
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
//                       'We hopesssss this message finds you well. Please be informed that the school will remain closed on Friday in observance of the upcoming public holiday.',
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
//             Column(
//               children: [
//                 SizedBox(
//                   height: 400,
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
//                       return Card(
//                         color: Colors.white,
//                         elevation: 4,
//                         clipBehavior: Clip.hardEdge,
//                         child: StudentWidget(
//                           icon: visibleItems[index]['icon']!,
//                           // icon: SvgPicture.asset(
//                           //   'assets/images/Homework.svg', // Path to your SVG file
//                           //   width: 150,
//                           //   height: 150,
//                           //   color: Colors.blue, // Optional: Change SVG color
//                           // ),
//                           label: visibleItems[index]['label']!,
//                           onpressed: () {
//                             print(visibleItems[index]['route']);
//                             Get.to(visibleItems[index]['route']);
//                           },
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:convert';
// import 'package:erp_school/data/models/response/login_response.dart';
// import 'package:erp_school/services/login_service.dart';
// import 'package:erp_school/view/screens/attendance/attendance_screen.dart';
// import 'package:erp_school/view/screens/dashboard/widget/student_widget.dart';
// import 'package:erp_school/view/screens/exam/mcq_screen.dart';
// import 'package:erp_school/view/screens/gallery/gallery_screen.dart';
// // import 'package:erp_school/view/screens/homework/homework.dart';
// import 'package:erp_school/view/screens/homework/time_table_screen.dart';
// import 'package:erp_school/view/screens/notification/notification_screen.dart';
// import 'package:erp_school/view/screens/sidebar/side_bar.dart';
// import 'package:erp_school/view/screens/student/event_calender_screen.dart';
// import 'package:erp_school/view/screens/student/event_calender_screen_copy.dart';
// import 'package:erp_school/view/screens/student/fees_details_screen.dart';
// import 'package:erp_school/view/screens/student/student_performance_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:erp_school/utils/dimensions.dart';
// import 'package:erp_school/utils/images.dart';
// import 'package:erp_school/utils/styles.dart';
// // import 'package:erp_school/view/screens/dashboard/widget/student_widget.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../homework/homework.dart';
// import '../homework/widget/homework_widget.dart';
// import '../student/student_classDairy_screen.dart';
// import '../teacher/view_dairy_screen.dart';
//
// // import '../../../data/models/response/homework_summary.dart';
//
// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key});
//
//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }
//
//
// class _DashboardScreenState extends State<DashboardScreen> with WidgetsBindingObserver {
//   Future<LoginResponse?>? _loginResponse; // Use nullable Future
//   final LoginService _loginService = LoginService();
//   String? moduleSelected = "";
//
//   final List<Map<String, dynamic>> items = [
//     {
//       'icon': Images.homeworkPng,
//       'label': 'Homework',
//       'route': HomeWorkScreen()
//     },
//     {
//       'icon': Images.attendancePng,
//       'label': 'Attendance',
//       'route': AttendanceScreen()
//     },
//
//     {
//       'icon': Images.classlibrary,
//       'label': 'Class Diary',
//       'route': StudentClassdairyScreen()
//       // 'route': ClassDairyScreen()
//     },
//     {
//       'icon': Images.timetablePng,
//       'label': 'Timetable',
//       'route': const TimeTableScreen()
//     },
//     {
//       'icon': Images.academicsPng,
//       'label': 'Performance',
//       'route': StudentPerformanceScreen()
//     },
//     // {
//     //   'icon': Images.connectPng,
//     //   'label': 'Connect',
//     // },
//     {
//       'icon': Images.galleryPng,
//       'label': 'Gallery',
//       'route': const GalleryScreen()
//     },
//     {
//       'icon': Images.eventcalendarPng,
//       'label': 'Calendar',
//       'route': StudentYearModelNew()
//     },
//
//     {'icon': Images.feesPng, 'label': 'Fees', 'route': FeeDetailsScreen()}
//
//
//   ];
//   User? _user;
//   // User get user => _user!;
//   List<Map<String, dynamic>> visibleItems = [];
//
//   // Future<void> _loadUserData () async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   String? userJson = prefs.getString('user');
//   //   if(userJson !=null ){
//   //     setState(() {
//   //       _user = LoginResponse.fromJson(jsonDecode(userJson)).user;
//   //     });
//   //   }
//   // }
//
//   Future<void> _initializeLogin() async {
//     // Fetch username from SharedPreferences
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? savedUsername = prefs.getString('username');
//     moduleSelected = prefs.getString('type')?.toLowerCase();
//     items.first["route"] =
//     moduleSelected == 'student' ? StudentHomeworkClass() : HomeWorkScreen();
//     // Find the Class Diary item and update its route
//     for (var item in items) {
//       if (item['label'] == 'Class Diary') {
//         item['route'] = moduleSelected == 'student'
//             ? StudentClassdairyScreen()
//             : ViewDairyScreen();
//         break; // Exit loop after updating
//       }
//     }
//     // Check if username exists in SharedPreferences
//     if (savedUsername != null && savedUsername.isNotEmpty) {
//       // Fetch login response with saved username
//       setState(() {
//         // _loginResponse = _loginService.fetchLoginResponse(
//         //   type: STUDENT,
//         //   username: savedUsername,
//         //   context: context,
//         // );
//         _user =
//             LoginResponse.fromJson(jsonDecode(prefs.getString('user') ?? '{}'))
//                 .user;
//       });
//       _user =
//           LoginResponse.fromJson(jsonDecode(prefs.getString('user') ?? '{}'))
//               .user;
//       print("The login response - student: ${_user?.toJson()}");
//     } else {
//       print("No username found in SharedPreferences.");
//     }
//   }
//   //
//   // @override
//   // void didChangeAppLifecycleState(AppLifecycleState state) {
//   //   if (state == AppLifecycleState.resumed) {
//   //     _loadUserData();
//   //     _initializeLogin();
//   //   }
//   // }
//
//
//   @override
//   void initState() {
//     super.initState();
//     visibleItems = items.sublist(0, 8); // Initially show 8 items
//     _loadUserData();
//     _initializeLogin();
//     WidgetsBinding.instance.addObserver(this); // Observe lifecycle changes
//   }
//
//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }
//
//   /// Refresh user data when the app resumes.
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.resumed) {
//       _loadUserData();
//     }
//   }
//
//   /// Load user data from SharedPreferences.
//   Future<void> _loadUserData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? userJson = prefs.getString('user');
//     if (userJson != null) {
//       setState(() {
//         _user = LoginResponse.fromJson(jsonDecode(userJson)).user;
//       });
//     }
//   }
//
//
//
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   visibleItems = items.sublist(0, 8);
//   //   // _loginResponse = _loginService.fetchLoginResponse(type: STUDENT,username: "LALALALAS1");
//   //   _loadUserData();
//   //   //   WidgetsBinding.instance.addObserver(this);
//   //   _initializeLogin();
//   //   // print("The login respoinse - studnet  ${_loginResponse}");
//   // }
//   // @override
//   // void dispose() {
//   //   WidgetsBinding.instance.removeObserver(this); // Observer remove karo
//   //   super.dispose();
//   // }
//   void loadMoreItems() {
//     setState(() {
//       int remaining = items.length - visibleItems.length;
//       int itemsToAdd = remaining > 4 ? 4 : remaining;
//       visibleItems = items.sublist(0, visibleItems.length + itemsToAdd);
//     });
//   }
//
//   final GlobalKey<ScaffoldState> key = GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).cardColor,
//       key: key,
//       drawer: const SidebarMenu(/*loginResponse: _loginService,*/),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ClipRRect(
//               borderRadius: const BorderRadius.only(
//                 bottomRight: Radius.circular(50),
//               ),
//               child: AppBar(
//                 backgroundColor: Theme.of(context).colorScheme.onSecondary,
//                 leadingWidth: 45,
//                 toolbarHeight: 90,
//                 centerTitle: false,
//                 leading: Container(
//                   child: IconButton(
//                     icon: const Icon(
//                       Icons.menu,
//                       color: Colors.blue,
//                       size: 35,
//                     ),
//                     onPressed: () {
//                       key.currentState?.openDrawer();
//                     },
//                   ),
//                 ),
//                 title: Container(
//                   child: Row(mainAxisSize: MainAxisSize.min, children: [
//                     ClipOval(
//                       child: Image.asset(
//                         Images.profilePng,
//                         height: 70,
//                         width: 70,
//                       ),
//                     ),
//                     const SizedBox(width: 5),
//                     if (_user == null)
//                       CircularProgressIndicator(
//                         color: Colors.blue,
//                       )
//                     else
//                       Expanded(
//                         child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "${_user?.firstName ?? 'Loding'} ${_user?.lastName ?? 'Loding'}",
//                                 style: interMedium.copyWith(
//                                   fontSize: 16,
//                                   color: Theme.of(context).disabledColor,
//                                 ),
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                               const SizedBox(
//                                 height: 5,
//                               ),
//                               Text(
//                                 moduleSelected == 'teacher'
//                                     ? '${_user?.moreDetails.email}'
//                                     : ' Grade: ${_user?.moreDetails.grade}, Section: ${_user?.moreDetails.section}',
//                                 style: interMedium.copyWith(
//                                     fontSize: 12,
//                                     color: Theme.of(context).disabledColor,
//                                     overflow: TextOverflow.ellipsis),
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                               const SizedBox(
//                                 height: 2,
//                               ),
//                             ]),
//                       )
//                   ]),
//                 ),
//                 actions: [
//                   GestureDetector(
//                       onTap: () {
//                         Get.to(const NotificationScreen(
//                             notification: true, userType: 'student'));
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
//               ),
//             ),
//             25.h,
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
//                       'We hopesssss this message finds you well. Please be informed that the school will remain closed on Friday in observance of the upcoming public holiday.',
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
//             Column(
//               children: [
//                 SizedBox(
//                   height: 400,
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
//                       return Card(
//                         color: Colors.white,
//                         elevation: 4,
//                         clipBehavior: Clip.hardEdge,
//                         child: StudentWidget(
//                           icon: visibleItems[index]['icon']!,
//                           // icon: SvgPicture.asset(
//                           //   'assets/images/Homework.svg', // Path to your SVG file
//                           //   width: 150,
//                           //   height: 150,
//                           //   color: Colors.blue, // Optional: Change SVG color
//                           // ),
//                           label: visibleItems[index]['label']!,
//                           onpressed: () {
//                             print(visibleItems[index]['route']);
//                             Get.to(visibleItems[index]['route']);
//                           },
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:erp_school/data/models/response/login_response.dart';
import 'package:erp_school/services/login_service.dart';
import 'package:erp_school/view/screens/attendance/attendance_screen.dart';
import 'package:erp_school/view/screens/dashboard/widget/student_widget.dart';
import 'package:erp_school/view/screens/exam/mcq_screen.dart';
import 'package:erp_school/view/screens/gallery/gallery_screen.dart';
// import 'package:erp_school/view/screens/homework/homework.dart';
import 'package:erp_school/view/screens/homework/time_table_screen.dart';
import 'package:erp_school/view/screens/notification/notification_screen.dart';
import 'package:erp_school/view/screens/sidebar/side_bar.dart';
import 'package:erp_school/view/screens/student/event_calender_screen.dart';
import 'package:erp_school/view/screens/student/event_calender_screen_copy.dart';
import 'package:erp_school/view/screens/student/fees_details_screen.dart';
import 'package:erp_school/view/screens/student/student_performance_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/images.dart';
import 'package:erp_school/utils/styles.dart';
// import 'package:erp_school/view/screens/dashboard/widget/student_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../homework/homework.dart';
import '../homework/widget/homework_widget.dart';
import '../student/student_classDairy_screen.dart';
import '../teacher/view_dairy_screen.dart';
import 'DashboradController.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}
class _DashboardScreenState extends State<DashboardScreen> with WidgetsBindingObserver {
  Future<LoginResponse?>? _loginResponse; // Use nullable Future
  final LoginService _loginService = LoginService();
  String? moduleSelected = "";

  final List<Map<String, dynamic>> items = [
    {
      'icon': Images.homeworkPng,
      'label': 'Homework',
      'route': HomeWorkScreen()
    },
    {
      'icon': Images.attendancePng,
      'label': 'Attendance',
      'route': AttendanceScreen()
    },

    {
      'icon': Images.classlibrary,
      'label': 'Class Diary',
      'route': StudentClassdairyScreen()
      // 'route': ClassDairyScreen()
    },
    {
      'icon': Images.timetablePng,
      'label': 'Timetable',
      'route': const TimeTableScreen()
    },
    {
      'icon': Images.academicsPng,
      'label': 'Performance',
      'route': StudentPerformanceScreen()
    },
    // {
    //   'icon': Images.connectPng,
    //   'label': 'Connect',
    // },
    {
      'icon': Images.galleryPng,
      'label': 'Gallery',
      'route': const GalleryScreen()
    },
    {
      'icon': Images.eventcalendarPng,
      'label': 'Calendar',
      'route': StudentYearModelNew()
    },
    {'icon': Images.feesPng, 'label': 'Fees', 'route': FeeDetailsScreen()}
  ];
  User? _user;
  // User get user => _user!;
  List<Map<String, dynamic>> visibleItems = [];
  bool isLoading = true;
  Future<void> _initializeLogin() async {

    setState(() {
      isLoading = true;
    });

    // Fetch username from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUsername = prefs.getString('username');
    moduleSelected = prefs.getString('type')?.toLowerCase();
    items.first["route"] =
    moduleSelected == 'student' ? StudentHomeworkClass() : HomeWorkScreen();
    // Find the Class Diary item and update its route
    for (var item in items) {
      if (item['label'] == 'Class Diary') {
        item['route'] = moduleSelected == 'student'
            ? StudentClassdairyScreen()
            : ViewDairyScreen();
        break; // Exit loop after updating
      }
    }
    // Check if username exists in SharedPreferences
    if (savedUsername != null && savedUsername.isNotEmpty) {
      // Fetch login response with saved username
      setState(() {
        // _loginResponse = _loginService.fetchLoginResponse(
        //   type: STUDENT,
        //   username: savedUsername,
        //   context: context,
        // );
        _user =
            LoginResponse.fromJson(jsonDecode(prefs.getString('user') ?? '{}'))
                .user;
      });
      _user =
          LoginResponse.fromJson(jsonDecode(prefs.getString('user') ?? '{}'))
              .user;
      print("The login response - student: ${_user?.toJson()}");
    } else {
      print("No username found in SharedPreferences.");
      setState(() {
        isLoading = false;
      });
    }
  }
  final sharedPrefController = Get.find<SharedPrefController>();
  @override
  void initState() {
    super.initState();
    visibleItems = items.sublist(0, 8); // Initially show 8 items
    _loadUserData();
    _initializeLogin();
    WidgetsBinding.instance.addObserver(this); // Observe lifecycle changes
    Get.put(SharedPrefController()).loadUserData();
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// Refresh user data when the app resumes.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _loadUserData();
    }
  }

  /// Load user data from SharedPreferences.
  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');
    if (userJson != null) {
      setState(() {
        _user = LoginResponse.fromJson(jsonDecode(userJson)).user;
      });
    }
  }
  void loadMoreItems() {
    setState(() {
      int remaining = items.length - visibleItems.length;
      int itemsToAdd = remaining > 4 ? 4 : remaining;
      visibleItems = items.sublist(0, visibleItems.length + itemsToAdd);
    });
  }

  final GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      key: key,
      drawer: const SidebarMenu(/*loginResponse: _loginService,*/),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
              child: AppBar(
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
                leadingWidth: 45,
                toolbarHeight: 90,
                centerTitle: false,
                leading: Container(
                  child: IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.blue,
                      size: 35,
                    ),
                    onPressed: () {
                      key.currentState?.openDrawer();
                    },
                  ),
                ),
                title: isLoading ? Container(
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    ClipOval(
                      child: Image.asset(
                        Images.profilePng,
                        height: 70,
                        width: 70,
                      ),
                    ),
                    const SizedBox(width: 5),
                    if (_user == null)
                      CircularProgressIndicator(
                        color: Colors.blue,
                      )
                    else
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Obx(() => Text(
                                /*"${_user?.firstName ?? 'Loding'} ${_user?.lastName ?? 'Loding'}"*/ "${sharedPrefController.userData['user']['firstName'] ?? ''} ${sharedPrefController.userData['user']['lastName'] ?? ''} ",
                                style: interMedium.copyWith(
                                  fontSize: 16,
                                  color: Theme.of(context).disabledColor,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                moduleSelected == 'teacher'
                                    ? '${_user?.moreDetails.email}'
                                    : ' Grade: ${_user?.moreDetails.grade}, Section: ${_user?.moreDetails.section}',
                                style: interMedium.copyWith(
                                    fontSize: 12,
                                    color: Theme.of(context).disabledColor,
                                    overflow: TextOverflow.ellipsis),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                            ]),
                      )
                  ]),
                ): CircularProgressIndicator() ,
                actions: [
                  GestureDetector(
                      onTap: () {
                        Get.to(const NotificationScreen(
                            notification: true, userType: 'student'));
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
              ),
            ),
            25.h,
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
                      'We hopesssss this message finds you well. Please be informed that the school will remain closed on Friday in observance of the upcoming public holiday.',
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
            Column(
              children: [
                SizedBox(
                  height: 400,
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
                          // icon: SvgPicture.asset(
                          //   'assets/images/Homework.svg', // Path to your SVG file
                          //   width: 150,
                          //   height: 150,
                          //   color: Colors.blue, // Optional: Change SVG color
                          // ),
                          label: visibleItems[index]['label']!,
                          onpressed: () {
                            print(visibleItems[index]['route']);
                            Get.to(visibleItems[index]['route']);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
