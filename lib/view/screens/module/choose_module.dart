import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/images.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/screens/auth/login_screen.dart';
import 'package:erp_school/view/screens/module/widget/module_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseModuleScreen extends StatefulWidget {
  const ChooseModuleScreen({super.key});

  @override
  State<ChooseModuleScreen> createState() => _ChooseModuleScreenState();
}

class _ChooseModuleScreenState extends State<ChooseModuleScreen> {
  Future<String> _getSelectedSchool() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String selectedSchool =
        prefs.getString('selectedSchool') ?? 'Default School';
    return '$selectedSchool';
  }

  String? savedUsername = "";

  Future<void> _initializeLogin() async {
    // Fetch username from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUsername = prefs.getString('username');
    // Check if username exists in SharedPreferences
    if (savedUsername != null && savedUsername.isNotEmpty) {
      // Fetch login response with saved username
      setState(() {
        savedUsername = savedUsername;
      });
    } else {
      print("No username found in SharedPreferences.");
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initializeLogin();
    _getSelectedSchool();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: Get.height * 0.35,
              width: Get.width,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSecondary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  )),
              child: Center(
                child: Image.asset(
                  Images.modulePng,
                  width: 200, // specify the width
                  height: 200, // specify the height
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // Use FutureBuilder to load the school name
            FutureBuilder<String>(
              future: _getSelectedSchool(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Show loading indicator while fetching
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return Text('No School Selected');
                } else {
                  return Text(
                    snapshot.data!, // This will be the school name
                    style: interMedium.copyWith(
                      fontSize: Dimensions.fontSizeExtraLarge,
                      color: Theme.of(context).primaryColor,
                    ),
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                'module_sub_title'.tr,
                textAlign: TextAlign.center,
                style: interRegular.copyWith(
                  fontSize: Dimensions.fontSizeSmall,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ModuleWidget(
              context: context,
              icon: Images.studentSvg,
              title: 'Student',
              description: 'Access homework, attendance, exams, and more.',
              /*onTap: () async {
                // if (savedUsername!.isNotEmpty) {
                //   Get.to(() => const DashboardScreen());
                //   ;
                // } else {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                // await prefs.setString('student', "Student");
                await prefs.setString('type', "Student");
                type == STUDENT;
                String? type = prefs.getString('type')?.toLowerCase();
                Get.to(
                  () => const LoginScreen(title: 'Student'),
                );
                // }
              },*/
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('type', "student"); // Student type save hoga
                String? type = prefs.getString('type')?.toLowerCase(); // Yeh type ko fetch karega
                print("User type: $type"); // Debugging ke liye

                Get.to(() => const LoginScreen(title: 'student',passScreenType: 'student',));
              },

            ),
            const SizedBox(height: 10),
            ModuleWidget(
              context: context,
              icon: Images.TeacherSvg,
              title: 'Teacher',
              description: 'Manage attendance, assignments, and reports.',
              /*onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                ;
                // await prefs.setString('student', "Teacher");
                await prefs.setString('type', "Teacher");
                Get.to(LoginScreen(title: 'Teacher'));
              },*/
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('type', "teacher"); // Teacher type save hoga
                String? type = prefs.getString('type')?.toLowerCase();
                print("User type: $type");

                Get.to(LoginScreen(title: 'teacher',passScreenType: 'teacher',));
              },

            ),
            const SizedBox(height: 10),
            // ModuleWidget(
            //   context: context,
            //   icon: Images.AdminSvg,
            //   title: 'Admin',
            //   description:
            //       'Manage School, monitor activities, and streamline workflows efficiently.',
            //   onTap: () async {
            //     SharedPreferences prefs = await SharedPreferences.getInstance();
            //
            //     await prefs.setString('student', "Parent");
            //     Get.to(LoginScreen(title: 'Parent'));
            //   },
            // ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
