import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:project_netflix/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:project_netflix/core/colors/colors.dart';
import 'package:project_netflix/core/strings.dart';

import '../../core/constants.dart';
import '../fast_laugh/coming_soon_detail_view.dart';
import 'widgets/coming_soon.dart';
import 'widgets/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          title: const Text("New & Hot", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
          actions: [
            IconButton(
                iconSize: 30,
                onPressed: () {},
                icon: const Icon(
                  Icons.cast,
                  color: Colors.white,
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.blue,
                  height: 30,
                  width: 30,
                ),
              ],
            ),
            kWidth
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: TabBar(
                splashBorderRadius: BorderRadius.circular(20),
                indicator: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)), color: kWhiteColor),
                unselectedLabelColor: kWhiteColor,
                labelColor: kBlack,
                labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                isScrollable: true,
                tabs: const [
                  Tab(
                    text: '🍿 Coming soon',
                  ),
                  Tab(
                    text: "👀 Everyone's watching",
                  )
                ]),
          ),
        ),
        body: const TabBarView(children: [
          ComingSoonList(key: Key('coming_soon')),
          EveryoneIsWatchingList(key: Key('everyone_is_watching')),
        ]),
      ),
    );
  }
}

class EveryoneIsWatchingList extends StatelessWidget {
  const EveryoneIsWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const HotAndNewEvent.loadDataInEveryoneIsWatching());
    });
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.isError) {
          return const Center(child: Text('Error occured'));
        } else if (state.everyOnesWatchingList.isEmpty) {
          return const Center(child: Text('No data'));
        }
        return ListView.builder(
          key: const PageStorageKey('everyone_is_watching'),
          itemBuilder: (context, index) {
            final movie = state.everyOnesWatchingList[index];
            return EveryonesWatchingWidget(
              movieName: movie.originalName ?? "No title",
              description: movie.overview ?? "No overview",
              posterPath: "$imgBaseUrl${movie.posterPath}",
            );
          },
          itemCount: state.everyOnesWatchingList.length,
          shrinkWrap: true,
        );
      },
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const HotAndNewEvent.loadDataIncomingSoon());
    });
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.isError) {
          return const Center(child: Text("Error Occured"));
        } else if (state.comingSoonList.isEmpty) {
          return const Center(
            child: Text("No data found"),
          );
        } else {
          return ListView.separated(
            key: const PageStorageKey('coming_soon_list'),
            separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(color: Colors.grey),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemBuilder: (context, index) {
              final movie = state.comingSoonList[index];
              String month = "";

              String day = "";
              if (movie.releaseDate != null) {
                day = movie.releaseDate!.split('-').toList()[1].trim();
                try {
                  final parsedDate = DateTime.parse(movie.releaseDate!);
                  month = DateFormat.yMMMMd('en_US').format(parsedDate).split(' ').first.substring(0, 3);
                } catch (e) {
                  log(e.toString());
                }
              }
              if (movie.id == null) return const SizedBox.shrink();
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ComingSoonDetailView(
                          image: "$imgBaseUrl${movie.posterPath}",
                        ),
                      ));
                },
                child: ComingSoonWidget(
                  id: movie.id!.toString(),
                  day: day,
                  description: movie.overview ?? "",
                  posterpath: "$imgBaseUrl${movie.posterPath}",
                  movieName: movie.title ?? "No title",
                  month: month,
                ),
              );
            },
            itemCount: state.comingSoonList.length,
            shrinkWrap: true,
          );
        }
      },
    );
  }
}
