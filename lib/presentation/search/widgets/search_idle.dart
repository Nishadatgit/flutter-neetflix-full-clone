import 'package:flutter/material.dart';
import 'package:project_netflix/core/colors/colors.dart';
import 'package:project_netflix/core/constants.dart';

import 'search_title_widget.dart';

const imageUrl =
    "http://www.themoviedb.org/t/p/w250_and_h141_face/84XPpjGvxNyExjSuLQe0SzioErt.jpg";

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitleWidget(
          text: 'Top Searches',
        ),
        kHeight,
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 10),
            shrinkWrap: true,
            itemBuilder: (ctx, index) => const TopSearchItemTile(),
            separatorBuilder: (ctx, index) => kHeight20,
            itemCount: 10,
          ),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          height: 65,
          width: screenWidth * 0.35,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover)),
        ),
        kWidth,
        const Expanded(
            child: Text(
          'Movies',
          style: TextStyle(
              color: kWhiteColor, fontWeight: FontWeight.bold, fontSize: 16),
        )),
        const CircleAvatar(
          radius: 25,
          backgroundColor: kWhiteColor,
          child: CircleAvatar(
            backgroundColor: kBlack,
            radius: 23,
            child: Icon(
              Icons.play_arrow,
              color: kWhiteColor,
            ),
          ),
        ),
        kWidth,
      ],
    );
  }
}
