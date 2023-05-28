import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/app/data/common/widgets/error_snackBar.dart';
import 'package:firebase_project/app/data/common/widgets/success_snackbar.dart';
import 'package:firebase_project/app/utils/constants.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  static final FirebaseAuth _firebaseAuthInstance = FirebaseAuth.instance;
  static final User? user = _firebaseAuthInstance.currentUser;

//Sign in with google using firebase
  Future<UserCredential?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    try {
      if (googleUser != null) {
        // Obtain the auth details from the request
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Once signed in, return the UserCredential
        final userCredentials =
            await _firebaseAuthInstance.signInWithCredential(credential);
        successSnackBar(Constants.successSigned);
        return userCredentials;
      } else {
        errorSnackBar(Constants.failed, Constants.couldNotSigned);
        return null;
      }
    } catch (e) {
      // print(e.toString());
      errorSnackBar('Failed', e.toString());
      return null;
    }
  }

//Sign out from current accout
  logOut() async {
    //SignOut from firebase
    await _firebaseAuthInstance.signOut();

    //SignOut from Google
    await GoogleSignIn().signOut();
  }

//Get current user
  User? getCurrentUser() {
    return _firebaseAuthInstance.currentUser;
  }
}
