import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project_netflix/core/colors/colors.dart';

import 'package:project_netflix/core/constants.dart';
import '../widgets/main_tite_card.dart';
import 'widgets/background_card.dart';
import 'widgets/number_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (context, value, _) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: SafeArea(
            child: Stack(
              children: [
                ListView(
                  children: const [
                    BackgroundCard(),
                    kHeight,
                    MainTitleCard(title: 'Released in the past year'),
                    kHeight,
                    MainTitleCard(title: 'Trending Now'),
                    kHeight,
                    MainTitleCard(title: 'Tense Dramas'),
                    kHeight,
                    NumberTitleCard(),
                    kHeight,
                    MainTitleCard(title: 'South Indian Movies'),
                    kHeight,
                  ],
                ),
                value == true
                    ? AnimatedContainer(
                        decoration: BoxDecoration(
                          color: Colors.transparent.withOpacity(.5),
                        ),
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInCubic,
                        width: double.infinity,
                        height: 80,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/netflix-logo.png',
                                  height: 50,
                                  width: 50,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.cast,
                                  color: kWhiteColor,
                                  size: 30,
                                ),
                                kWidth,
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: Colors.blue,
                                ),
                                kWidth
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  'TV Shows',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Movies',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Category',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    : kHeight
              ],
            ),
          ),
        );
      },
    ));
  }
}
