import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../home/widgets/action_button.dart';
import '../../widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    Key? key,
    required this.description,
    required this.movieName,
    required this.posterPath,
  }) : super(key: key);
  final String description;
  final String movieName;
  final String posterPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movieName,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        kHeight,
        Text(
          description,
          style: const TextStyle(
            color: Colors.grey,
          ),
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
        kHeight20,
        kHeight20,
        kHeight,
        VideoWidget(
          imagePath: posterPath,
        ),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            ActionButton(
              title: 'Share',
              icon: Icons.share,
              iconSize: 25,
              textSize: 16,
            ),
            kWidth,
            ActionButton(
              title: 'My List',
              icon: Icons.add,
              iconSize: 25,
              textSize: 16,
            ),
            kWidth,
            ActionButton(
              title: 'Play',
              icon: Icons.play_arrow,
              iconSize: 25,
              textSize: 16,
            ),
            kWidth,
          ],
        )
      ],
    );
  }
}
