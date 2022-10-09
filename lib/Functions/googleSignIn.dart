import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:furniture_app/Pages/check_User_Data.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uuid/uuid.dart';

class GoogleSignInController extends GetxController {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  RxInt value = 0.obs;

  Future<void> googleLogIn() async {
    final uuid = const Uuid().v4();

    final googleuser = await googleSignIn.signIn();
    if (googleuser == null) return;
    _user = googleuser;
    await checkIsUserSignedIn();

    final googleAuth = await googleuser.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    await FirebaseAuth.instance.signInWithCredential(credential);

    Get.to(() => const CheckUserData());
  }

  checkIsUserSignedIn() async {}

  Future<void> googlesignIn() async {
    final uuid = const Uuid().v4();

    final googleuser = await googleSignIn.signIn();
    if (googleuser == null) return;
    _user = googleuser;

    final googleAuth = await googleuser.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    await FirebaseAuth.instance.signInWithCredential(credential);
    await FirebaseDatabase.instance
        .ref()
        .child("Users")
        .child("Google Sign in")
        .child(removeSpecialCharacters(user.email))
        .set({
      "unique id": uuid,
      "Username": user.displayName,
      "Phone Number": "",
      "Email Id": user.email,
      "type": "Google Sign in"
    });
    Get.to(() => const CheckUserData());
  }
}

String removeSpecialCharacters(String text) {
  return text.replaceAll("@", "").replaceAll(".", "");
}
