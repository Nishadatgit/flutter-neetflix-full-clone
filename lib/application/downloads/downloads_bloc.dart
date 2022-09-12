import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_netflix/domain/core/failures/main_failures.dart';
import 'package:project_netflix/domain/downloads/models/downloads.dart';
part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  DownloadsBloc() : super(DownloadsState.initail()) {
    on<_GetDownloadsImage>((event, emit) {
      // TODO: implement event handler
    });
  }
}
