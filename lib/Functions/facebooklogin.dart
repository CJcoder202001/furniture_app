import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class Facebookcontroller extends GetxController {
  facebookLogin(BuildContext context) async {
    final uuid = const Uuid().v4();
    try {
      final result =
          await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
      if (result.status == LoginStatus.success) {
        final userData = await FacebookAuth.i.getUserData();
        final facebookAuthCredential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);
        //     await FirebaseDatabase.instance
        //     .ref()
        //     .child("Users")
        //     .child("Facebook Sign in")
        //     .child(removeSpecialCharacters(userData.))
        //     .set({
        //   "unique id": uuid,
        //   "Username": userData.displayName,
        //   "Phone Number": "",
        //   "Email Id": userData.email,
        //   "type": "Facebook Sign in"
        // });
        // Get.to(() => const CheckUserData());
      }
    } catch (error) {}
  }
}
