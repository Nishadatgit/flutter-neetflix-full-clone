import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_netflix/core/colors/colors.dart';
import 'package:project_netflix/presentation/main_page/screen_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme:const AppBarTheme(
          backgroundColor: Colors.transparent
        ),
        scaffoldBackgroundColor:backgroundColor,
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.montserrat().fontFamily,
          textTheme: const TextTheme(
              bodyText1: TextStyle(color: Colors.white),
              bodyText2: TextStyle(color: Colors.white))),
      home:  ScreenMainPage(),
    );
  }
}
