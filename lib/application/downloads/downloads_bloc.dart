
// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:project_netflix/domain/core/failures/main_failures.dart';
import 'package:project_netflix/domain/downloads/i_downloads_repo.dart';
import 'package:project_netflix/domain/downloads/models/downloads.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo _iDownloadsRepo;
  DownloadsBloc(this._iDownloadsRepo) : super(DownloadsState.initail()) {
    on<_GetDownloadsImage>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          downloadsFailureOrSuccess: none(),
        ),
      );
      final Either<MainFailures, List<Downloads>> downloadsOption =
          await _iDownloadsRepo.getDownloadsImages();

      emit(downloadsOption.fold(
        (failure) => state.copyWith(
          isLoading: false,
          downloadsFailureOrSuccess: Some(
            Left(failure),
          ),
        ),
        (success) => state.copyWith(
          isLoading: false,
          downloadsFailureOrSuccess: Some(
            Right(success),
          ),
          downloads: success,
        ),
      ));
    });
  }
}
