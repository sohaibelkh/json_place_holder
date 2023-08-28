import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jsonplaceholder_full_project/album_feature/data/data_source/photo_source.dart';
import 'package:jsonplaceholder_full_project/album_feature/data/models/exceptions.dart';
import 'package:jsonplaceholder_full_project/album_feature/data/models/photo_model.dart';
import 'package:jsonplaceholder_full_project/album_feature/domain/entities/failures.dart';
import 'package:jsonplaceholder_full_project/album_feature/domain/entities/photos_entity.dart';
import 'package:jsonplaceholder_full_project/album_feature/domain/repository/photo_repository.dart';
import 'package:jsonplaceholder_full_project/core/domain/entities/all_failures.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final InternetConnectionChecker internetConnectionChecker;
  final PhotoSource source;

  PhotoRepositoryImpl({required this.internetConnectionChecker,required this.source});

  @override
  Future<Either<Failure, List<Photos>>> getPhoto(
      {required int albumId, required int id}) async {
    final bool connected = await internetConnectionChecker.hasConnection;

    if (connected) {
      try {
        final List<PhotoModel> result = await source.getPhoto(
          albumId: albumId,
          id: id,
        );
        return right(result);
      } on PhotoException catch (ex) {
        return left(
          PhotoFailure(ex.errMessage),
        );
      }
    } else {
      return left(InternetFailure());
    }
  }
}
