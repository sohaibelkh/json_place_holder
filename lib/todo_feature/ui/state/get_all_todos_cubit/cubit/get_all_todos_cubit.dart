import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:jsonplaceholder_full_project/todo_feature/domain/entities/todo_entity.dart';
import 'package:jsonplaceholder_full_project/todo_feature/domain/use_cases/get_all_todos_use_case.dart';

part 'get_all_todos_state.dart';

class GetAllTodosCubit extends Cubit<GetAllTodosState> {
  GetAllTodosCubit(this.useCaseGetAllTodos) : super(GetAllTodosInitial());

  final UseCaseGetAllTodos useCaseGetAllTodos;

  Future<void> loadAllTodos(int userId) async {
    emit(GetAllTodosLoading());
    final Either<String, List<Todo>> result =
        await useCaseGetAllTodos.execute(userId);

    result.fold(
      (String errMessage) => emit(
        GetAllTodosFailure(errMessage),
      ),
      (List<Todo> todos) => emit(
        GetAllTodosSuccess(todos),
      ),
    );
  }
}
