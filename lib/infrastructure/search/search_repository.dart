import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:project_netflix/domain/core/api_end_points.dart';
import 'package:project_netflix/domain/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:project_netflix/domain/search/i_search_repo.dart';
import 'package:project_netflix/domain/search/models/search_response/search_response.dart';

@LazySingleton(as: ISearchRepo)
class SearchRepository extends ISearchRepo {
  @override
  Future<Either<MainFailures, SearchResponse>> searchMovies(
      {required String movieQuery}) async {
    try {
      final Response response =
          await Dio(BaseOptions(responseType: ResponseType.json))
              .get(ApiEndPoints.search,queryParameters: {"query":movieQuery});

      if (response.statusCode == 200 || response.statusCode == 201) {
        final searchResults = SearchResponse.fromJson(response.data);

        return Right(searchResults);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailures.clientFailure());
    }
  }
}
