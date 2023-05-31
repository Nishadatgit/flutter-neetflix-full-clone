part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
  const factory HotAndNewState(
      {required List<HotAndNewData> comingSoonList,
      required List<HotAndNewData> everyOnesWatchingList,
      required bool isLoading,
      required bool isError}) = _Initial;

  factory HotAndNewState.intial() =>
      const HotAndNewState(comingSoonList: [], everyOnesWatchingList: [], isLoading: false, isError: false);
}
