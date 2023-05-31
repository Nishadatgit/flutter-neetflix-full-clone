part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewEvent with _$HotAndNewEvent {
  const factory HotAndNewEvent.loadDataInEveryoneIsWatching() = _LoadDataInEveryoneIsWatching;
  const factory HotAndNewEvent.loadDataIncomingSoon() = _LoadDataIncomingSoon;
}