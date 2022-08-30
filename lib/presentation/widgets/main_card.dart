import 'package:flutter/material.dart';

import '../../core/constants.dart';

class MainCard2 extends StatelessWidget {
  const MainCard2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        width: 150,
        height: 210,
        decoration: BoxDecoration(
            borderRadius: kRadius10,
            image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/dHKfsdNcEPw7YIWFPIhqiuWrSAb.jpg"))),
      ),
    );
  }
}
