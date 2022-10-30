import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Pages/Homepage.dart';
import 'package:furniture_app/Pages/Login/Signup/login_screen.dart';

import 'package:furniture_app/Pages/error.dart';

import 'Verify/verify_email.dart';

class CheckUserData extends StatefulWidget {
  const CheckUserData({super.key});

  @override
  State<CheckUserData> createState() => _CheckUserDataState();
}

class _CheckUserDataState extends State<CheckUserData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // print("Snapshot is waiting checkpoint");
            return const CircularProgressIndicator.adaptive();
          }
          if (snapshot.hasError) {
            // print("Snapshot has error checkpoint");
            return const ErrorPage();
          }
          if (snapshot.hasData) {
            // print("Snapshot has data checkpoint");
            FirebaseAuth.instance.currentUser!.reload();

            Widget widget = FirebaseAuth.instance.currentUser!.emailVerified
                ? const Homepage()
                : const VerifyEmail();

            return widget;
          }

          return const Login_screen();
        },
      ),
    );
  }
}
