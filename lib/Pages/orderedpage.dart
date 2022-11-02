import 'package:flutter/material.dart';
import 'package:furniture_app/Custom_presets/colors_preset.dart';
import 'package:furniture_app/Pages/Homepage.dart';
import 'package:furniture_app/custom_shapes/customappbar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spring/spring.dart';

class OrderedPage extends StatelessWidget {
  const OrderedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              const CustomAppbar(),
              Spring.fadeIn(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/Lottie/your-order-is-confirmed.gif"),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.02),
                        child: Text(
                          "Your Order is confirmed.",
                          style: GoogleFonts.workSans(
                              color: Colors.orange,
                              fontWeight: FontWeight.w900,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.06),
                        ),
                      ),
                      Text(
                        "You will receive your package in few days.",
                        style: GoogleFonts.workSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: MediaQuery.of(context).size.width * 0.03),
                      ),
                      Text(
                        "Thanks for shopping with us.",
                        style: GoogleFonts.workSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: MediaQuery.of(context).size.width * 0.05),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    Get.to(() => const Homepage());
                  },
                  icon: const Icon(Icons.home),
                  label: const Text("Go to homepage"))
            ],
          ),
        ),
      ),
    );
  }
}
