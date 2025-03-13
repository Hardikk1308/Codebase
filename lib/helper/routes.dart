import 'package:erp_school/view/screens/onboarding/onboarding_screen.dart';
import 'package:erp_school/view/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class RoutesHelper {
  static const String splash = '/splash';
  static const String onBoardScreen = '/onBoardScreen';

  static String getSplashRoute() => splash;
  static String getonBoardScreen() => onBoardScreen;

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: onBoardScreen, page: () => const OnBoardScreen()),
  ];
}
