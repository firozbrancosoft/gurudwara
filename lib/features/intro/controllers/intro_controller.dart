import 'dart:async';
import 'package:get/get.dart';
import '../../../core/services/storage/shared_prefs.dart';
import '../../../core/constants/app_constants.dart';
import '../../../routes/route_helper.dart';

class IntroController extends GetxController {

  @override
  void onInit() {
    super.onInit();
  }

  void navigateToNextScreen() {
    Get.offAllNamed(RouteHelper.getSignupRoute());
  }

}