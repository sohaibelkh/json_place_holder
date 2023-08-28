import 'package:get_it/get_it.dart';
import 'package:jsonplaceholder_full_project/album_feature/data/data_source/album_source.dart';
import 'package:jsonplaceholder_full_project/album_feature/data/repository_impl/album_repository_impl.dart';
import 'package:jsonplaceholder_full_project/album_feature/domain/repository/album_repository.dart';
import 'package:jsonplaceholder_full_project/album_feature/domain/use_cases/album_case.dart';
import 'package:jsonplaceholder_full_project/album_feature/ui/state/get_albums/get_albums_cubit.dart';

void injectAlbumsDependencies(GetIt injection) {
  injection.registerFactory<GetAlbumsCubit>(
    () => GetAlbumsCubit(
      injection(),
    ),
  );

  injection.registerLazySingleton<AlbumCase>(
    () => AlbumCase(
      injection(),
    ),
  );

  injection.registerLazySingleton<AlbumRepository>(
    () => AlbumRepositoryImpl(
      internetConnectionChecker: injection(),
      source: injection(),
    ),
  );

  injection.registerLazySingleton<AlbumSource>(
    () => AlbumSourceImp(
      injection(),
    ),
  );
}
