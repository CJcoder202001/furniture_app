import 'dart:io';

import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/error-404.gif",
            scale: MediaQuery.of(context).size.width * 0.006,
          ),
          Text(
            "0h Ohh! Something went wrong.",
            style: TextStyle(
                fontWeight: FontWeight.w900,
                decoration: TextDecoration.none,
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.width * 0.04),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Please try after sometime.",
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  decoration: TextDecoration.none,
                  color: Colors.grey,
                  fontSize: MediaQuery.of(context).size.width * 0.03),
            ),
          ),
          ElevatedButton(onPressed: () => exit(0), child: const Text("Exit")),
        ],
      ),
    );
  }
}
