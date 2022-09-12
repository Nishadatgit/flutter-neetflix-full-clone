import 'package:dartz/dartz.dart';
import 'package:project_netflix/domain/core/failures/main_failures.dart';
import 'package:project_netflix/domain/downloads/models/downloads.dart';

abstract class IDownloadsRepo {
  Future<Either<MainFailures, List<Downloads>>> getDownloadsImages();
}
