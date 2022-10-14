import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Pages/check_user_data.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class FirebaseController extends GetxController {
  String removeSpecialCharacters(String text) {
    return text.replaceAll("@", "").replaceAll(".", "");
  }

  Future<void> firebaseSignin(String Username, String PhoneNumber,
      String EmailId, String Password, BuildContext context) async {
    final uuid = const Uuid().v4();
    // print("Before signup checkpoint");

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: EmailId, password: Password);

      Get.to(() => const CheckUserData());

      await FirebaseDatabase.instance
          .ref()
          .child("Users")
          .child("Email Sign in")
          .child(removeSpecialCharacters(EmailId))
          .set({
        "unique id": uuid,
        "Username": Username,
        "Phone Number": PhoneNumber,
        "Email Id": EmailId,
        "Password": Password,
        "type": "Email Sign in"
      });
    } catch (error) {
      // print(error.toString());

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        dismissDirection: DismissDirection.down,
        content: AwesomeSnackbarContent(
          title: 'Something Went wrong!',
          message: error.toString(),
          contentType: ContentType.warning,
        ),
      ));
    }
  }
}
