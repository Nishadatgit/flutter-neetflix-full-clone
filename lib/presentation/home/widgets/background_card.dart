import 'package:flutter/material.dart';
import 'package:project_netflix/core/colors/colors.dart';

import 'action_button.dart';
import 'play_button.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 500,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images-na.ssl-images-amazon.com/images/I/81x9k6dyIML._RI_.jpg"),
                  fit: BoxFit.cover)),
        ),
        Container(
          height: 500,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [kBlack, Colors.transparent, kBlack],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        Positioned(
          bottom: 10,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              ActionButton(
                title: 'My List',
                icon: Icons.add,
              ),
              PlayButton(),
              ActionButton(title: 'Info', icon: Icons.info_outline)
            ],
          ),
        )
      ],
    );
  }
}
