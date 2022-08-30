import 'package:flutter/material.dart';
import 'package:project_netflix/core/colors/colors.dart';

import '../../core/constants.dart';
import 'widgets/coming_soon.dart';
import 'widgets/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          title: const Text("New & Hot",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
          actions: [
            IconButton(
                iconSize: 30,
                onPressed: () {},
                icon: const Icon(
                  Icons.cast,
                  color: Colors.white,
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.blue,
                  height: 30,
                  width: 30,
                ),
              ],
            ),
            kWidth
          ],
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: TabBar(
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: kWhiteColor),
                unselectedLabelColor: kWhiteColor,
                labelColor: kBlack,
                labelStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                isScrollable: true,
                tabs: [
                  Tab(
                    text: '🍿 Coming soon',
                  ),
                  Tab(
                    text: "👀 Everyone's watching",
                  )
                ]),
          ),
        ),
        body: TabBarView(children: [
          _buildComingSoon(),
          _buildEveryonesWatching(),
        ]),
      ),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(
      itemBuilder: (context, index) => const ComingSoonWidget(),
      itemCount: 5,
      shrinkWrap: true,
    );
  }

  Widget _buildEveryonesWatching() {
    return ListView.builder(
      itemBuilder: (context, index) => const EveryonesWatchingWidget(),
      itemCount: 10,
      shrinkWrap: true,
    );
  }
}

