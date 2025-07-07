
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:gurudwara/core/utils/custom_app_bar.dart';
import '../../../core/constants/app_constants.dart';
import '../../webview/screen/webview_screen.dart';
import '../controller/profile_controller.dart';
import '../widget/profile_menu_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final  controller = Get.find<ProfileController>();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: CustomAppBar(title: "Profile",showBackButton: false,centerTitle: true,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Obx(() => Text(
                      controller.userName.value,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Menu Items
            ProfileMenuItem(
              icon: Icons.card_giftcard,
              title: 'Rewards History',
              onTap: () => Get.toNamed('/rewards-history'),
            ),

            ProfileMenuItem(
              icon: Icons.info_outline,
              title: 'About',
              onTap: () => Get.to(() =>  WebViewScreen(
                title: 'About',
                url: AppConstants.privacyPolicyPageUrl,
              )),
            ),

            ProfileMenuItem(
              icon: Icons.credit_card,
              title: 'Total Points',
              onTap: () => Get.toNamed('/total-points'),
            ),

            ProfileMenuItem(
              icon: Icons.history,
              title: 'History',
              onTap: () => Get.toNamed('/history'),
            ),

            ProfileMenuItem(
              icon: Icons.description,
              title: 'Terms & Conditions',
              onTap: () => Get.to(() =>  WebViewScreen(
                title: 'Terms & Conditions',
                url: AppConstants.termAndConditionPageUrl,
              )),
            ),

            ProfileMenuItem(
              icon: Icons.privacy_tip,
              title: 'Privacy & Policy',
              onTap: () => Get.to(() =>  WebViewScreen(
                title: 'Privacy Policy',
                url: AppConstants.privacyPolicyPageUrl,
              )),
            ),

            ProfileMenuItem(
              icon: Icons.logout,
              title: 'Log out',
              onTap: () => controller.logout(),
              iconColor: Colors.red,
            ),

            const SizedBox(height: 40),

            // Logo
            Container(
              width: 120,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'LOGO',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}









class RewardsHistoryScreen extends StatelessWidget {
  const RewardsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rewards History'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('Rewards History Screen'),
      ),
    );
  }
}


class TotalPointsScreen extends StatelessWidget {
  const TotalPointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Total Points'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('Total Points Screen'),
      ),
    );
  }
}

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('History Screen'),
      ),
    );
  }
}

