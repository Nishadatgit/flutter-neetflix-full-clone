
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:project_netflix/domain/core/failures/main_failures.dart';
import 'package:project_netflix/domain/hot_and_new/hot_and_new_service.dart';
import 'package:project_netflix/domain/hot_and_new/model/hot_and_new_model.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService _hotAndNewService;
  HotAndNewBloc(this._hotAndNewService) : super(HotAndNewState.intial()) {
    on<_LoadDataIncomingSoon>((event, emit) async {
      if (state.comingSoonList.isNotEmpty) {
        return;
      }
      emit(state.copyWith(isLoading: true));
      final result = await _hotAndNewService.getHotAndNewMovieData();
      final newState = result.fold((MainFailures failure) {
        return state.copyWith(isLoading: false, isError: true);
      }, (HotAndNewModel result) {
        return state.copyWith(
            isLoading: false, comingSoonList: result.results, everyOnesWatchingList: state.everyOnesWatchingList);
      });
      emit(newState);
    });

    on<_LoadDataInEveryoneIsWatching>((event, emit) async {
      if (state.everyOnesWatchingList.isNotEmpty) {
        return;
      }
      emit(state.copyWith(isLoading: true));
      final result = await _hotAndNewService.getHotAndNewTVData();
      final newState = result.fold((MainFailures failure) {
        return state.copyWith(isLoading: false, isError: true);
      }, (HotAndNewModel result) {
        return state.copyWith(
            isLoading: false, comingSoonList: state.comingSoonList, everyOnesWatchingList: result.results);
      });
      emit(newState);
    });
  }
}
