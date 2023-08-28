import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:jsonplaceholder_full_project/album_feature/domain/entities/photos_entity.dart';
import 'package:jsonplaceholder_full_project/album_feature/domain/use_cases/photo_case.dart';

part 'get_photos_state.dart';

class GetPhotosCubit extends Cubit<GetPhotosState> {
  GetPhotosCubit(this.photoCase) : super(GetPhotosInitial());

  final PhotoCase photoCase;

  Future<void> loadPhotos({
    required int albumId,
    required int id,
  }) async {
    emit(GetPhotosLoading());
    final Either<String, List<Photos>> result = await photoCase.execute(
      albumId: albumId,
      id: id,
    );
     result.fold(
      (String failure) => emit(
        GetPhotosFailure(failure),
      ),
      (List<Photos> photos) => emit(
        GetPhotosSuccess(photos),
      ),
    );
  }
}
