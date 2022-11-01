import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spring/spring.dart';

class ShowIcon extends StatelessWidget {
  final String iconpath;
  final String message;
  const ShowIcon({super.key, required this.iconpath, required this.message});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Center(
      child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Spring.pop(child: Image.asset(iconpath)),
              Text(
                message,
                style: GoogleFonts.workSans(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: MediaQuery.of(context).size.width * 0.05),
              )
            ],
          )),
    ));
  }
}
