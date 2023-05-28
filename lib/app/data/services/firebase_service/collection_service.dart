import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/app/data/common/widgets/error_snackBar.dart';
import 'package:firebase_project/app/data/common/widgets/success_snackbar.dart';
import 'package:firebase_project/app/data/models/user_model.dart';
import 'package:firebase_project/app/utils/constants.dart';
import 'package:get/get.dart';

class CollectionService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  //Create a Users reference using userModel converter
  final _userRef = _db.collection(Constants.users).withConverter<UserModel>(
        fromFirestore: (snapshot, _) => UserModel.fromJson(
          snapshot.data()!,
        ),
        toFirestore: (users, _) => users.toJson(),
      );

  //Upload Users to firestore
  Future<bool> uploadUserData(String uId, String name, String email) async {
    return await _userRef
        .doc('$uId${name.removeAllWhitespace}')
        .set(UserModel(uId: uId, name: name, email: email))
        .then(
      (_) {
        successSnackBar(Constants.dataUpDated);
        return true;
      },
    ).onError((error, stackTrace) {
      errorSnackBar(Constants.sometingWentWrong);
      return false;
    });
  }
}
