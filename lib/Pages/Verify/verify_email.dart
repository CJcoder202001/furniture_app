import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Custom_presets/colors_preset.dart';
import 'package:furniture_app/Pages/Homepage.dart';
import 'package:get/get.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  //Timer for checking the verification
  Timer? _timer;
  bool canResendEmail = true;
  static String loadingIndicator = "assets/images/loading .gif";
  static String doneIndicator = "assets/images/Done .gif";
  static final User user = FirebaseAuth.instance.currentUser!;

  String currentIndicator = loadingIndicator;
  @override
  void initState() {
    super.initState();
    verifyEmailProcess();
  }

  void verifyEmailProcess() async {
    await sendVerifyEmail();
    _timer = Timer.periodic(
        const Duration(seconds: 3), (timer) => isemailverified());
  }

  isemailverified() {
    FirebaseAuth.instance.currentUser!.emailVerified
        ? setState(() {
            currentIndicator = doneIndicator;
            canResendEmail = false;

            _timer?.cancel();
          })
        : FirebaseAuth.instance.currentUser!.reload();
  }

  Future<void> sendVerifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    resendemailprocess();
  }

  resendemailprocess() async {
    print("working");
    setState(() {
      canResendEmail = false;
    });
    await Future.delayed(const Duration(seconds: 30));
    setState(() {
      canResendEmail = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: color1,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(currentIndicator),
            const Text(
              "Check your Email address",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              user.email!,
              style:
                  TextStyle(fontSize: MediaQuery.of(context).size.width * 0.03),
            ),
            canResendEmail
                ? ElevatedButton.icon(
                    onPressed: () async {
                      await sendVerifyEmail();
                    },
                    icon: const Icon(Icons.email),
                    label: const Text("Resend email"))
                : Container(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.height * 0.02),
              child: const Text(
                "Check your email address and verify by clicking the link we send you on your email address",
                textAlign: TextAlign.center,
              ),
            ),
            currentIndicator == doneIndicator
                ? ElevatedButton.icon(
                    onPressed: () {
                      Get.to(() => const Homepage());
                    },
                    icon: const Icon(Icons.home),
                    label: const Text("Go to homepage"))
                : Container(),
          ],
        )),
      ),
    );
  }
}
