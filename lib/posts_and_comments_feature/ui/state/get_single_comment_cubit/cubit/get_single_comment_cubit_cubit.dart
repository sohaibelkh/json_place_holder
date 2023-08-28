import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/domain/entities/comments_entity.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/domain/use_cases/get_single_comment.dart';

part 'get_single_comment_cubit_state.dart';

class GetSingleCommentCubitCubit extends Cubit<GetSingleCommentCubitState> {
  GetSingleCommentCubitCubit(this.usecase)
      : super(GetSingleCommentCubitInitial());

  final GetSingleCommentCase usecase;

  Future<void> loadAllComments(int postId) async {
    emit(GetSingleCommentCubitLoading());
    final Either<String, List<Comments>> result = await usecase.execute(postId);

    result.fold(
      (String failure) => emit(GetSingleCommentCubitFailure(failure)),
      (List<Comments> comments) => emit(GetSingleCommentCubitSuccess(comments)),
    );
  }
}
