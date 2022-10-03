import 'dart:async';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Custom_presets/Main_naming.dart';
import 'package:furniture_app/Pages/Introductionscreens/Introduction.dart';
import 'package:furniture_app/Pages/check_User_Data.dart';
import 'package:furniture_app/custom_shapes/Intro_screen_clipper_Shape.dart';
import 'package:furniture_app/main.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Connectivity _connectivity = Connectivity();
  ConnectivityResult _connectivityResult = ConnectivityResult.none;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  String connectiontype = "None";

  @override
  void initState() {
    super.initState();

    _checkConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((event) {
      _checkConnectivity();
    });
  }

  @override
  dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> _checkConnectivity() async {
    try {
      _connectivityResult = await _connectivity.checkConnectivity();
      if (_connectivityResult == ConnectivityResult.none) {
        await Future.delayed(const Duration(seconds: 1));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          dismissDirection: DismissDirection.down,
          content: AwesomeSnackbarContent(
            title: 'No internet connection',
            message: 'Connect to a network first',
            contentType: ContentType.warning,
          ),
        ));
      } else {
        connectivitytype(_connectivityResult);
        await Future.delayed(const Duration(seconds: 2));
        Get.to(() => initscreen == 0 || initscreen == null
            ? const IntroductionPage()
            : const CheckUserData());
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'On Snap!',
          message: 'Something went wrong! Try again later',
          contentType: ContentType.failure,
        ),
      ));
    }
  }

  void connectivitytype(ConnectivityResult connectivityresult) {
    if (connectivityresult == ConnectivityResult.mobile) {
      connectiontype = "Mobile";
    } else if (connectivityresult == ConnectivityResult.wifi) {
      connectiontype = "Wifi";
    }
  }

  //Note: Can create a custom lottie animation of a convare belt with computer acessories
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Stack(
            children: [
              ClipPath(
                clipper: Backgroundclipper(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.25),
                  ),
                  height: MediaQuery.of(context).size.height,
                ),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      child: Image.asset(
                        logoLocation,
                        scale: 1,
                      ),
                    ),
                    Lottie.asset("assets/Lottie/Loading_Animation.json",
                        repeat: true,
                        width: MediaQuery.of(context).size.width * 0.5)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
