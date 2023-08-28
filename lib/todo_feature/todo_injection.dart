import 'package:get_it/get_it.dart';
import 'package:jsonplaceholder_full_project/todo_feature/data/data_source/todo_source.dart';
import 'package:jsonplaceholder_full_project/todo_feature/data/repository_impl/todo_repository_impl.dart';
import 'package:jsonplaceholder_full_project/todo_feature/domain/use_cases/get_all_todos_use_case.dart';
import 'package:jsonplaceholder_full_project/todo_feature/ui/state/get_all_todos/get_all_todos_cubit.dart';

import 'domain/repository/todo_repository.dart';

void injectTodosDependencies(GetIt injection) {
  injection.registerFactory<GetAllTodosCubit>(
    () => GetAllTodosCubit(
      injection(),
    ),
  );

  injection.registerLazySingleton<UseCaseGetAllTodos>(
    () => UseCaseGetAllTodos(
      injection(),
    ),
  );

  injection.registerLazySingleton<TodoRepository>(
    () => TodoRepositoryImpl(
      todoSource: injection(),
      internetConnectionChecker: injection(),
    ),
  );

  injection.registerLazySingleton<TodoSourceJsonPlaceholderImpl>(
    () => TodoSourceJsonPlaceholderImpl(
      injection(),
    ),
  );
}
