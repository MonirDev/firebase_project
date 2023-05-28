import 'package:firebase_project/app/data/services/firebase_service/auth_service.dart';
import 'package:firebase_project/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(FirebaseAuthService().getCurrentUser() != null
          ? Routes.BOTTOM_BAR
          : Routes.LOGIN);
    });
  }
}
