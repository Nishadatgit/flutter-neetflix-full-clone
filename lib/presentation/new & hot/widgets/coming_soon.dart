import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../home/widgets/action_button.dart';
import '../../widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterpath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  final String id;
  final String month;
  final String day;
  final String posterpath;
  final String movieName;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                month,
                style: const TextStyle(fontSize: 20, color: Colors.grey),
              ),
              Text(
                day,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoWidget(
                  imagePath: posterpath,
                ),
                kHeight,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        movieName,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: const [
                        ActionButton(
                          title: 'Remind me',
                          icon: Icons.notifications,
                          iconSize: 20,
                          textSize: 12,
                        ),
                        kWidth,
                        ActionButton(
                          title: 'Info',
                          icon: Icons.info,
                          iconSize: 20,
                          textSize: 12,
                        ),
                        kWidth
                      ],
                    )
                  ],
                ),
                kHeight,
                Text('Coming on $day $month'),
                kHeight,
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ),
        kWidth,
      ],
    );
  }
}
