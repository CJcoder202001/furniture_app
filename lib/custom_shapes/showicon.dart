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
        color: Colors.transparent,
        child: Center(
          child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spring.bubbleButton(child: Image.asset(iconpath)),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.workSans(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: MediaQuery.of(context).size.width * 0.05),
                  )
                ],
              )),
        ));
  }
}
