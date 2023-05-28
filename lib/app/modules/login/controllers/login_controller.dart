import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/app/data/common/widgets/loader_widget.dart';
import 'package:firebase_project/app/data/services/firebase_service/auth_service.dart';
import 'package:firebase_project/app/data/services/firebase_service/collection_service.dart';
import 'package:firebase_project/app/routes/app_pages.dart';
import 'package:firebase_project/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var emailTextEditingController = TextEditingController().obs;
  var passwordTextEditingController = TextEditingController().obs;

  var validateEmailText = ''.obs;
  var validatePassText = ''.obs;
  var isValidEmail = true.obs;
  var isPassEmpty = false.obs;
  var isPassSecure = true.obs;

  static final FirebaseAuth firebaseAuthInstance = FirebaseAuth.instance;
  // static final User? user = firebaseAuthInstance.currentUser;

  //create a instance of FirebaseAuthService class
  final firebaseAuthservice = FirebaseAuthService();

  //create a instance of FirebaseCollectionService class
  final collectionservice = CollectionService();

  @override
  void onInit() {
    super.onInit();
  }

//go Sign Up page
  goSignupPage() {
    // Get.offNamed(Routes.signUp);
  }

//go Forget password page
  goForgetPasswordPage() {
    // Get.toNamed(Routes.forgotPassword);
  }

//Email validation
  void validateEmail(String value) {
    if (value == "") {
      validateEmailText.value = Constants.emailRequired;
      isValidEmail.value = false;
    } else if (!GetUtils.isEmail(value)) {
      validateEmailText.value = Constants.emailInvalid;
      isValidEmail.value = false;
    } else {
      validateEmailText.value = "";
      isValidEmail.value = true;
    }
  }

//Login with google
  loginWithGoogle() async {
    loaderOverlay();
    final userCredentials = await firebaseAuthservice.signInWithGoogle();

    if (userCredentials != null) {
      //upload user data in db
      await collectionservice
          .uploadUserData(
              userCredentials.user!.uid,
              userCredentials.user!.displayName!,
              userCredentials.user?.email ??
                  userCredentials.user!.providerData[0].email!)
          .then((isSuccess) {
        //Navigate to home page
        if (isSuccess) Get.offAllNamed(Routes.BOTTOM_BAR);
      });
    }
  }
}
