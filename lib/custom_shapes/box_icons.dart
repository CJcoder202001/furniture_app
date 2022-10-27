import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class boxIcons extends StatelessWidget {
  final double height;
  final String title;
  final String imageUrl;
  const boxIcons(
      {super.key,
      required this.height,
      required this.title,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            height: height,
            color: Colors.orange,
          ),
          Text(
            title,
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.width * 0.03),
          )
        ],
      ),
    );
  }
}
