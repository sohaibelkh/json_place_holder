part of 'get_all_todos_cubit.dart';

sealed class GetAllTodosState extends Equatable {
  const GetAllTodosState();

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

final class GetAllTodosInitial extends GetAllTodosState {}

final class GetAllTodosLoading extends GetAllTodosState {}

final class GetAllTodosSuccess extends GetAllTodosState {
  final List<Todo> todos;

 const GetAllTodosSuccess(this.todos);

 @override
  List<Object> get props => [todos];

  @override
  bool? get stringify => true;

}

final class GetAllTodosFailure extends GetAllTodosState {
  final String errMessage;

  const GetAllTodosFailure(this.errMessage);
  
 @override
  List<Object> get props => [errMessage];

  @override
  bool? get stringify => true;
}
