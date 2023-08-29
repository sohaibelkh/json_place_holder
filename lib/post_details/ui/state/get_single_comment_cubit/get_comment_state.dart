part of 'get_comment_cubit.dart';

sealed class GetCommentState extends Equatable {
  const GetCommentState();

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

final class GetCommentInitial extends GetCommentState {}

final class GetCommentLoading extends GetCommentState {}

final class GetCommentSuccess extends GetCommentState {

  final List<Comments> comments;

 const GetCommentSuccess(this.comments);

   @override
  List<Object> get props => [comments];

  @override
  bool? get stringify => true;
}

final class GetCommentFailure extends GetCommentState {
  final String errMessage;

 const GetCommentFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];

  @override
  bool? get stringify => true;
}
