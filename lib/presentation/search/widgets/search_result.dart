import 'package:flutter/material.dart';
import 'package:project_netflix/core/constants.dart';
import 'package:project_netflix/presentation/search/widgets/search_title_widget.dart';

const imageUrl =
    "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/zuNOQVI4rEaqwknrfQUVKtlKE2C.jpg";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitleWidget(text: 'Movies and TV'),
        kHeight,
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: GridView.count(
              // padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1 / 1.4,
              children: List.generate(20, (index) => const MainCard()),
            ),
          ),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image: const DecorationImage(
              image: NetworkImage(imageUrl), fit: BoxFit.cover)),
    );
  }
}
