part of 'get_single_user_cubit.dart';

sealed class GetSingleUserState extends Equatable {
  const GetSingleUserState();

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

final class GetSingleUserInitial extends GetSingleUserState {}

final class GetSingleUserLoading extends GetSingleUserState {}

final class GetSingleUserSuccess extends GetSingleUserState {
  final List<User> users;

  const GetSingleUserSuccess(this.users);
  @override
  List<Object> get props => [users];

  @override
  bool? get stringify => true;
}

final class GetSingleUserFailure extends GetSingleUserState {
  final String errMessage;

  const GetSingleUserFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];

  @override
  bool? get stringify => true;
}
