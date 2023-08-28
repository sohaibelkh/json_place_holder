import 'package:dartz/dartz.dart';
import 'package:jsonplaceholder_full_project/album_feature/domain/entities/albums_entity.dart';
import 'package:jsonplaceholder_full_project/album_feature/domain/entities/failures.dart';
import 'package:jsonplaceholder_full_project/album_feature/domain/repository/album_repository.dart';
import 'package:jsonplaceholder_full_project/core/domain/entities/all_failures.dart';

class AlbumCase {
  final AlbumRepository repository;

  AlbumCase(this.repository);

  Future<Either<String, List<Albums>>> execute(int userId) async {
    final Either<Failure, List<Albums>> result =
        await repository.getAllAlbums(userId);

    return result.bimap(
      (Failure failure) {
        if (failure is InternetFailure) {
          return 'Internet failure';
        } else if (failure is AlbumFailure) {
          return failure.errMessage;
        } else {
          return "Unknown failure, please try again later";
        }
      },
      (List<Albums> albums) => albums,
    );
  }
}
