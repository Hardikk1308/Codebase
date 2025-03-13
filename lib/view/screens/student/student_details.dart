// import 'dart:convert';
//
// import 'package:erp_school/constants/app_constants.dart';
// import 'package:erp_school/data/models/response/login_response.dart';
// import 'package:erp_school/services/login_service.dart';
// import 'package:erp_school/themes/light.dart';
// import 'package:erp_school/utils/dimensions.dart';
// import 'package:erp_school/utils/images.dart';
// import 'package:erp_school/utils/styles.dart';
// import 'package:erp_school/view/base/custom_appbar.dart';
// import 'package:erp_school/view/base/custom_button.dart';
// import 'package:erp_school/view/screens/student/widget/name_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../../utils/shared_preference_util.dart';
//
// class StudentDetailsScreen extends StatefulWidget {
//   const StudentDetailsScreen({super.key});
//
//   @override
//   State<StudentDetailsScreen> createState() => _StudentDetailsScreenState();
// }
//
// class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
//   Future<LoginResponse?>? _loginResponse; // Use nullable Future
//   final LoginService _loginService = LoginService();
//   String? moduleSelected="";
//   // Future<void> _initializeLogin() async {
//   //   // Fetch username from SharedPreferences
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   String? savedUsername = prefs.getString('username');
//   //   moduleSelected = prefs.getString('type')?.toLowerCase();
//   //   // Check if username exists in SharedPreferences
//   //   if (savedUsername != null && savedUsername.isNotEmpty) {
//   //     // Fetch login response with saved username
//   //     setState(() {
//   //       // // _loginResponse = _loginService.fetchStudentDetail(
//   //       // //   context: context,
//   //       // //   type: moduleSelected as String,
//   //       // //   username: savedUsername,
//   //       // );
//   //     });
//   //     print("The login response - student: ${_loginResponse}");
//   //   } else {
//   //     print("No username found in SharedPreferences.");
//   //   }
//   // }
//
//   String? selectedModule="";
//
//   User? _user;
//   User get user =>_user!;
//   Future<void> _initializeLogin() async {
//     // Fetch username from SharedPreferences
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? savedUsername = prefs.getString('username');
//     selectedModule = prefs.getString('type')?.toLowerCase();
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
//   @override
//   void initState() {
//     super.initState();
//
//     _initializeLogin();
//   }
//
//   int? selectedIndex = 1;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).cardColor,
//       appBar: CustomAppBar(
//         title: moduleSelected == 'teacher' ? "teacher_profile".tr :'student_profile'.tr,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: 12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedIndex = 1;
//                       });
//                     },
//                     child: Container(
//                       height: 39,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         color: selectedIndex == 1
//                             ? Theme.of(context).primaryColor
//                             : Theme.of(context).colorScheme.surface,
//                         border: Border.all(
//                           color: selectedIndex == 1
//                               ? Theme.of(context).primaryColor
//                               : Colors.transparent,
//                         ),
//                       ),
//                       alignment: Alignment.center,
//                       padding: EdgeInsets.symmetric(horizontal: 14),
//                       child: Text(
//                         'general_details'.tr,
//                         style: interRegular.copyWith(
//                           fontSize: 14,
//                           color: selectedIndex == 1
//                               ? Theme.of(context).cardColor
//                               : Theme.of(context).disabledColor,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 15,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedIndex = 2;
//                       });
//                     },
//                     child: Container(
//                       height: 40,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         color: selectedIndex == 2
//                             ? Theme.of(context).primaryColor
//                             : Theme.of(context).colorScheme.surface,
//                         border: Border.all(
//                           color: selectedIndex == 2
//                               ? Theme.of(context).primaryColor
//                               : Colors.transparent,
//                         ),
//                       ),
//                       alignment: Alignment.center,
//                       padding: EdgeInsets.symmetric(horizontal: 12),
//                       child: Text(
//                         'parents_details'.tr,
//                         style: interRegular.copyWith(
//                           fontSize: 14,
//                           color: selectedIndex == 2
//                               ? Theme.of(context).cardColor
//                               : Theme.of(context).disabledColor,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 15,
//                   ),
//                   // GestureDetector(
//                   //   onTap: () {
//                   //     setState(() {
//                   //       selectedIndex = 3;
//                   //     });
//                   //   },
//                   //   child: Container(
//                   //     height: 40,
//                   //     decoration: BoxDecoration(
//                   //       borderRadius: BorderRadius.circular(8),
//                   //       color: selectedIndex == 3
//                   //           ? Theme.of(context).primaryColor
//                   //           : Theme.of(context).colorScheme.surface,
//                   //       border: Border.all(
//                   //         color: selectedIndex == 3
//                   //             ? Theme.of(context).primaryColor
//                   //             : Colors.transparent,
//                   //       ),
//                   //     ),
//                   //     alignment: Alignment.center,
//                   //     padding: EdgeInsets.symmetric(horizontal: 12),
//                   //     child: Text(
//                   //       'previous_school_details'.tr,
//                   //       style: interRegular.copyWith(
//                   //         fontSize: 14,
//                   //         color: selectedIndex == 3
//                   //             ? Theme.of(context).cardColor
//                   //             : Theme.of(context).disabledColor,
//                   //       ),
//                   //     ),
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             selectedIndex == 1
//                 ? FutureBuilder<LoginResponse?>(
//                     future: _loginResponse,
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return Center(
//                           child: CircularProgressIndicator(
//                             color: Colors.blue,
//                           ),
//                         );
//                       } else if (snapshot.hasError) {
//                         return Text('Error: ${snapshot.error}');
//                       } else if (snapshot.hasData) {
//                         final user = snapshot.data!.user;
//                         return Column(
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 12, vertical: 8),
//                                   height: 35,
//                                   width: Get.width / 2.6,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.only(
//                                           topLeft: Radius.circular(15),
//                                           topRight: Radius.circular(15)),
//                                       color: Theme.of(context).primaryColor,
//                                       boxShadow: [customBoxShadow()]),
//                                   child: Text(
//                                     moduleSelected == 'teacher' ? "teacher_details".tr :'student_details'.tr,
//                                     style: interMedium.copyWith(
//                                         fontSize: 14,
//                                         color: Theme.of(context).cardColor),
//                                   ),
//                                 ),
//                                 Container(
//                                   padding: EdgeInsets.symmetric(horizontal: 20),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.only(
//                                       bottomLeft: Radius.circular(15),
//                                       topRight: Radius.circular(15),
//                                       bottomRight: Radius.circular(15),
//                                     ),
//                                     color: Theme.of(context).cardColor,
//                                     boxShadow: [customBoxShadow()],
//                                   ),
//                                   child: Column(
//                                     children: [
//                                       NameWidget(
//                                         title: 'name'.tr,
//                                         subtitle: user.username,
//                                       ),
//                                       NameWidget(
//                                         title: 'age'.tr,
//                                         subtitle:
//                                             '${user.moreDetails.age} year',
//                                       ),
//                                       NameWidget(
//                                         title: 'gender'.tr,
//                                         subtitle: user.moreDetails.gender,
//                                       ),
//                                       NameWidget(
//                                         title: 'dob'.tr,
//                                         subtitle: user.moreDetails.dob
//                                             .toString()
//                                             .split(' ')[0],
//                                       ),
//                                       NameWidget(
//                                         title: 'blood_group'.tr,
//                                         subtitle:
//                                             '${user.moreDetails.bloodGrp}',
//                                       ),
//                                       // NameWidget(
//                                       //   title: 'religion'.tr,
//                                       //   subtitle: 'Hindu',
//                                       // ),
//                                       NameWidget(
//                                         title: 'category'.tr,
//                                         subtitle: user
//                                             .moreDetails.mediumOfInstruction?? '',
//                                       ),
//                                       SizedBox(
//                                         height: 15,
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                             20.h,
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Visibility(
//                                     visible: moduleSelected=='student',
//                                     child: Container(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 12, vertical: 8),
//                                       height: 35,
//                                       width: Get.width / 2.6,
//                                       decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.only(
//                                               topLeft: Radius.circular(15),
//                                               topRight: Radius.circular(15)),
//                                           color: Theme.of(context).primaryColor,
//                                           boxShadow: [customBoxShadow()]),
//                                       child: Text(
//                                         'admission_details'.tr,
//                                         style: interMedium.copyWith(
//                                             fontSize: 14,
//                                             color: Theme.of(context).cardColor),
//                                       ),
//                                     ),
//                                 ),
//                                 Visibility(
//                                     visible: moduleSelected=='student',
//                                     child: Container(
//                                       padding: EdgeInsets.symmetric(horizontal: 20),
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.only(
//                                           bottomLeft: Radius.circular(15),
//                                           topRight: Radius.circular(15),
//                                           bottomRight: Radius.circular(15),
//                                         ),
//                                         color: Theme.of(context).cardColor,
//                                         boxShadow: [customBoxShadow()],
//                                       ),
//                                       child: Column(
//                                         children: [
//                                           // NameWidget(
//                                           //   title: 'sr'.tr,
//                                           //   subtitle: '352585',
//                                           // ),
//                                           // NameWidget(
//                                           //   title: 'student_id'.tr,
//                                           //   subtitle: '23',
//                                           // ),
//                                           // NameWidget(
//                                           //   title: 'admission_type'.tr,
//                                           //   subtitle: 'NEW',
//                                           // ),
//                                           NameWidget(
//                                             title: 'admission_no'.tr,
//                                             subtitle: user.moreDetails.admissionNo?? '',
//                                           ),
//                                           NameWidget(
//                                             title: 'admission_date'.tr,
//                                             subtitle: user.moreDetails.admisionDate
//                                                 .toString()
//                                                 .split(' ')[0],
//                                           ),
//                                           NameWidget(
//                                             title: 'register_no'.tr,
//                                             subtitle: user.moreDetails.registerNo?? '',
//                                           ),
//                                           NameWidget(
//                                             title: 'enrollment_no'.tr,
//                                             subtitle: user.moreDetails.rollNumber?? '',
//                                           ),
//                                           NameWidget(
//                                             title: 'education_medium'.tr,
//                                             subtitle: 'English',
//                                           ),
//                                           NameWidget(
//                                             title: 'stream'.tr,
//                                             subtitle:
//                                             user.moreDetails.streamOfStudy?? '',
//                                           ),
//                                           SizedBox(
//                                             height: 15,
//                                           ),
//                                         ],
//                                       ),
//                                     )
//                                 ),
//                               ],
//                             ),
//                           ],
//                         );
//                       } else {
//                         return Text('No user data available');
//                       }
//                     },
//                   )
//                 :
//                 // : selectedIndex == 2
//                 //     ?
//                 FutureBuilder<LoginResponse?>(
//                     future: _loginResponse,
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return Center(
//                           child: CircularProgressIndicator(
//                             color: Colors.blue,
//                           ),
//                         );
//                       } else if (snapshot.hasError) {
//                         return Text('Error: ${snapshot.error}');
//                       } else if (snapshot.hasData) {
//                         final user = snapshot.data!.user;
//                         return Column(
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 12, vertical: 8),
//                                   height: 35,
//                                   width: Get.width / 2.6,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.only(
//                                           topLeft: Radius.circular(15),
//                                           topRight: Radius.circular(15)),
//                                       color: Theme.of(context).primaryColor,
//                                       boxShadow: [customBoxShadow()]),
//                                   child: Text(
//                                     'parents_details'.tr,
//                                     style: interMedium.copyWith(
//                                         fontSize: 14,
//                                         color: Theme.of(context).cardColor),
//                                   ),
//                                 ),
//                                 Container(
//                                   padding: EdgeInsets.symmetric(horizontal: 20),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.only(
//                                       bottomLeft: Radius.circular(15),
//                                       topRight: Radius.circular(15),
//                                       bottomRight: Radius.circular(15),
//                                     ),
//                                     color: Theme.of(context).cardColor,
//                                     boxShadow: [customBoxShadow()],
//                                   ),
//                                   child: Column(
//                                     children: [
//                                       NameWidget(
//                                         title: 'father_name'.tr,
//                                         subtitle: user.moreDetails.fatherName,
//                                       ),
//                                       NameWidget(
//                                         title: 'mother_name'.tr,
//                                         subtitle: user.moreDetails.motherName,
//                                       ),
//                                   Visibility(
//                                       visible: moduleSelected=='student',
//                                       child: NameWidget(
//                                         title: 'other_guardian'.tr,
//                                         subtitle: user.moreDetails.guardianName ?? '',
//                                       )
//                                   ),
//                                       NameWidget(
//                                         title: 'contact_number'.tr,
//                                         subtitle:
//                                             '+${user.moreDetails.emergencyContactNumber}',
//                                       ),
//                                       // NameWidget(
//                                       //   title: 'father_occupation'.tr,
//                                       //   subtitle: 'C.A+',
//                                       // ),
//                                       // NameWidget(
//                                       //   title: 'mother_occupation'.tr,
//                                       //   subtitle: 'House Wife',
//                                       // ),
//                                       SizedBox(
//                                         height: 15,
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ],
//                         );
//                       } else {
//                         return Text('No user data available');
//                       }
//                     },
//                   ),
//             // : Column(
//             //     crossAxisAlignment: CrossAxisAlignment.start,
//             //     children: [
//             //       Container(
//             //         padding: EdgeInsets.symmetric(
//             //             horizontal: 12, vertical: 8),
//             //         height: 35,
//             //         width: Get.width / 2.6,
//             //         decoration: BoxDecoration(
//             //             borderRadius: BorderRadius.only(
//             //                 topLeft: Radius.circular(15),
//             //                 topRight: Radius.circular(15)),
//             //             color: Theme.of(context).primaryColor,
//             //             boxShadow: [customBoxShadow()]),
//             //         child: Text(
//             //           'previous_school_detail'.tr,
//             //           style: interMedium.copyWith(
//             //               fontSize: 14,
//             //               color: Theme.of(context).cardColor),
//             //         ),
//             //       ),
//             //       Container(
//             //         padding: EdgeInsets.symmetric(horizontal: 20),
//             //         decoration: BoxDecoration(
//             //           borderRadius: BorderRadius.only(
//             //             bottomLeft: Radius.circular(15),
//             //             topRight: Radius.circular(15),
//             //             bottomRight: Radius.circular(15),
//             //           ),
//             //           color: Theme.of(context).cardColor,
//             //           boxShadow: [customBoxShadow()],
//             //         ),
//             //         child: Column(
//             //           children: [
//             //             NameWidget(
//             //               title: 'school_name'.tr,
//             //               subtitle: 'New Era Wishdom Global School',
//             //             ),
//             //             NameWidget(
//             //               title: 'grade'.tr,
//             //               subtitle: 'B',
//             //             ),
//             //             NameWidget(
//             //               title: 'class_completed'.tr,
//             //               subtitle: '4',
//             //             ),
//             //             NameWidget(
//             //               title: 'percentage'.tr,
//             //               subtitle: '91%',
//             //             ),
//             //             NameWidget(
//             //               title: 'grades'.tr,
//             //               subtitle: 'A+',
//             //             ),
//             //             NameWidget(
//             //               title: 'year_of_completion'.tr,
//             //               subtitle: '09- Apr- 2020',
//             //             ),
//             //             SizedBox(
//             //               height: 15,
//             //             ),
//             //           ],
//             //         ),
//             //       ),
//             //       20.h,
//             //       Text(
//             //         'student_document'.tr,
//             //         style: interMedium.copyWith(
//             //             fontSize: 16,
//             //             color: Theme.of(context).disabledColor),
//             //       ),
//             //       20.h,
//             //       Row(
//             //         children: [
//             //           ClipRRect(
//             //               borderRadius: BorderRadius.circular(15),
//             //               child: Image.asset(
//             //                 Images.documentPng,
//             //                 height: 140,
//             //               )),
//             //           10.w,
//             //           ClipRRect(
//             //               borderRadius: BorderRadius.circular(15),
//             //               child: Image.asset(
//             //                 Images.document2Png,
//             //                 height: 140,
//             //               )),
//             //         ],
//             //       ),
//             //       50.h,
//             //       CustomButton(
//             //           height: 50,
//             //           fontSize: 14,
//             //           color: true,
//             //           radius: 50,
//             //           title: 'download_document'.tr,
//             //           onPressed: () {
//             //             setState(() {
//             //               selectedIndex = 1;
//             //             });
//             //           }),
//             //     ],
//             //   )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:erp_school/data/models/response/login_response.dart';
import 'package:erp_school/services/login_service.dart';
import 'package:erp_school/themes/light.dart';
import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:erp_school/view/screens/student/widget/name_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/shared_preference_util.dart';
import '../dashboard/DashboradController.dart';

class StudentDetailsScreen extends StatefulWidget with WidgetsBindingObserver {
  const StudentDetailsScreen({super.key});

  @override
  State<StudentDetailsScreen> createState() => _StudentDetailsScreenState();
}

class _StudentDetailsScreenState extends State<StudentDetailsScreen> with WidgetsBindingObserver {
  Future<LoginResponse?>? _loginResponse; // Use nullable Future
  final LoginService _loginService = LoginService();
  String? moduleSelected="";
  // Future<void> _initializeLogin() async {
  //   // Fetch username from SharedPreferences
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? savedUsername = prefs.getString('username');
  //   moduleSelected = prefs.getString('type')?.toLowerCase();
  //   // Check if username exists in SharedPreferences
  //   if (savedUsername != null && savedUsername.isNotEmpty) {
  //     // Fetch login response with saved username
  //     setState(() {
  //       // // _loginResponse = _loginService.fetchStudentDetail(
  //       // //   context: context,
  //       // //   type: moduleSelected as String,
  //       // //   username: savedUsername,
  //       // );
  //     });
  //     print("The login response - student: ${_loginResponse}");
  //   } else {
  //     print("No username found in SharedPreferences.");
  //   }
  // }

  String? selectedModule="";

  User? _user;
  User get user =>_user!;
  Future<void> _initializeLogin() async {
    // Fetch username from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUsername = prefs.getString('username');
    selectedModule = prefs.getString('type')?.toLowerCase();
    // Check if username exists in SharedPreferences
    if (savedUsername != null && savedUsername.isNotEmpty) {
      final prefs = await SharedPreferenceUtil.getInstance();
      setState(() {
        _user = LoginResponse.fromJson(jsonDecode(prefs.getString('user') ?? '{}')).user;
      });
      print("The login response - student more -> : ${_user?.toJson()}");
    } else {
      print("No username found in SharedPreferences.");
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //
  //   _initializeLogin();
  // }
  final sharedPrefController = Get.find<SharedPrefController>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeLogin();
    // _loadUserData();
    Get.put(SharedPrefController()).loadUserData();

  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }


  int? selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: CustomAppBar(
        title: moduleSelected == 'teacher' ? "teacher_profile".tr :'student_profile'.tr,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
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
                      height: 39,
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
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Text(
                        'general_details'.tr,
                        style: interRegular.copyWith(
                          fontSize: 14,
                          color: selectedIndex == 1
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
                        selectedIndex = 2;
                      });
                    },
                    child: Container(
                      height: 40,
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
                        'parents_details'.tr,
                        style: interRegular.copyWith(
                          fontSize: 14,
                          color: selectedIndex == 2
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
              height: 20,
            ),
            selectedIndex == 1
                ? /*FutureBuilder<LoginResponse?>(
              future: _loginResponse,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final user = snapshot.data!.user;
                  return*/ Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            height: 35,
                            width: Get.width / 2.6,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                                color: Theme.of(context).primaryColor,
                                boxShadow: [customBoxShadow()]),
                            child: Text(
                              moduleSelected == 'teacher' ? "teacher_details".tr :'student_details'.tr,
                              style: interMedium.copyWith(
                                  fontSize: 14,
                                  color: Theme.of(context).cardColor),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              color: Theme.of(context).cardColor,
                              boxShadow: [customBoxShadow()],
                            ),
                            child: Column(
                              children: [
                                NameWidget(
                                  title: 'name'.tr,
                                  subtitle:/* user.username*/ "${sharedPrefController.userData['user']['firstName'] ?? ''} ${sharedPrefController.userData['user']['lastName'] ?? ''}"
                                ),
                                NameWidget(
                                  title: 'age'.tr,
                                  subtitle:
                                 /* '${user.moreDetails.age} year'*/ "${sharedPrefController.userData['user']['moreDetails']['age'] ?? ''} ",
                                ),
                                NameWidget(
                                  title: 'gender'.tr,
                                  subtitle: /*user.moreDetails.gender*/"${sharedPrefController.userData['user']['moreDetails']['gender'] ?? ''} ",
                                ),
                                NameWidget(
                                  title: 'dob'.tr,
                                  subtitle: /*user.moreDetails.dob*/"${sharedPrefController.userData['user']['moreDetails']['dob'] ?? ''} "
                                      .toString()
                                      .split(' ')[0],
                                ),
                                NameWidget(
                                  title: 'blood_group'.tr,
                                  subtitle:
                                  /*'${user.moreDetails.bloodGrp??"No detail"}',*/"${sharedPrefController.userData['user']['moreDetails']['bloodGrp'] ?? ''} "
                                ),
                                NameWidget(
                                  title: 'category'.tr,
                                  subtitle: /*user
                                      .moreDetails.mediumOfInstruction?? ''*/ "${sharedPrefController.userData['user']['moreDetails']['mediumOfInstruction'] ?? ''} " ,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      20.h,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(
                            visible: moduleSelected=='student',
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              height: 35,
                              width: Get.width / 2.6,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                                  color: Theme.of(context).primaryColor,
                                  boxShadow: [customBoxShadow()]),
                              child: Text(
                                'admission_details'.tr,
                                style: interMedium.copyWith(
                                    fontSize: 14,
                                    color: Theme.of(context).cardColor),
                              ),
                            ),
                          ),
                          Visibility(
                              visible: moduleSelected=='student',
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                  color: Theme.of(context).cardColor,
                                  boxShadow: [customBoxShadow()],
                                ),
                                child: Column(
                                  children: [
                                    // NameWidget(
                                    //   title: 'sr'.tr,
                                    //   subtitle: '352585',
                                    // ),
                                    // NameWidget(
                                    //   title: 'student_id'.tr,
                                    //   subtitle: '23',
                                    // ),
                                    // NameWidget(
                                    //   title: 'admission_type'.tr,
                                    //   subtitle: 'NEW',
                                    // ),
                                    NameWidget(
                                      title: 'admission_no'.tr,
                                      subtitle: user.moreDetails.admissionNo?? '',
                                    ),
                                    NameWidget(
                                      title: 'admission_date'.tr,
                                      subtitle: user.moreDetails.admisionDate
                                          .toString()
                                          .split(' ')[0],
                                    ),
                                    NameWidget(
                                      title: 'register_no'.tr,
                                      subtitle: user.moreDetails.registerNo?? '',
                                    ),
                                    NameWidget(
                                      title: 'enrollment_no'.tr,
                                      subtitle: user.moreDetails.rollNumber?? '',
                                    ),
                                    NameWidget(
                                      title: 'education_medium'.tr,
                                      subtitle: 'English',
                                    ),
                                    NameWidget(
                                      title: 'stream'.tr,
                                      subtitle:
                                      user.moreDetails.streamOfStudy?? '',
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              )
                          ),
                        ],
                      ),
                    ],
                  /*);
                } else {
                  return Text('No user data available');
                }
              },*/

            ) :
            // : selectedIndex == 2
            //     ?
           /* FutureBuilder<LoginResponse?>(
              future: _loginResponse,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final user = snapshot.data!.user;
                  return*/ Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            height: 35,
                            width: Get.width / 2.6,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                                color: Theme.of(context).primaryColor,
                                boxShadow: [customBoxShadow()]),
                            child: Text(
                              'parents_details'.tr,
                              style: interMedium.copyWith(
                                  fontSize: 14,
                                  color: Theme.of(context).cardColor),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              color: Theme.of(context).cardColor,
                              boxShadow: [customBoxShadow()],
                            ),
                            child: Column(
                              children: [
                                NameWidget(
                                  title: 'father_name'.tr,
                                  subtitle: /*user.moreDetails.fatherName*/"${sharedPrefController.userData['user']['moreDetails']['fatherName'] ?? ''} ",
                                ),
                                NameWidget(
                                  title: 'mother_name'.tr,
                                  subtitle: /*user.moreDetails.motherName*/"${sharedPrefController.userData['user']['moreDetails']['motherName'] ?? ''} ",
                                ),
                                Visibility(
                                    visible: moduleSelected=='student',
                                    child: NameWidget(
                                      title: 'other_guardian'.tr,
                                      subtitle: user.moreDetails.guardianName ?? '',
                                    )
                                ),
                                NameWidget(
                                  title: 'contact_number'.tr,
                                  subtitle:
                                  '+${user.moreDetails.emergencyContactNumber}',
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          )
                        ],),
                      /*),
                    ],
                  );
                } else {
                  return Text('No user data available');
                }
              },
            ),*/
          ],
        ),
      ]),
    ));
  }
}
