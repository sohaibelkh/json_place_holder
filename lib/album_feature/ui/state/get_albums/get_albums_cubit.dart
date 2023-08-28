import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:jsonplaceholder_full_project/album_feature/domain/entities/albums_entity.dart';
import 'package:jsonplaceholder_full_project/album_feature/domain/use_cases/album_case.dart';

part 'get_albums_state.dart';

class GetAlbumsCubit extends Cubit<GetAlbumsState> {
  GetAlbumsCubit(this.albumCase) : super(GetAlbumsInitial());

  final AlbumCase albumCase;

  Future<void> loadAlbums(int userId) async {
    emit(GetAlbumsLoading());
    final Either<String, List<Albums>> result = await albumCase.execute(userId);

    result.fold(
      (String failure) => emit(
        GetAlbumsFailure(failure),
      ),
      (List<Albums> albums) => emit(
        GetAlbumsSuccess(albums),
      ),
    );
  }
}
