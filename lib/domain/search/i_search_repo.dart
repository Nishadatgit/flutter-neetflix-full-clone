import 'package:dartz/dartz.dart';
import 'package:project_netflix/domain/core/failures/main_failures.dart';
import 'package:project_netflix/domain/search/models/search_response/search_response.dart';

abstract class ISearchRepo {
  Future<Either<MainFailures, SearchResponse>> searchMovies(
      {required String movieQuery});
}
