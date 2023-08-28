part of 'get_single_post_cubit_cubit.dart';

sealed class GetSinglePostCubitState extends Equatable {
  const GetSinglePostCubitState();

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

final class GetSinglePostCubitInitial extends GetSinglePostCubitState {}

final class GetSinglePostCubitLoading extends GetSinglePostCubitState {}

final class GetSinglePostCubitSuccess extends GetSinglePostCubitState {
  final List<Posts> posts;

  const GetSinglePostCubitSuccess(this.posts);

  @override
  List<Object> get props => [posts];

  @override
  bool? get stringify => true;
}

final class GetSinglePostCubitFailure extends GetSinglePostCubitState {
  final String errMessage;

  const GetSinglePostCubitFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];

  @override
  bool? get stringify => true;
}
