import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget skeleton(BuildContext context, double height, double width) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        color: Colors.grey, borderRadius: BorderRadius.circular(15)),
  );
}

class shimmereffect extends StatelessWidget {
  const shimmereffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 192, 192, 192),
      highlightColor: const Color.fromARGB(255, 211, 211, 211),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              skeleton(context, MediaQuery.of(context).size.height * 0.23,
                  MediaQuery.of(context).size.width * 0.4),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      skeleton(
                          context,
                          MediaQuery.of(context).size.height * 0.02,
                          MediaQuery.of(context).size.width * 0.25),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      skeleton(
                          context,
                          MediaQuery.of(context).size.height * 0.02,
                          MediaQuery.of(context).size.width * 0.2),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      skeleton(
                          context,
                          MediaQuery.of(context).size.height * 0.02,
                          MediaQuery.of(context).size.width * 0.2),
                    ],
                  ),
                  skeleton(context, MediaQuery.of(context).size.height * 0.025,
                      MediaQuery.of(context).size.width * 0.1),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
