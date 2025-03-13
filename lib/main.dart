// import 'package:erp_school/controllers/localisation_controller.dart';
// import 'package:erp_school/helper/routes.dart';
// import 'package:erp_school/themes/light.dart';
// import 'package:erp_school/utils/app_constant.dart';
// import 'package:erp_school/utils/messages.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:erp_school/helper/get_di.dart' as di;
// import 'package:erp_school/utils/shared_preference_util.dart';
//
// import 'constants/fcm_impl.dart';
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//
//   // 🔹 Notification Service Initialize Karein
//   await NotificationService().initialize();
//   Map<String, Map<String, String>> languages = await di.init();
//   await SharedPreferenceUtil.getInstance();
//
//   runApp(MyApp(languages: languages));
// }
//
// class MyApp extends StatefulWidget {
//   final Map<String, Map<String, String>> languages;
//
//   const MyApp({super.key, required this.languages});
//   static final navigatorKey = GlobalKey<NavigatorState>();
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<LocalizationController>(
//       builder: (localisationController) {
//         return GetMaterialApp(
//           theme: light,
//           // home: ExamDetailsScreen(),
//           getPages: RoutesHelper.routes,
//           initialRoute: RoutesHelper.getSplashRoute(),
//           defaultTransition: Transition.topLevel,
//           transitionDuration: const Duration(milliseconds: 500),
//           title: AppConstants.appName,
//           locale: localisationController.locale,
//           debugShowCheckedModeBanner: false,
//           translations: Messages(languages: widget.languages),
//           fallbackLocale: Locale(
//             AppConstants.languages[0].languageCode!,
//             AppConstants.languages[0].countryCode,
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:erp_school/controllers/localisation_controller.dart';
import 'package:erp_school/helper/routes.dart';
import 'package:erp_school/themes/light.dart';
import 'package:erp_school/utils/app_constant.dart';
import 'package:erp_school/utils/messages.dart';
import 'package:erp_school/view/screens/dashboard/DashboradController.dart';
import 'package:erp_school/view/screens/sidebar/side_bar.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:erp_school/helper/get_di.dart' as di;
import 'package:erp_school/utils/shared_preference_util.dart';

import 'constants/fcm_impl.dart';
import 'firebase_options.dart'; // Ensure this file exists!



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //  Firebase Initialize
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // FCM (Firebase Cloud Messaging) Initialize
  // await NotificationService().initialize();


  // Dependency Injection
  Map<String, Map<String, String>> languages = await di.init();

  // Shared Preferences Initialize
  await SharedPreferenceUtil.getInstance();
  Get.put(SharedPrefController());
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // Run the App
  runApp(MyApp(languages: languages));
}
// @pragma("vm:entry-point")
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print("Background Notification Received: ${message.notification?.title}");
// }
class MyApp extends StatefulWidget {
  final Map<String, Map<String, String>> languages;

  const MyApp({super.key, required this.languages});
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
      builder: (localisationController) {
        return GetMaterialApp(
          theme: light,
          getPages: RoutesHelper.routes,
          initialRoute: RoutesHelper.getSplashRoute(),
          defaultTransition: Transition.topLevel,
          transitionDuration: const Duration(milliseconds: 500),
          title: AppConstants.appName,
          locale: localisationController.locale,
          debugShowCheckedModeBanner: false,
          translations: Messages(languages: widget.languages),
          fallbackLocale: Locale(
            AppConstants.languages[0].languageCode!,
            AppConstants.languages[0].countryCode,
          ),
        );
      },
    );
  }
}
