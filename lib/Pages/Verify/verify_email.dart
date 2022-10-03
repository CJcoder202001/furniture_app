import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Pages/check_user_data.dart';
import 'package:get/get.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  //Timer for checking the verification
  Timer? _timer;
  static String loadingIndicator = "assets/images/loading .gif";
  static String doneIndicator = "assets/images/Done .gif";

  String currentIndicator = loadingIndicator;
  @override
  void initState() {
    super.initState();
    verifyEmailProcess();
  }

  void verifyEmailProcess() async {
    await sendVerifyEmail;
    _timer = Timer.periodic(
        const Duration(seconds: 3), (timer) => isemailverified());
  }

  isemailverified() async {

    FirebaseAuth.instance.currentUser!.reload();
    FirebaseAuth.instance.currentUser!.emailVerified
        ? setState(() {
            _timer?.cancel();
            currentIndicator = doneIndicator;

            Get.to(() => const CheckUserData());
          })
        : setState(() {

          });
  }

  Future<void> get sendVerifyEmail async =>
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(currentIndicator),
          const Text(
            "Check your Email address",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
              "Check your email address and verify by clicking the link we send you on your email address")
        ],
      )),
    );
  }
}
