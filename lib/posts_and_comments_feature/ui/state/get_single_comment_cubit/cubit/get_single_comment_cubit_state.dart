part of 'get_single_comment_cubit_cubit.dart';

sealed class GetSingleCommentCubitState extends Equatable {
  const GetSingleCommentCubitState();

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

final class GetSingleCommentCubitInitial extends GetSingleCommentCubitState {}

final class GetSingleCommentCubitLoading extends GetSingleCommentCubitState {}

final class GetSingleCommentCubitSuccess extends GetSingleCommentCubitState {
  final List<Comments> comments;

  const GetSingleCommentCubitSuccess(this.comments);
  @override
  List<Object> get props => [comments];

  @override
  bool? get stringify => true;
}

final class GetSingleCommentCubitFailure extends GetSingleCommentCubitState {
  final String errMessage;

  const GetSingleCommentCubitFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];

  @override
  bool? get stringify => true;
}
