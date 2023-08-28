part of 'get_all_users_cubit.dart';

sealed class GetAllUsersState extends Equatable {
  const GetAllUsersState();

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

final class GetAllUsersInitial extends GetAllUsersState {}

final class GetAllUsersLoading extends GetAllUsersState {}

final class GetAllUsersSuccess extends GetAllUsersState {
  final List<User> users;

  const GetAllUsersSuccess(this.users);
  @override
  List<Object> get props => [users];

  @override
  bool? get stringify => true;
}

final class GetAllUsersFailure extends GetAllUsersState {
  final String errMessage;

  const GetAllUsersFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];

  @override
  bool? get stringify => true;
}
