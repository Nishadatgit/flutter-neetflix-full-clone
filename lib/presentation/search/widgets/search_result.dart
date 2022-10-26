import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_netflix/application/search/search_bloc.dart';
import 'package:project_netflix/core/constants.dart';
import 'package:project_netflix/core/strings.dart';
import 'package:project_netflix/presentation/search/widgets/search_title_widget.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitleWidget(text: 'Movies and TV'),
        kHeight,
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.searchResults.isNotEmpty) {
                  return GridView.count(
                    // padding: const EdgeInsets.all(10),
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1 / 1.4,
                    children:
                        List.generate(state.searchResults.length, (index) {
                      return MainCard(
                        image: state.searchResults[index].posterPath == null
                            ? "https://t4.ftcdn.net/jpg/04/00/24/31/360_F_400243185_BOxON3h9avMUX10RsDkt3pJ8iQx72kS3.jpg"
                            : "$imgBaseUrl${state.searchResults[index].posterPath}",
                      );
                    }),
                  );
                } else if (state.isLoading == true) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.isError == true) {
                  return const Center(child: Text("Error occured"));
                } else if (state.searchResults.isEmpty) {
                  return const Center(child: Text("No results found"));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image:
              DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
    );
  }
}
