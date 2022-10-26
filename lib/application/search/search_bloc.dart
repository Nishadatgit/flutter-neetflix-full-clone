import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:project_netflix/domain/core/failures/main_failures.dart';
import 'package:project_netflix/domain/downloads/i_downloads_repo.dart';
import 'package:project_netflix/domain/downloads/models/downloads.dart';
import 'package:project_netflix/domain/search/i_search_repo.dart';
import 'package:project_netflix/domain/search/models/search_response/search_response.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo iDownloadsRepo;
  final ISearchRepo iSearchRepo;
  SearchBloc(this.iDownloadsRepo, this.iSearchRepo)
      : super(SearchState.initial()) {
    on<Initialize>((event, emit) async {
      emit(const SearchState(
        searchResults: [],
        idleList: [],
        isLoading: true,
        isError: false,
      ));
      final list = await iDownloadsRepo.getDownloadsImages();
      list.fold((MainFailures f) {
        emit(const SearchState(
          searchResults: [],
          idleList: [],
          isLoading: false,
          isError: true,
        ));
      }, (List<Downloads> d) {
        emit(SearchState(
          searchResults: [],
          idleList: d,
          isLoading: false,
          isError: false,
        ));
      });
    });
    on<SearchMovie>((event, emit) {
      iSearchRepo.searchMovies(movieQuery: event.movieName);
    });
  }
}
