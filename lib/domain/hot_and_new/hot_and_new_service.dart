import 'package:dartz/dartz.dart';
import 'package:project_netflix/domain/core/failures/main_failures.dart';
import 'package:project_netflix/domain/hot_and_new/model/hot_and_new_model.dart';

abstract class HotAndNewService {
  Future<Either<MainFailures, HotAndNewModel>> getHotAndNewMovieData();
  Future<Either<MainFailures, HotAndNewModel>> getHotAndNewTVData();
}
