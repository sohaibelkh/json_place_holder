import 'package:dartz/dartz.dart';
import 'package:jsonplaceholder_full_project/core/domain/entities/all_failures.dart';
import 'package:jsonplaceholder_full_project/todo_feature/domain/entities/failure.dart';
import 'package:jsonplaceholder_full_project/todo_feature/domain/entities/todo_entity.dart';
import 'package:jsonplaceholder_full_project/todo_feature/domain/repository/todo_repository.dart';

class UseCaseGetAllTodos {
  final TodoRepository repository;

  UseCaseGetAllTodos(this.repository);

  Future<Either<String, List<Todo>>> execute(int userId) async {
    final Either<Failure, List<Todo>> result =
        await repository.getAllTodos(userId);
    return result.bimap(
      (Failure failure) {
        if (failure is InternetFailure) {
          return "Internet failure";
        } else if (failure is TodoFailure) {
          return failure.message;
        } else {
          return "Unknown failure, please try again later";
        }
      },
      (List<Todo> todos) => todos,
    );
  }
}