import 'package:dartz/dartz.dart';
import 'package:jsonplaceholder_full_project/album_feature/domain/entities/albums_entity.dart';
import 'package:jsonplaceholder_full_project/core/domain/entities/all_failures.dart';

abstract class AlbumRepository {
  Future<Either<Failure, List<Albums>>> getAllAlbums(int userId);
}