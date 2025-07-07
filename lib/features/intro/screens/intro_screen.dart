import 'package:gurudwara/core/utils/app_spaces.dart';
import 'package:gurudwara/core/widgets/custom_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/image_constants.dart';
import '../../../core/theme/theme_controller.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../routes/route_helper.dart';
import '../../language/controllers/localization_controller.dart';
import '../controllers/intro_controller.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final introController = Get.find<IntroController>();
    final themeController = Get.find<ThemeController>();

    return GetBuilder<ThemeController>(
        builder: (themeController) {
      return Scaffold(
        backgroundColor: themeController.isDarkMode
            ? Colors.black
            : Colors.white,

        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  CustomImageWidget(
                    imagePath: ImageConstants.logo,
                    width: 300,
                    height: 300,
                  ),
                  100.ph,
                  CustomButton(
                    text: 'Get started',
                    onPressed: (){
                      introController.navigateToNextScreen();

                    },
                    height: 50,
                    width: 280,
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
