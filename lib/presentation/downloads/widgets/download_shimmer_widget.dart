import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DownloadShimmerWidget extends StatelessWidget {
  const DownloadShimmerWidget({
    Key? key,
    this.angle = 0,
    required this.margin,
  }) : super(key: key);

  final double angle;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[700]!,
          highlightColor: Colors.grey[400]!,
          child: Container(
            
            width: size.width * .3,
            height: size.width * .5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[700]!,
            ),
          ),
        ),
      ),
    );
  }
}
