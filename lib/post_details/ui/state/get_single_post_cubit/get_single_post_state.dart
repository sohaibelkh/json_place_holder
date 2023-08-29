part of 'get_single_post_cubit.dart';

sealed class GetSinglePostState extends Equatable {
  const GetSinglePostState();

  @override
  List<Object> get props => [];
}

final class GetSinglePostInitial extends GetSinglePostState {}

final class GetSinglePostLoading extends GetSinglePostState {}

final class GetSinglePostSuccess extends GetSinglePostState {
  final List<PostDetail> post;

 const GetSinglePostSuccess(this.post);

   @override
  List<Object> get props => [post];

  @override
  bool? get stringify => true;
}

final class GetSinglePostFailure extends GetSinglePostState {
  final String errMessage;

  const GetSinglePostFailure(this.errMessage);

    @override
  List<Object> get props => [errMessage];

  @override
  bool? get stringify => true;
}
