import 'package:flutter/material.dart';
import 'package:project_netflix/presentation/downloads/screen_downloads.dart';
import 'package:project_netflix/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:project_netflix/presentation/home/screen_home.dart';
import 'package:project_netflix/presentation/main_page/widgets/bottom_nav.dart';
import 'package:project_netflix/presentation/new%20&%20hot/screen_new_and_hot.dart';
import 'package:project_netflix/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});
  final _pages = [
   const ScreenHome(),
  const  ScreenNewAndHot(),
  const  ScreenFastLaugh(),
   const ScreenSearch(),
    ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int newIndex, _) {
            return _pages[newIndex];
          }),
      bottomNavigationBar:const BottomNAvigationWidget(),
    );
  }
}
