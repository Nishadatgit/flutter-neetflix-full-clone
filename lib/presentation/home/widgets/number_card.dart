import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:project_netflix/core/colors/colors.dart';

import '../../../core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Stack(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 40,
                height: 200,
              ),
              Container(
                width: 150,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: kRadius10,
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/8cXbitsS6dWQ5gfMTZdorpAAzEH.jpg"))),
              ),
            ],
          ),
          Positioned(
            left: index == 1 ? 4 : 20,
            bottom: -30,
            child: BorderedText(
              strokeWidth: 6,
              strokeColor: kWhiteColor.withOpacity(0.8),
              strokeCap: StrokeCap.round,
              strokeJoin: StrokeJoin.miter,
              child: Text(
                (index + 1).toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 140,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
