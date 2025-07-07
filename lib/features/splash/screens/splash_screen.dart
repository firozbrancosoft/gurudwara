import 'package:gurudwara/core/widgets/custom_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/image_constants.dart';
import '../../../core/theme/theme_controller.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../routes/route_helper.dart';
import '../../language/controllers/localization_controller.dart';
import '../controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final splashController = Get.find<SplashController>();
    final themeController = Get.find<ThemeController>();

    return GetBuilder<ThemeController>(
        builder: (themeController) {
      return Scaffold(
        backgroundColor: themeController.isDarkMode
            ? Colors.black
            : Colors.white,

        body: Stack(
          children: [

            // Logo and loading indicator
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  CustomImageWidget(
                    imagePath: ImageConstants.logo,
                    width: 250,
                    height: 250,
                  ),

                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
