import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gurudwara/features/favorite/screen/favorite_screen.dart';
import 'package:gurudwara/features/home/screen/home_screen.dart';
import 'package:gurudwara/features/profile/screen/profile_screen.dart';
import 'package:gurudwara/features/quiz/screen/quiz_screen.dart';
import '../../../core/constants/dimensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/custom_bottom_navigation_bar.dart';
import '../../../features/auth/controllers/auth_controller.dart';
import '../controller/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  final dashboardController = Get.put(DashboardController());
  final authController = Get.find<AuthController>();

  final List<Widget> pages = [
    HomeScreen(),
    QuizScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[dashboardController.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => CustomBottomNavigationBar(
          currentIndex: dashboardController.selectedIndex.value,
          onTap: dashboardController.changeTab,
        ),
      ),
    );
  }
}
