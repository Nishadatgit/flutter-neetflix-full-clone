import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {},
        style: TextButton.styleFrom(backgroundColor: kWhiteColor),
        icon: const Icon(
          Icons.play_arrow,
          size: 20,
          color: kBlack,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'Play',
            style: TextStyle(
                color: kBlack, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
