import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:project_netflix/domain/core/api_end_points.dart';
import 'package:project_netflix/domain/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:project_netflix/domain/downloads/i_downloads_repo.dart';
import 'package:project_netflix/domain/downloads/models/downloads.dart';

@LazySingleton(as: IDownloadsRepo)
class DownloadsRepository implements IDownloadsRepo {
  @override
  Future<Either<MainFailures, List<Downloads>>> getDownloadsImages() async {
    try {
      final Response response =
          await Dio(BaseOptions(responseType: ResponseType.json))
              .get(ApiEndPoints.downloads);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final downloadsList = (response.data['results'] as List)
            .map((e) => Downloads.fromJson(e))
            .toList();

        return Right(downloadsList);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailures.clientFailure());
    }
  }
}
