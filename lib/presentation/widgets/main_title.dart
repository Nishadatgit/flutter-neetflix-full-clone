import 'package:flutter/material.dart';
import 'package:project_netflix/core/colors/colors.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,style: const TextStyle(color: kWhiteColor,fontSize: 22,fontWeight: FontWeight.bold),);
  }
}
