import 'package:firebase_project/app/data/models/user_model.dart';
import 'package:firebase_project/app/data/services/firebase_service/auth_service.dart';
import 'package:firebase_project/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  late UserModel userModel;
  final firebaseAuthservice = FirebaseAuthService();

  @override
  void onInit() {
    super.onInit();
    //Get the current signed in user
    var user = firebaseAuthservice.getCurrentUser();

    //assign the user to userModel variable
    userModel = UserModel(
        uId: user?.uid ?? '',
        name: user?.displayName ?? '',
        email: user?.email ?? '');
  }

//Logout from the device
  logoutUser() async {
    await firebaseAuthservice.logOut();

    //navigate to login page
    Get.offAllNamed(Routes.LOGIN);
  }
}
