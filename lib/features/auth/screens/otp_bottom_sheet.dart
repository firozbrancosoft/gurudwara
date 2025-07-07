import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gurudwara/core/constants/dimensions.dart';
import 'package:gurudwara/core/utils/app_spaces.dart';
import 'package:gurudwara/core/widgets/custom_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../controllers/auth_controller.dart';

class OtpBottomSheet extends StatelessWidget {
  final AuthController authController;

  const OtpBottomSheet({
    Key? key,
    required this.authController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Handle bar
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              10.ph,
              // Title
              Text(
                'Verify OTP',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                  fontFamily: 'Inter',
                ),
                textAlign: TextAlign.center,
              ),
              5.ph,

              // Subtitle
              Text(
                'We have sent a verification code to\n${authController.currentMobile.value}',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                  fontFamily: 'Inter',
                ),
                textAlign: TextAlign.center,
              ),
              10.ph,
              // OTP Input (4-digit)
              Container(
                margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  controller: authController.otpController,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 45,
                    fieldWidth: 45,
                    activeFillColor: Colors.white,
                    selectedColor: colorScheme.primary,
                    activeColor: colorScheme.primary,
                    selectedFillColor: Colors.white,
                    inactiveColor: Colors.grey[300]!,
                    inactiveFillColor: Colors.white,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: true,
                  onCompleted: (value) {
                    _handleVerifyOTP(context);
                  },
                  onChanged: (value) {},
                ),
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Haven’t received the OTP yet?',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                      fontFamily: 'Inter',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    onPressed: () => _handleResendOTP(context),
                    child: Text(
                      'Resend OTP',
                      style: TextStyle(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                ],
              ),
              15.ph,

              Obx(()=>CustomButton(
                  text: 'Verify OTP',
                  isLoading: authController.isLoading.value,

                onPressed: () => _handleVerifyOTP(context),
              )),


              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  void _handleVerifyOTP(BuildContext context) async {
    await authController.verifyOtp();
    if (!authController.isLoading.value && authController.currentUser.value != null) {
      Navigator.of(context).pop();
    }
  }

  void _handleResendOTP(BuildContext context) async {
    await authController.signup();
  }
}
