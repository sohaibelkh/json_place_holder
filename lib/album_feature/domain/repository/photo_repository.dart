import 'package:dartz/dartz.dart';
import 'package:jsonplaceholder_full_project/album_feature/domain/entities/photos_entity.dart';
import 'package:jsonplaceholder_full_project/core/domain/entities/all_failures.dart';

abstract class PhotoRepository {
  Future<Either<Failure, List<Photos>>> getPhoto({
    required int albumId,
    required int id,
  });
}
