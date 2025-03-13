// import 'dart:convert';
//
// import 'package:erp_school/constants/app_constants.dart';
// import 'package:erp_school/data/models/response/login_response.dart';
// import 'package:erp_school/services/login_service.dart';
// import 'package:erp_school/utils/images.dart';
// import 'package:erp_school/utils/styles.dart';
// import 'package:erp_school/view/screens/auth/login_screen.dart';
// import 'package:erp_school/view/screens/sidebar/widget/slider_menu.dart';
// import 'package:erp_school/view/screens/student/edit_profile.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../dashboard/dashboard_screen.dart';
// import '../parents/parents_screen.dart';
// import '../teacher/teacher_screen.dart';
//
// class SidebarMenu extends StatefulWidget {
//   const SidebarMenu({super.key});
//
//   @override
//   State<SidebarMenu> createState() => _SidebarMenuState();
// }
//
// class _SidebarMenuState extends State<SidebarMenu> {
//   LoginResponse? _loginResponse; // Use nullable Future
//   final LoginService _loginService = LoginService();
//   String? savedusername = "";
//   String? moduleSelected="";
//   Future<void> _initializeLogin() async {
//     // Fetch username from SharedPreferences
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? savedUsername = prefs.getString('username');
//     moduleSelected = prefs.getString('type')?.toLowerCase();
//
//     // Check if username exists in SharedPreferences
//     if (savedUsername != null && savedUsername.isNotEmpty) {
//       // Fetch login response with saved username
//       setState(() {
//         savedusername = savedUsername;
//         _loginResponse = LoginResponse.fromJson(jsonDecode(prefs.getString('user') ?? '{}'));
//       });
//       print("The login response - student: ${_loginResponse}");
//     } else {
//       print("No username found in SharedPreferences.");
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     _initializeLogin();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       width: MediaQuery.of(context).size.width * 0.82,
//       backgroundColor: Colors.blueAccent,   // Need finalize later for menu colors
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           GestureDetector(
//             onTap: () {
//               Get.to(StudentProfileScreen());
//             },
//             child: Container(
//               padding: EdgeInsets.only(top: 10),
//               height: 182,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   bottomRight: Radius.circular(100),
//                 ),
//                 color: Theme.of(context).cardColor,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Center(
//                   child: Row(
//                     children: [
//                       ClipOval(
//                         child: Image.asset(
//                           Images.profilePng,
//                           height: 80,
//                           width: 80,
//                         ),
//                       ),
//                       SizedBox(width: 10),
//                       _loginResponse == null ? CircularProgressIndicator(
//                         color: Colors.blue,
//                       ) : Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               _loginResponse?.user.username ?? '',
//                               style: interMedium.copyWith(
//                                 color: Theme.of(context).disabledColor,
//                                 fontSize: 16,
//                                 overflow: TextOverflow.ellipsis
//                               ),
//                               maxLines: 1,
//                             ),
//                             Text(
//                               moduleSelected == 'teacher' ? '${_loginResponse?.user.moreDetails.email}' : 'Grade: ${_loginResponse?.user.moreDetails.grade}- Section: ${_loginResponse?.user.moreDetails.section}',
//                               style: interMedium.copyWith(
//                                 color: Theme.of(context).disabledColor,
//                                 fontSize: 12,
//                                 overflow: TextOverflow.ellipsis
//                               ),
//                               maxLines: 1,
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   moduleSelected == 'teacher' ? "view_teacher_profile".tr : "view_profile".tr,
//                                   style: interMedium.copyWith(
//                                     color: Theme.of(context).primaryColor,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Icon(
//                                   Icons.arrow_circle_right,
//                                   size: 16,
//                                   color: Theme.of(context).primaryColor,
//                                 )
//                               ],
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           // SidebarMenuButton(
//           //   title: 'my_profile'.tr,
//           //   icon: Images.schoolPng,
//           //   onPressed: () {
//           //     // Get.to(StudentProfileScreen());
//           //   },
//           // ),
//           // SidebarMenuButton(
//           //   title: 'publication_profile'.tr,
//           //   icon: Images.publicationPng,
//           //   onPressed: () {
//           //     // Get.to(AttendanceScreen());
//           //   },
//           // ),
//           // SidebarMenuButton(
//           //   title: 'emergency'.tr,
//           //   icon: Images.emergencyPng,
//           //   onPressed: () {
//           //     // Get.to(NotificationScreen());
//           //   },
//           // ),
//           // SidebarMenuButton(
//           //   title: 'setting'.tr,
//           //   icon: Images.settingPng,
//           //   onPressed: () {},
//           // ),
//           // SidebarMenuButton(
//           //   title: 'logout'.tr,
//           //   icon: Images.logoutPng,
//           //   onPressed: () async {
//           //     if (savedusername!.isNotEmpty) {
//           //       SharedPreferences prefs = await SharedPreferences.getInstance();
//           //       await prefs.remove('username');
//           //       await prefs.remove('type');
//           //       ScaffoldMessenger.of(context).showSnackBar(
//           //         SnackBar(
//           //           content: Text(
//           //             "Logged out successfully!",
//           //             style: TextStyle(
//           //               fontSize: 12,
//           //             ),
//           //           ),
//           //           duration: Duration(seconds: 3),
//           //           backgroundColor: Theme.of(context).primaryColor,
//           //         ),
//           //       );
//           //       Get.off(
//           //         () => /*_navigateBasedOnType);*/
//           //             LoginScreen(
//           //             title: "student",
//           //         /*  if("student"){
//           //
//           //       }elase("teacher"){
//           //
//           //       }*/
//           //         ),
//           //       );
//           //     }
//           //   },
//           // ),
//           SidebarMenuButton(
//             title: 'logout'.tr,
//             icon: Images.logoutPng,
//             onPressed: () async {
//               if (savedusername!.isNotEmpty) {
//                 SharedPreferences prefs = await SharedPreferences.getInstance();
//                 String? userType = prefs.getString('type'); // User type fetch karo
//                 await prefs.remove('username');
//                 await prefs.remove('type');
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text(
//                       "Logged out successfully!",
//                       style: TextStyle(
//                         fontSize: 12,
//                       ),
//                     ),
//                     duration: Duration(seconds: 3),
//                     backgroundColor: Theme.of(context).primaryColor,
//                   ),
//                 );
//
//                 // User type check karke redirect karo
//                 if (userType == "student") {
//                   Get.off(() => LoginScreen(title: "student"));
//                 } else if (userType == "teacher") {
//                   Get.off(() => LoginScreen(title: "teacher"));
//                 }
//               }
//             },
//           ),
//
//         ],
//       ),
//     );
//   }
//   void _navigateBasedOnType(String type) {
//     switch (type.toLowerCase()) {
//       case 'student':
//         Get.offAll(() => const DashboardScreen());
//         break;
//       case 'parent':
//         Get.offAll(() => ParentsScreen());
//         break;
//       default:
//         Get.offAll(() => TeacherScreen());
//     }
//   }
// }
/////////////////////////////////////////////////////////////////////////////
// import 'dart:convert';
//
// import 'package:erp_school/constants/app_constants.dart';
// import 'package:erp_school/data/models/response/login_response.dart';
// import 'package:erp_school/services/login_service.dart';
// import 'package:erp_school/utils/images.dart';
// import 'package:erp_school/utils/styles.dart';
// import 'package:erp_school/view/screens/auth/login_screen.dart';
// import 'package:erp_school/view/screens/sidebar/widget/slider_menu.dart';
// import 'package:erp_school/view/screens/student/edit_profile.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../dashboard/dashboard_screen.dart';
// import '../module/choose_module.dart';
// import '../parents/parents_screen.dart';
// import '../teacher/teacher_screen.dart';
//
// class SidebarMenu extends StatefulWidget {
//   const SidebarMenu({super.key});
//
//   @override
//   State<SidebarMenu> createState() => _SidebarMenuState();
// }
//
// class _SidebarMenuState extends State<SidebarMenu> {
//   LoginResponse? _loginResponse; // Use nullable Future
//   final LoginService _loginService = LoginService();
//   String? savedusername = "";
//   String? moduleSelected="";
//   Future<void> _initializeLogin() async {
//     // Fetch username from SharedPreferences
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? savedUsername = prefs.getString('username');
//     moduleSelected = prefs.getString('type')?.toLowerCase();
//
//     // Check if username exists in SharedPreferences
//     if (savedUsername != null && savedUsername.isNotEmpty) {
//       // Fetch login response with saved username
//       setState(() {
//         savedusername = savedUsername;
//         _loginResponse = LoginResponse.fromJson(jsonDecode(prefs.getString('user') ?? '{}'));
//       });
//       print("The login response - student: ${_loginResponse}");
//     } else {
//       print("No username found in SharedPreferences.");
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     _initializeLogin();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       width: MediaQuery.of(context).size.width * 0.82,
//       backgroundColor: Colors.blueAccent,   // Need finalize later for menu colors
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           GestureDetector(
//             onTap: () {
//               Get.to(StudentProfileScreen());
//             },
//             child: Container(
//               padding: EdgeInsets.only(top: 10),
//               height: 182,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   bottomRight: Radius.circular(100),
//                 ),
//                 color: Theme.of(context).cardColor,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Center(
//                   child: Row(
//                     children: [
//                       ClipOval(
//                         child: Image.asset(
//                           Images.profilePng,
//                           height: 80,
//                           width: 80,
//                         ),
//                       ),
//                       SizedBox(width: 10),
//                       _loginResponse == null ? CircularProgressIndicator(
//                         color: Colors.blue,
//                       ) : Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               _loginResponse?.user.username ?? '',
//                               style: interMedium.copyWith(
//                                   color: Theme.of(context).disabledColor,
//                                   fontSize: 16,
//                                   overflow: TextOverflow.ellipsis
//                               ),
//                               maxLines: 1,
//                             ),
//                             Text(
//                               moduleSelected == 'teacher' ? '${_loginResponse?.user.moreDetails.email}' : 'Grade: ${_loginResponse?.user.moreDetails.grade}- Section: ${_loginResponse?.user.moreDetails.section}',
//                               style: interMedium.copyWith(
//                                   color: Theme.of(context).disabledColor,
//                                   fontSize: 12,
//                                   overflow: TextOverflow.ellipsis
//                               ),
//                               maxLines: 1,
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   moduleSelected == 'teacher' ? "view_teacher_profile".tr : "view_profile".tr,
//                                   style: interMedium.copyWith(
//                                     color: Theme.of(context).primaryColor,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Icon(
//                                   Icons.arrow_circle_right,
//                                   size: 16,
//                                   color: Theme.of(context).primaryColor,
//                                 )
//                               ],
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           // SidebarMenuButton(
//           //   title: 'my_profile'.tr,
//           //   icon: Images.schoolPng,
//           //   onPressed: () {
//           //     // Get.to(StudentProfileScreen());
//           //   },
//           // ),
//           // SidebarMenuButton(
//           //   title: 'publication_profile'.tr,
//           //   icon: Images.publicationPng,
//           //   onPressed: () {
//           //     // Get.to(AttendanceScreen());
//           //   },
//           // ),
//           // SidebarMenuButton(
//           //   title: 'emergency'.tr,
//           //   icon: Images.emergencyPng,
//           //   onPressed: () {
//           //     // Get.to(NotificationScreen());
//           //   },
//           // ),
//           // SidebarMenuButton(
//           //   title: 'setting'.tr,
//           //   icon: Images.settingPng,
//           //   onPressed: () {},
//           // ),
//           // SidebarMenuButton(
//           //   title: 'logout'.tr,
//           //   icon: Images.logoutPng,
//           //   onPressed: () async {
//           //     if (savedusername!.isNotEmpty) {
//           //       SharedPreferences prefs = await SharedPreferences.getInstance();
//           //       await prefs.remove('username');
//           //       await prefs.remove('type');
//           //       ScaffoldMessenger.of(context).showSnackBar(
//           //         SnackBar(
//           //           content: Text(
//           //             "Logged out successfully!",
//           //             style: TextStyle(
//           //               fontSize: 12,
//           //             ),
//           //           ),
//           //           duration: Duration(seconds: 3),
//           //           backgroundColor: Theme.of(context).primaryColor,
//           //         ),
//           //       );
//           //       Get.off(
//           //         () => /*_navigateBasedOnType);*/
//           //             LoginScreen(
//           //             title: "student",
//           //         /*  if("student"){
//           //
//           //       }elase("teacher"){
//           //
//           //       }*/
//           //         ),
//           //       );
//           //     }
//           //   },
//           // ),
//           SidebarMenuButton(
//             title: 'logout'.tr,
//             icon: Images.logoutPng,
//             onPressed: () async {
//               if (savedusername!.isNotEmpty) {
//                 SharedPreferences prefs = await SharedPreferences.getInstance();
//                 String? userType = prefs.getString('type'); // User type fetch karo
//                 await prefs.remove('username');
//                 await prefs.remove('type');
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text(
//                       "Logged out successfully!",
//                       style: TextStyle(
//                         fontSize: 12,
//                       ),
//                     ),
//                     duration: Duration(seconds: 3),
//                     backgroundColor: Theme.of(context).primaryColor,
//                   ),
//                 );
//
//                 Get.offAll(ChooseModuleScreen());
//
//                 // User type check karke redirect karo
//                 // if (userType == "student") {
//                 //   Get.off(() => LoginScreen(title: "student"));
//                 // } else if (userType == "teacher") {
//                 //   Get.off(() => LoginScreen(title: "teacher"));
//                 // }
//               }
//             },
//           ),
//
//         ],
//       ),
//     );
//
//   }
//
//   void _navigateBasedOnType(String type) {
//     switch (type.toLowerCase()) {
//       case 'student':
//         Get.offAll(() => const DashboardScreen());
//         break;
//       case 'parent':
//         Get.offAll(() => ParentsScreen());
//         break;
//       default:
//         Get.offAll(() => TeacherScreen());
//     }
//   }
// }
import 'dart:convert';

import 'package:erp_school/data/models/response/login_response.dart';
import 'package:erp_school/services/login_service.dart';
import 'package:erp_school/utils/images.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/screens/sidebar/widget/slider_menu.dart';
import 'package:erp_school/view/screens/student/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dashboard/DashboradController.dart';
import '../dashboard/dashboard_screen.dart';
import '../edit_profile/edit_profile_screen.dart';
import '../module/choose_module.dart';
import '../parents/parents_screen.dart';
import '../teacher/teacher_screen.dart';
/// controller
import 'package:get/get.dart';

class SidebarMenu extends StatefulWidget {
  /*final LoginResponse? loginResponse;*/
  const SidebarMenu({super.key, /*this.loginResponse*/});

  @override
  State<SidebarMenu> createState() => _SidebarMenuState();
}

class _SidebarMenuState extends State<SidebarMenu> with WidgetsBindingObserver {
  LoginResponse? loginResponse; // Use nullable Future
  final LoginService loginService = LoginService();
  User? _user;
  String? savedusername = "";
  String? moduleSelected="";
  Future<void> _initializeLogin() async {
    // Fetch username from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUsername = prefs.getString('username');
    moduleSelected = prefs.getString('type')?.toLowerCase();

    // Check if username exists in SharedPreferences
    if (savedUsername != null && savedUsername.isNotEmpty) {
      // Fetch login response with saved username
      setState(() {
        savedusername = savedUsername;
        loginResponse = LoginResponse.fromJson(jsonDecode(prefs.getString('user') ?? '{}'));
      });
      print("The login response - student: ${loginResponse}");
    } else {
      print("No username found in SharedPreferences.");
    }
  }
  /// Load user data from SharedPreferences.
  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');
    if (userJson != null) {
      setState(() {
        loginResponse = LoginResponse.fromJson(jsonDecode(prefs.getString('user') ?? '{}'));
      });
    }
  }
  /// Refresh user data when the app resumes.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _loadUserData();
    }
  }
  final sharedPrefController = Get.find<SharedPrefController>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeLogin();
    _loadUserData();
    Get.put(SharedPrefController()).loadUserData();

  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.82,
      backgroundColor: Colors.blueAccent,   // Need finalize later for menu colors
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(StudentProfileScreen());
            },
            child: Container(
              padding: EdgeInsets.only(top: 10),
              height: 182,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(100),
                ),
                color: Theme.of(context).cardColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Center(
                  child: Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          Images.profilePng,
                          height: 80,
                          width: 80,
                        ),
                      ),
                      SizedBox(width: 10),
                      loginResponse == null ? CircularProgressIndicator(
                        color: Colors.blue,
                      ) : Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(() =>   Text(
                            "${sharedPrefController.userData['user']['firstName'] ?? ''} ${sharedPrefController.userData['user']['lastName'] ?? ''} ", /*loginResponse?.user.username ?? '',*/
                              style: interMedium.copyWith(
                                  color: Theme.of(context).disabledColor,
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis
                              ),
                              maxLines: 1,
                            ),),
                            Text(
                              moduleSelected == 'teacher' ? '${loginResponse?.user.moreDetails.email}' : 'Grade: ${loginResponse?.user.moreDetails.grade}- Section: ${loginResponse?.user.moreDetails.section}',
                              style: interMedium.copyWith(
                                  color: Theme.of(context).disabledColor,
                                  fontSize: 12,
                                  overflow: TextOverflow.ellipsis
                              ),
                              maxLines: 1,
                            ),
                            Row(
                              children: [
                                Text(
                                  moduleSelected == 'teacher' ? "view_teacher_profile".tr : "view_profile".tr,
                                  style: interMedium.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.arrow_circle_right,
                                  size: 16,
                                  color: Theme.of(context).primaryColor,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SidebarMenuButton(
            title: 'Edit profile'.tr,
            icon: "assets/images/edit-profile.png",color: Colors.white,
            onPressed: () {
              // Get.to(StudentProfileScreen());
              _initializeLogin();
              Get.to(EditProfileScreen(/*loginResponse:  loginResponse,*/));
              super.initState();
              WidgetsBinding.instance.addObserver(this);
              _initializeLogin();
              _loadUserData();
              Get.put(SharedPrefController()).loadUserData();
            },
          ),

          // SidebarMenuButton(
          //   title: 'my_profile'.tr,
          //   icon: Images.schoolPng,
          //   onPressed: () {
          //     // Get.to(StudentProfileScreen());
          //   },
          // ),
          // SidebarMenuButton(
          //   title: 'publication_profile'.tr,
          //   icon: Images.publicationPng,
          //   onPressed: () {
          //     // Get.to(AttendanceScreen());
          //   },
          // ),
          // SidebarMenuButton(
          //   title: 'emergency'.tr,
          //   icon: Images.emergencyPng,
          //   onPressed: () {
          //     // Get.to(NotificationScreen());
          //   },
          // ),
          // SidebarMenuButton(
          //   title: 'setting'.tr,
          //   icon: Images.settingPng,
          //   onPressed: () {},
          // ),
          // SidebarMenuButton(
          //   title: 'logout'.tr,
          //   icon: Images.logoutPng,
          //   onPressed: () async {
          //     if (savedusername!.isNotEmpty) {
          //       SharedPreferences prefs = await SharedPreferences.getInstance();
          //       await prefs.remove('username');
          //       await prefs.remove('type');
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         SnackBar(
          //           content: Text(
          //             "Logged out successfully!",
          //             style: TextStyle(
          //               fontSize: 12,
          //             ),
          //           ),
          //           duration: Duration(seconds: 3),
          //           backgroundColor: Theme.of(context).primaryColor,
          //         ),
          //       );
          //       Get.off(
          //         () => /*_navigateBasedOnType);*/
          //             LoginScreen(
          //             title: "student",
          //         /*  if("student"){
          //
          //       }elase("teacher"){
          //
          //       }*/
          //         ),
          //       );
          //     }
          //   },
          // ),
          SidebarMenuButton(
            title: 'logout'.tr,
            icon: Images.logoutPng,
            onPressed: () async {
               SharedPreferences prefs = await SharedPreferences.getInstance();
               // await prefs.clear();
              if (savedusername!.isNotEmpty) {
                String? userType = prefs.getString('type'); // User type fetch karo
                await prefs.remove('username');
                await prefs.remove('type');
                await prefs.remove('user');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Logged out successfully!",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    duration: Duration(seconds: 3),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                );

             Get.offAll(ChooseModuleScreen());
                // User type check karke redirect karo
                // if (userType == "student") {
                //   Get.off(() => LoginScreen(title: "student"));
                // } else if (userType == "teacher") {
                //   Get.off(() => LoginScreen(title: "teacher"));
                // }
              }
            },
          ),

        ],
      ),
    );
  }
  void _navigateBasedOnType(String type) {
    switch (type.toLowerCase()) {
      case 'student':
        Get.offAll(() =>  DashboardScreen());
        break;
      case 'parent':
        Get.offAll(() => ParentsScreen());
        break;
      default:
        Get.offAll(() => TeacherScreen());
    }
  }
}
