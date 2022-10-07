import 'package:flutter/material.dart';
import 'package:project_netflix/presentation/downloads/widgets/download_shimmer_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width - 80,
      width: size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(0.5),
            radius: size.width * .35,
          ),
          const DownloadShimmerWidget(
            margin: EdgeInsets.only(left: 160, top: 20),
            angle: 20,
          ),
          const DownloadShimmerWidget(
            margin: EdgeInsets.only(right: 160, top: 20),
            angle: -20,
          ),
          const DownloadShimmerWidget(
            margin: EdgeInsets.only(bottom: 10, top: 20),
          )
        ],
      ),
    );
  }
}
