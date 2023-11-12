import 'package:get/get.dart';

import '../view/screens/dashboard/dashboard_screen.dart';
import '../view/screens/onboarding/onboarding_screen.dart';
import '../view/screens/profile/profile_screen.dart';

class RouteHelper {
  static const splash = "/";
  static const onboard = '/onboard';
  static const login = "/login";
  static const signUp = "/signUp";
  static const dashboard = "/dashboard";
  static const forgot = "/forgot";
  static const verification = "/verification";
  static const profile = "/profile";
  static const choice = "/choice";
  static List<GetPage> routes = [
    GetPage(name: onboard, page: () => const OnBoardingScreen()),
    GetPage(name: dashboard, page: () => const DashboardScreen(pageIndex: 0)),
    GetPage(name: profile, page: () => const ProfileScreen()),
  ];
}
