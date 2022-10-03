// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';

import 'package:furniture_app/Custom_presets/colors_preset.dart';
import 'package:furniture_app/splash_screen/splash_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

late int? initscreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initscreen = (preferences.getInt("initscreen"));
  await preferences.setInt("initscreen", 1);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(canvasColor: color2, fontFamily: 'Montserrat'),
        home: const SplashScreen());
  }
}
