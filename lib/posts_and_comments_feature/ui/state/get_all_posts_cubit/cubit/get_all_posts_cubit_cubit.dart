import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/domain/entities/posts_entity.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/domain/use_cases/get_all_posts.dart';

part 'get_all_posts_cubit_state.dart';

class GetAllPostsCubitCubit extends Cubit<GetAllPostsCubitState> {
  GetAllPostsCubitCubit(this.usecase) : super(GetAllPostsCubitInitial());

  final GetAllPostsCase usecase;

  Future<void> loadAllPosts(int userId) async {
    emit(GetAllPostsCubitLoading());

    final Either<String, List<Posts>> result = await usecase.execute(userId);

    result.fold(
      (String failure) => emit(GetAllPostsCubitFailure(failure)),
      (List<Posts> posts) => emit(GetAllPostsCubitSuccess(posts)),
    );
  }
}
