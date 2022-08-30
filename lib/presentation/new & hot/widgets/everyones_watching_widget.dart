import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../home/widgets/action_button.dart';
import '../../widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Friends',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        kHeight,
        const Text(
          'This hit sitcom follows the merry misadventures of six 20-something pals as they navigate the pitfalls of work, life and lovein 1990s Manhattan',
          style: TextStyle(
            color: Colors.grey,
          ),
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
        kHeight20,
        kHeight20,
        kHeight,
        const VideoWidget(),
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
