
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_netflix/application/downloads/downloads_bloc.dart';
import 'package:project_netflix/core/colors/colors.dart';
import 'package:project_netflix/core/constants.dart';
import 'package:project_netflix/core/strings.dart';
import 'package:project_netflix/presentation/downloads/widgets/downloads_image_widget.dart';
import 'package:project_netflix/presentation/downloads/widgets/loading_widget.dart';
import 'package:project_netflix/presentation/widgets/appbar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final _widgetList = [
    const _SmartDownloads(),
    const Section2(),
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
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });
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
        BlocBuilder<DownloadsBloc, DownloadsState>(builder: (context, state) {
          return state.downloads.isEmpty
              ? const LoadingWidget()
              : SizedBox(
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
                        imageUrls:
                            "$imgBaseUrl${state.downloads[0].posterPath}",
                        margin: const EdgeInsets.only(left: 160, top: 20),
                        angle: 20,
                      ),
                      DownloadsImageWidget(
                        imageUrls:
                            "$imgBaseUrl${state.downloads[1].posterPath}",
                        margin: const EdgeInsets.only(right: 160, top: 20),
                        angle: -20,
                      ),
                      DownloadsImageWidget(
                        imageUrls:
                            "$imgBaseUrl${state.downloads[2].posterPath}",
                        margin: const EdgeInsets.only(bottom: 10, top: 20),
                        isMiddle: true,
                      )
                    ],
                  ),
                );
        }),
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
