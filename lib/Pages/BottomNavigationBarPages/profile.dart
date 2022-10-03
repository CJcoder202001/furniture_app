import 'package:flutter/material.dart';
import 'package:furniture_app/Custom_presets/colors_preset.dart';
import 'package:furniture_app/Pages/BottomNavigationBarPages/ProfileUi/body.dart';

import 'package:furniture_app/Pages/Homepage.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.to(() => const Homepage());
          },
          child: Icon(
            Icons.adaptive.arrow_back,
            color: color6,
          ),
        ),
        title: Text(
          "Profile",
          style: TextStyle(color: color6, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: color2,
      ),
      body: const Body(),
    );
  }
}
