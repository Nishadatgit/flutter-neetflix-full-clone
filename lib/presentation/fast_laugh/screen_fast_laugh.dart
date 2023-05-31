import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:project_netflix/presentation/fast_laugh/widgets/video_list_item.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((t) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
    });
    return Scaffold(body: SafeArea(
      child: BlocBuilder<FastLaughBloc, FastLaughState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.isError) {
            const Center(child: Text("Error"));
          } else if (state.downloads.isEmpty) {
            return const Center(child: Text("Error"));
          }
          return PageView(
            scrollDirection: Axis.vertical,
            children: List.generate(
              state.downloads.length,
              (index) => VideoListItemInheritedWidget(
               
                widget: VideoListItem(
                  index: index,
                  key: Key(index.toString()),
                  
                ),
                movieData: state.downloads[index],
              ),
            ),
          );
        },
      ),
    ));
  }
}
