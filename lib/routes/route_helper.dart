import 'package:get/get.dart';
import 'package:gurudwara/features/GurudwaraDetails/screen/gurudwara_details_screen.dart';
import 'package:gurudwara/features/intro/screens/intro_screen.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/dashboard/screens/dashboard_screen.dart';
import '../features/profile/screen/profile_screen.dart';
import '../features/splash/screens/splash_screen.dart';
import 'app_routes.dart';

class RouteHelper {
  static String getSplashRoute() => AppRoutes.splash;
  static String getIntroRoute() => AppRoutes.intro;
  static String getSignupRoute() => AppRoutes.signup;
  static String getDashboardRoute() => AppRoutes.dashboard;
  static String getRewardHistoryRoute() => AppRoutes.rewardsHistory;
  static String getTotalPointsRoute() => AppRoutes.totalPoints;
  static String getHistoryRoute() => AppRoutes.history;
  static String getGuruDwaraRoute() => AppRoutes.gurudwaraDetails;

  static List<GetPage> routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.intro,
      page: () => const IntroScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignUpScreen(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: AppRoutes.dashboard,
      page: () =>  DashboardScreen(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: AppRoutes.rewardsHistory,
      page: () => const RewardsHistoryScreen(), // Create this screen
    ),
    GetPage(
      name: AppRoutes.totalPoints,
      page: () => const TotalPointsScreen(), // Create this screen
    ),
    GetPage(
      name: AppRoutes.history,
      page: () => const HistoryScreen(), // Create this screen
    ),

    GetPage(
      name: AppRoutes.gurudwaraDetails,
      page: () => const GurudwaraDetailsScreen(),
    ),

  ];
}