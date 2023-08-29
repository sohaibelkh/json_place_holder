import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:jsonplaceholder_full_project/post_details/domain/entities/posts_entity.dart';
import 'package:jsonplaceholder_full_project/post_details/domain/use_cases/get_single_post.dart';

part 'get_single_post_state.dart';

class GetSinglePostCubit extends Cubit<GetSinglePostState> {
  GetSinglePostCubit(this.usecase) : super(GetSinglePostInitial());

  final GetSinglePostCase usecase;

  Future<void> loadPost({
    required int userId,
    required int id,
  }) async {
    emit(GetSinglePostLoading());
    final Either<String, List<PostDetail>> result =
        await usecase.execute(userId: userId, id: id);

    result.fold(
      (String failure) => emit(
        GetSinglePostFailure(failure),
      ),
      (List<PostDetail> post) => emit(
        GetSinglePostSuccess(post),
      ),
    );
  }
}
