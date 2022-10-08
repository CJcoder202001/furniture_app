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
  static final User user = FirebaseAuth.instance.currentUser!;

  String currentIndicator = loadingIndicator;
  @override
  void initState() {
    super.initState();
    print("at initstate before verify email process");
    verifyEmailProcess();
    print("at initstate after verify email process");
  }

  void verifyEmailProcess() async {
    print("inside verify email function");
    await sendVerifyEmail;
    print("inside verify email function after sendverifyemail");
    _timer = Timer.periodic(
        const Duration(seconds: 3), (timer) => isemailverified());
    print("inside verify email function after timer");
  }

  isemailverified() {
    FirebaseAuth.instance.currentUser!.emailVerified
        ? setState(() {
            print("1");
            currentIndicator = doneIndicator;
            print("2");
            Get.to(() => const CheckUserData());
            print("3");
            _timer?.cancel();
            print("4");
          })
        : setState(() {});
  }

  Future<void> get sendVerifyEmail async {
    print("before sending email");
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    print("sending email");
  }

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
          Text(
            user.email!,
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.width * 0.03),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.02),
            child: const Text(
              "Check your email address and verify by clicking the link we send you on your email address",
              textAlign: TextAlign.center,
            ),
          )
        ],
      )),
    );
  }
}
