import 'dart:io';

import 'package:flutter/material.dart';
import 'package:furniture_app/Pages/BottomNavigationBarPages/Home.dart';
import 'package:furniture_app/Pages/BottomNavigationBarPages/Store.dart';
import 'package:furniture_app/Pages/BottomNavigationBarPages/profile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentPage = 0;

  List pages = const [Home(), Store(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          exit(0);
        },
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            bottomNavigationBar: BottomNavigationBar(
              iconSize: MediaQuery.of(context).size.width * 0.07,
              fixedColor: Colors.orange,
              onTap: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              currentIndex: currentPage,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.store),
                  label: 'Store',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'profile',
                ),
              ],
            ),
            body: pages[currentPage]),
      ),
    );
  }
}
