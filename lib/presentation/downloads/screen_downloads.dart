import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_netflix/core/colors/colors.dart';
import 'package:project_netflix/core/constants.dart';
import 'package:project_netflix/presentation/widgets/appbar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final _widgetList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: AppBarWidget(
                title: 'Downloads',
              )),
          body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (ctx, index) => _widgetList[index],
            separatorBuilder: (ctx, index) => const SizedBox(height: 25),
            itemCount: _widgetList.length,
          )),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
  final List<String> imageUrls = [
    "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/8cXbitsS6dWQ5gfMTZdorpAAzEH.jpg",
    "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/zuNOQVI4rEaqwknrfQUVKtlKE2C.jpg",
    "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Indroducing Downloads for you',
          style: TextStyle(
              color: kWhiteColor, fontWeight: FontWeight.bold, fontSize: 23),
          textAlign: TextAlign.center,
        ),
        kHeight,
        const Text(
          "We will download a personalized selection of \nmovies and shows for you, so there's \nalways something to watch on your \ndevice",
          style: TextStyle(fontSize: 16, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        kHeight,
        SizedBox(
          height: size.width - 80,
          width: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.5),
                radius: size.width * .35,
              ),
              DownloadsImageWidget(
                imageUrls: imageUrls[0],
                margin: const EdgeInsets.only(left: 160, top: 20),
                angle: 20,
              ),
              DownloadsImageWidget(
                imageUrls: imageUrls[1],
                margin: const EdgeInsets.only(right: 160, top: 20),
                angle: -20,
              ),
              DownloadsImageWidget(
                imageUrls: imageUrls[2],
                margin: const EdgeInsets.only(bottom: 10, top: 20),
                isMiddle: true,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: kButtonColorBlue,
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Set up',
                style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kHeight,
        SizedBox(
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: kButtonColorWhite,
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'See what you can download',
                style: TextStyle(
                    color: kBlack, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        SizedBox(width: 10),
        Text('Smart Downloads')
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    required this.imageUrls,
    this.angle = 0,
    this.isMiddle = false,
    required this.margin,
  }) : super(key: key);

  final String imageUrls;
  final double angle;
  final EdgeInsets margin;
  final bool isMiddle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          width: isMiddle ? size.width * .43 : size.width * .3,
          height: isMiddle ? size.width * .56 : size.width * .5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(imageUrls), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}