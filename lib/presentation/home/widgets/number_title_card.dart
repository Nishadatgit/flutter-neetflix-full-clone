import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../widgets/main_title.dart';
import 'number_card.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MainTitle(title: 'Top 10 TV shows in India today'),
          kHeight,
          LimitedBox(
            maxHeight: 210,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  10,
                  (index) => NumberCard(
                        index: index,
                      )),
            ),
          )
        ],
      ),
    );
  }
}
