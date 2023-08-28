import 'package:dartz/dartz.dart';
import 'package:jsonplaceholder_full_project/core/domain/entities/all_failures.dart';
import 'package:jsonplaceholder_full_project/todo_feature/domain/entities/todo_entity.dart';

abstract class TodoRepository {

  Future<Either<Failure, List<Todo>>> getAllTodos(int userId);
}
