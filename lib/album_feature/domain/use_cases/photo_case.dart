import 'package:dartz/dartz.dart';
import 'package:jsonplaceholder_full_project/album_feature/domain/entities/failures.dart';
import 'package:jsonplaceholder_full_project/album_feature/domain/entities/photos_entity.dart';
import 'package:jsonplaceholder_full_project/album_feature/domain/repository/photo_repository.dart';
import 'package:jsonplaceholder_full_project/core/domain/entities/all_failures.dart';

class PhotoCase {
  final PhotoRepository repository;

  PhotoCase(this.repository);

  Future<Either<String, List<Photos>>> execute( {
    required int albumId,
    required int id,
  }) async {
    final Either<Failure, List<Photos>> result = await repository.getPhoto(
      albumId: albumId,
      id: id,
    );
    return result.bimap(
      (Failure failure) {
        if (failure is InternetFailure) {
          return 'Internet failure';
        } else if (failure is PhotoFailure) {
          return failure.errMessage;
        } else {
          return "Unknown failure, please try again later";
        }
      },
      (List<Photos> photos) => photos,
    );
  }
}
