import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gurudwara/core/utils/app_spaces.dart';
import '../../../core/constants/dimensions.dart';
import '../../../core/constants/image_constants.dart';
import '../../../core/utils/custom_app_bar.dart';
import '../../../core/utils/styles.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_image_widget.dart';
import '../../../core/widgets/custom_loading_overlay.dart';
import '../../../routes/route_helper.dart';
import '../controllers/auth_controller.dart';
import '../widget/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: CustomAppBar(title: 'Login', showBackButton: true),
      body: SafeArea(
        child: Obx(
          () => Stack(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.all(Dimensions.height20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: Dimensions.height30),

                    // Logo
                    Center(
                      child: CustomImageWidget(
                        imagePath: ImageConstants.logo,
                        width: 200,
                      ),
                    ),

                    SizedBox(height: Dimensions.height30),

                    // Form
                    Form(
                      key: authController.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            label: 'Full Name',
                            hintText: 'Enter your name',
                            controller: authController.nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: Dimensions.height15),

                          CustomTextField(
                            label: 'Phone number',
                            hintText: 'Enter your phone no.',
                            controller: authController.mobileController,
                            keyboardType: TextInputType.phone,
                            validator: authController.validateMobile,
                            maxLength: 10,
                          ),

                          SizedBox(height: Dimensions.height45),

                          // Send OTP Button
                          CustomButton(
                            text: 'Send OTP',
                            height: 50,
                            onPressed: () {
                              authController.handleSendOTP(context);
                            },
                            isLoading: authController.isLoading.value,
                            buttonType: ButtonStyleType.filled,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              if (authController.isLoading.value) CustomLoadingOverlay(),
            ],
          ),
        ),
      ),
    );
  }
}
