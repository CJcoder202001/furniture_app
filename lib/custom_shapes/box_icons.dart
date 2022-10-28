import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class boxIcons extends StatelessWidget {
  final String title;
  final String imageUrl;
  const boxIcons({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03,
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            height: MediaQuery.of(context).size.height * 0.04,
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
