import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:jsonplaceholder_full_project/post_details/domain/entities/comments_entity.dart';
import 'package:jsonplaceholder_full_project/post_details/domain/use_cases/get_single_comment.dart';

part 'get_comment_state.dart';

class GetCommentCubit extends Cubit<GetCommentState> {
  GetCommentCubit(this.usecase) : super(GetCommentInitial());

  final GetSingleCommentCase usecase;

  Future<void> loadComment(int postId) async {
    emit(GetCommentLoading());
    final Either<String, List<Comments>> result = await usecase.execute(postId);

    result.fold(
      (String failure) => emit(GetCommentFailure(failure)),
      (List<Comments> comments) => emit(GetCommentSuccess(comments)),
    );
  }
}
