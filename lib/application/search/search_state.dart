part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState(
      {required List<SearchResultData> searchResults,
      required List<Downloads> idleList,
      required bool isLoading,
      required bool isError,
      required bool isSearching}) = _SearchState;

  factory SearchState.initial() => const SearchState(
      searchResults: [],
      idleList: [],
      isLoading: false,
      isError: false,
      isSearching: false);
}
