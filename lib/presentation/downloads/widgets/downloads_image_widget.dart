import 'dart:math';

import 'package:flutter/material.dart';

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    required this.imageUrls,
    this.angle = 0,
    this.isMiddle = false,
    required this.margin,
  }) : super(key: key);

  final String imageUrls;
  final double angle;
  final EdgeInsets margin;
  final bool isMiddle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          width: isMiddle ? size.width * .43 : size.width * .3,
          height: isMiddle ? size.width * .56 : size.width * .5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(imageUrls), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
