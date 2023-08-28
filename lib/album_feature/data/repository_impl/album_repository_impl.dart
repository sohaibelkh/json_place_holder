import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jsonplaceholder_full_project/album_feature/data/data_source/album_source.dart';
import 'package:jsonplaceholder_full_project/album_feature/data/models/album_model.dart';
import 'package:jsonplaceholder_full_project/album_feature/data/models/exceptions.dart';
import 'package:jsonplaceholder_full_project/album_feature/domain/entities/albums_entity.dart';
import 'package:jsonplaceholder_full_project/album_feature/domain/entities/failures.dart';
import 'package:jsonplaceholder_full_project/album_feature/domain/repository/album_repository.dart';
import 'package:jsonplaceholder_full_project/core/domain/entities/all_failures.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final InternetConnectionChecker internetConnectionChecker;
  final AlbumSource source;

  AlbumRepositoryImpl({required this.internetConnectionChecker,required this.source});

  @override
  Future<Either<Failure, List<Albums>>> getAllAlbums(int userId) async {
    final bool connected = await internetConnectionChecker.hasConnection;

    if (connected) {
      try {
        final List<AlbumModel> result = await source.getAllAlbums(userId);

        return right(result);
      } on AlbumException catch (ex) {
        return left(
          AlbumFailure(ex.errMessage),
        );
      }
    } else {
      return left(InternetFailure());
    }
  }
}
