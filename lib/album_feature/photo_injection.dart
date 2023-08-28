import 'package:get_it/get_it.dart';
import 'package:jsonplaceholder_full_project/album_feature/data/data_source/photo_source.dart';
import 'package:jsonplaceholder_full_project/album_feature/data/repository_impl/photo_repository_impl.dart';
import 'package:jsonplaceholder_full_project/album_feature/domain/repository/photo_repository.dart';
import 'package:jsonplaceholder_full_project/album_feature/domain/use_cases/photo_case.dart';
import 'package:jsonplaceholder_full_project/album_feature/ui/state/get_photos_cubit/cubit/get_photos_cubit.dart';

void injectPhotosDependencies(GetIt injection) {
  injection.registerFactory<GetPhotosCubit>(
    () => GetPhotosCubit(
      injection(),
    ),
  );

  injection.registerLazySingleton<PhotoCase>(
    () => PhotoCase(
      injection(),
    ),
  );

  injection.registerLazySingleton<PhotoRepository>(
    () => PhotoRepositoryImpl(
      internetConnectionChecker: injection(),
      source: injection(),
    ),
  );

  injection.registerLazySingleton<PhotoSource>(
    () => PhotoSourceImpl(
      injection(),
    ),
  );
}
