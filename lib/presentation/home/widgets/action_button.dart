import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class ActionButton extends StatelessWidget {
  const ActionButton(
      {Key? key,
      required this.title,
      required this.icon,
      this.iconSize = 25,
      this.textSize = 16})
      : super(key: key);
  final String title;
  final IconData icon;
  final double iconSize;
  final double textSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhiteColor,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(
            color: kWhiteColor,
            fontSize: textSize,
          ),
        )
      ],
    );
  }
}
