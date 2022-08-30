import 'package:flutter/material.dart';

import 'package:project_netflix/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Expanded(
            child: Text(title,
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900))),
        IconButton(
            iconSize: 30,
            onPressed: () {},
            icon: const Icon(
              Icons.cast,
              color: Colors.white,
            )),
        Container(
          color: Colors.blue,
          height: 30,
          width: 30,
        ),
        kWidth
      ],
    );
  }
}
