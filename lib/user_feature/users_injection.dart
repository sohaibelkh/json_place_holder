import 'package:get_it/get_it.dart';
import 'package:jsonplaceholder_full_project/user_feature/data/data_source/users_data_source.dart';
import 'package:jsonplaceholder_full_project/user_feature/data/repository_impl/user_repository_impl.dart';
import 'package:jsonplaceholder_full_project/user_feature/domain/repository/user_repository.dart';
import 'package:jsonplaceholder_full_project/user_feature/domain/use_cases/get_all_users_use_case.dart';
import 'package:jsonplaceholder_full_project/user_feature/domain/use_cases/get_single_user_use_case.dart';
import 'package:jsonplaceholder_full_project/user_feature/ui/state/get_all_users_cubit/cubit/get_all_users_cubit.dart';
import 'package:jsonplaceholder_full_project/user_feature/ui/state/get_single_user_cubit/cubit/get_single_user_cubit.dart';

void injectUsersDependencies(GetIt injection) {
  injection.registerFactory<GetAllUsersCubit>(
    () => GetAllUsersCubit(
      injection(),
    ),
  );

  injection.registerFactory<GetSingleUserCubit>(
    () => GetSingleUserCubit(
      injection(),
    ),
  );

  injection.registerLazySingleton<GetAllUsersUseCase>(
    () => GetAllUsersUseCase(
      injection(),
    ),
  );

  injection.registerLazySingleton<GetSingleUserUseCase>(
    () => GetSingleUserUseCase(
      injection(),
    ),
  );

  injection.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      source: injection(),
      internetConnectionChecker: injection(),
    ),
  );

  injection.registerLazySingleton<UserSource>(
    () => UserSourceImpl(
      injection(),
    ),
  );
}
