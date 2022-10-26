import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_netflix/application/search/search_bloc.dart';
import 'package:project_netflix/core/constants.dart';
import 'package:project_netflix/presentation/search/widgets/search_idle.dart';
import 'package:project_netflix/presentation/search/widgets/search_result.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});
  Timer? _debounce;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              controller: searchController,
              onChanged: (value) {
                _onSearchChanged(value, context);
              },
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey),
              style: const TextStyle(color: Colors.white),
              backgroundColor: Colors.grey.withOpacity(0.4),
            ),
            kHeight,
            Expanded(child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.isSearching == false) {
                  return const SearchIdleWidget();
                } else {
                  return const SearchResultWidget();
                }
              },
            ))
          ],
        ),
      )),
    );
  }

  _onSearchChanged(String query, BuildContext context) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isEmpty) {
        BlocProvider.of<SearchBloc>(context).add(const Initialize());
      } else {
        BlocProvider.of<SearchBloc>(context)
            .add(SearchEvent.searchMovie(movieName: query));
      }
    });
  }
}
