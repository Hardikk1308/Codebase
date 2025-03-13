// import 'dart:async';
//
// import 'package:erp_school/helper/routes.dart';
// import 'package:erp_school/utils/images.dart';
// import 'package:erp_school/view/screens/auth/login_screen.dart';
// import 'package:erp_school/view/screens/module/select_school_screen.dart';
// import 'package:erp_school/view/screens/onboarding/onboarding_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:is_first_run/is_first_run.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../../services/login_service.dart';
// import '../dashboard/dashboard_screen.dart';
// import '../parents/parents_screen.dart';
// import '../teacher/teacher_screen.dart';
// import '../teacher/view_dairy_screen.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   onInit() async {
//     bool firstRun = await IsFirstRun.isFirstRun();
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var title = await prefs.getString('student');
//     await Future.delayed(const Duration(seconds: 2));
//     if (firstRun == true) {
//       Timer(const Duration(seconds: 1), () {
//         Get.toNamed(RoutesHelper.getonBoardScreen());
//       });
//     } else {
//       if (prefs.containsKey('username')) {
//         switch (prefs.getString('type')?.toLowerCase()) {
//           case 'student':
//             Get.offAll(() => const DashboardScreen());
//             break;
//           case 'parent':
//             Get.offAll(() => ParentsScreen());
//             break;
//           default:
//             Get.offAll(() => TeacherScreen());
//         }
//       } else {
//         if (!prefs.containsKey('selectedSchoolId')) {
//           Get.offAll(() => const SelectSchoolScreen());
//           return;
//         }
//         Navigator.pushReplacement(
//           context,
//           // MaterialPageRoute(builder: (context) => ViewDairyScreen()),
//           MaterialPageRoute(builder: (context) => LoginScreen(title: title.toString()),
//           ),
//         );
//       }
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     onInit();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).cardColor,
//       body: Center(
//         child: Image.asset(
//           Images.logo,
//           width: 250,
//           height: 250,
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';

import 'package:erp_school/helper/routes.dart';
import 'package:erp_school/utils/images.dart';
import 'package:erp_school/view/screens/module/select_school_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dashboard/dashboard_screen.dart';
import '../module/choose_module.dart';
import '../parents/parents_screen.dart';
import '../teacher/teacher_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  onInit() async {
    bool firstRun = await IsFirstRun.isFirstRun();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var title = await prefs.getString('student');
    await Future.delayed(const Duration(seconds: 2));
    if (firstRun == true) {
      Timer(const Duration(seconds: 1), () {
        Get.toNamed(RoutesHelper.getonBoardScreen());
      });
    } else {
      if (prefs.containsKey('username')) {
        switch (prefs.getString('type')?.toLowerCase()) {
          case 'student':
            Get.offAll(() =>  DashboardScreen());
            break;
          case 'parent':
            Get.offAll(() => ParentsScreen());
            break;
          default:
            Get.offAll(() => TeacherScreen());
        }
      } else {
        if (!prefs.containsKey('selectedSchoolId')) {
          Get.offAll(() => const SelectSchoolScreen());
          return;
        }
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ChooseModuleScreen()
          // MaterialPageRoute(builder: (context) => LoginScreen(title: title.toString()),
          ),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: Center(
        child: Image.asset(
          Images.logo,
          width: 250,
          height: 250,
        ),
      ),
    );
  }
}
