import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/domain/entities/posts_entity.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/domain/use_cases/get_single_post.dart';

part 'get_single_post_cubit_state.dart';

class GetSinglePostCubitCubit extends Cubit<GetSinglePostCubitState> {
  GetSinglePostCubitCubit(this.usecase) : super(GetSinglePostCubitInitial());

  final GetSinglePostCase usecase;

  Future<void> loadSinglePost({required int userId, required int id}) async {
    emit(GetSinglePostCubitLoading());
    final Either<String, List<Posts>> result =
        await usecase.execute(userId: userId, id: id);

    result.fold(
      (String failure) => emit(GetSinglePostCubitFailure(failure)),
      (List<Posts> posts) => emit(GetSinglePostCubitSuccess(posts)),
    );
  }
}
