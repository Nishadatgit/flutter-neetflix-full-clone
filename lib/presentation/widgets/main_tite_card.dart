import 'package:flutter/material.dart';

import '../../core/constants.dart';
import 'main_card.dart';
import 'main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitle(title: title),
          kHeight,
          LimitedBox(
            maxHeight: 210,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(10, (index) => const MainCard2()),
            ),
          )
        ],
      ),
    );
  }
}
