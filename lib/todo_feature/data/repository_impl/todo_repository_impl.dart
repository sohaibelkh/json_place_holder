import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jsonplaceholder_full_project/core/domain/entities/all_failures.dart';
import 'package:jsonplaceholder_full_project/todo_feature/data/data_source/todo_source.dart';
import 'package:jsonplaceholder_full_project/todo_feature/data/models/exceptions.dart';
import 'package:jsonplaceholder_full_project/todo_feature/data/models/todo_model.dart';
import 'package:jsonplaceholder_full_project/todo_feature/domain/entities/failure.dart';
import 'package:jsonplaceholder_full_project/todo_feature/domain/entities/todo_entity.dart';
import 'package:jsonplaceholder_full_project/todo_feature/domain/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoSourceJsonPlaceholderImpl todoSource;
  final InternetConnectionChecker internetConnectionChecker;

  TodoRepositoryImpl(
      {required this.todoSource, required this.internetConnectionChecker});

  @override
  Future<Either<Failure, List<Todo>>> getAllTodos(int userId) async {
    final bool connected = await internetConnectionChecker.hasConnection;

    if (connected) {
      try {
        final List<TodoModel> result = await todoSource.getAllTodos(userId);
        return right(result);
      } on TodoException catch (ex) {
        return left(TodoFailure(ex.message));
      }
    } else {
      return left(InternetFailure());
    }
  }
}