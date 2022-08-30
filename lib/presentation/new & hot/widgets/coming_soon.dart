import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../home/widgets/action_button.dart';
import '../../widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 420,
          width: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                'FEB',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              Text(
                '11',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5),
              )
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 420,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const VideoWidget(),
                Row(
                  children: [
                    const Text(
                      'Tall Girl 2',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -5),
                    ),
                    const Spacer(),
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
                const Text('Coming on friday'),
                kHeight20,
                const Text(
                  'Tall Girl 2',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                kHeight,
                const Text(
                  'Landing the lead in the school musical is a dream come truefor Jodi, until the pressure sends her confidence-and her relationship-into a tailspin',
                  style: TextStyle(
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

