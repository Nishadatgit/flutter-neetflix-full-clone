import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:project_netflix/domain/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:project_netflix/domain/hot_and_new/hot_and_new_service.dart';
import 'package:project_netflix/domain/hot_and_new/model/hot_and_new_model.dart';

import '../../domain/core/api_end_points.dart';

@LazySingleton(as: HotAndNewService)
class HotAndNewIm implements HotAndNewService {
  @override
  Future<Either<MainFailures, HotAndNewModel>> getHotAndNewMovieData() async {
    try {
      final Response response =
          await Dio(BaseOptions(responseType: ResponseType.json)).get(ApiEndPoints.hotAndNewMovie);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final searchResults = HotAndNewModel.fromJson(response.data);

        return Right(searchResults);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailures.clientFailure());
    }
  }

  @override
  Future<Either<MainFailures, HotAndNewModel>> getHotAndNewTVData() async {
    try {
      final Response response = await Dio(BaseOptions(responseType: ResponseType.json)).get(ApiEndPoints.hotAndNewTV);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final searchResults = HotAndNewModel.fromJson(response.data);

        return Right(searchResults);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailures.clientFailure());
    }
  }
}
