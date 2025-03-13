import 'dart:convert';

import 'package:erp_school/data/models/response/login_response.dart';
import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/images.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:erp_school/view/base/custom_button.dart';
import 'package:erp_school/view/screens/student/student_details.dart';
import 'package:erp_school/view/screens/student/widget/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/shared_preference_util.dart';
import '../../../utils/styles.dart';
import '../dashboard/DashboradController.dart';

class StudentProfileScreen extends StatefulWidget {
  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> with WidgetsBindingObserver {
  // Future<LoginResponse?>? _loginResponse; // Use nullable Future
  // final LoginService _loginService = LoginService();
  // String? selectedModule="";
  // Future<void> _initializeLogin() async {
  //   // Fetch username from SharedPreferences
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? savedUsername = prefs.getString('username');
  //   selectedModule = prefs.getString('type');
  //   print('savedUsername from prefs $savedUsername and selected module is $selectedModule');
  //
  //   // Check if username exists in SharedPreferences
  //   if (savedUsername != null && savedUsername.isNotEmpty) {
  //     // Fetch login response with saved username
  //     setState(() {
  //       // _loginResponse = _loginService.fetchStudentDetail(
  //       //   context: context,
  //       //   type: selectedModule as String,
  //       //   username: savedUsername,
  //       // );
  //     });
  //     print("The login responsesdfsdf - student: ${_loginResponse}");
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
    selectedModule = prefs.getString('type');
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

  // @override
  // void initState() {
  //   super.initState();
  //
  //   _initializeLogin();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: CustomAppBar(
        title: selectedModule == 'teacher' ? "teacher_profile".tr : 'student_profile'.tr,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 160,
              child: Stack(
                children: [
                  Container(
                    height: 90,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSecondary,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: Get.width * 0.1,
                    right: Get.width * 0.1,
                    child: Center(
                      child: Align(
                          alignment: Alignment.center,
                          child: ClipOval(
                            child: Image.asset(
                              Images.profilePng,
                              height: 120,
                              width: 120,
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            // FutureBuilder<LoginResponse?>(
            //   future: _loginResponse,
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return CircularProgressIndicator(
            //         color: Colors.blue,
            //       );
            //     } else if (snapshot.hasError) {
            //       return Text('Error: ${snapshot.error}');
            //     } else if (snapshot.hasData) {
            //       final user = snapshot.data!.user;
                  /*return*/ Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Obx(() =>   Text(
                        //   "${sharedPrefController.userData['user']['firstName'] ?? ''} ${sharedPrefController.userData['user']['lastName'] ?? ''} ", /*loginResponse?.user.username ?? '',*/
                        //   style: interMedium.copyWith(
                        //       color: Theme.of(context).disabledColor,
                        //       fontSize: 16,
                        //       overflow: TextOverflow.ellipsis
                        //   ),
                        //   maxLines: 1,
                        // ),),
                        ProfileDetail(
                          icon: Icons.person,
                          title: selectedModule == 'teacher' ? "teacher_name".tr : 'student_name'.tr,
                          value: "${sharedPrefController.userData['user']['firstName'] ?? ''} ${sharedPrefController.userData['user']['lastName'] ?? ''} ",
                          titleColor: Theme.of(context).primaryColor,
                        ),
                        Visibility(
                          visible: selectedModule == 'student',
                          child: ProfileDetail(
                              icon: Icons.person,
                              title: 'grade'.tr,
                              value:
                              '${user.moreDetails.grade} , ${user.moreDetails.section}',
                              titleColor: Theme.of(context).primaryColor,
                            ),

                        ),
                        Visibility(
                          visible: selectedModule == 'student',
                          child:  ProfileDetail(
                            icon: Icons.person,
                            title: 'roll_number'.tr,
                            value: user.moreDetails.rollNumber?? '',
                            titleColor: Theme.of(context).primaryColor,
                          ),
                        ),
                        ProfileDetail(
                          icon: Icons.email,
                          title: 'email'.tr,
                          value: /*user.moreDetails.email*/ "${sharedPrefController.userData['user']['email'] ?? ''}  ",
                        ),
                        ProfileDetail(
                          icon: Icons.phone,
                          title: 'phone_number'.tr,
                          value: "+${user.moreDetails.whatsAppNumber}",
                        ),
                        ProfileDetail(
                          icon: Icons.my_location_rounded,
                          title: 'address'.tr,
                          value:/* user.moreDetails.address*/ "${sharedPrefController.userData['user']['moreDetails']['address'] ?? ''}  ",
                        ),

                //} /*else {
                 // return Text('No user data available');
              //  }
             // },*/
            // ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomButton(
                  height: 50,
                  color: true,
                  radius: 50,
                  fontSize: 16,
                  title: 'view_more_details'.tr,
                  onPressed: () {
                    Get.to(StudentDetailsScreen());
                  }),
            ),
            50.h,
          ],
        ),
      // ),
    )])));
  }
}