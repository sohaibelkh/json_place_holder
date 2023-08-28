import 'package:get_it/get_it.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/data/data_source/comment_source.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/data/repository_impl/comment_repository_impl.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/domain/repository/comments_repository.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/domain/use_cases/get_single_comment.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/ui/state/get_single_comment_cubit/cubit/get_single_comment_cubit_cubit.dart';

void injectCommentsDependencies(GetIt injection) {
  injection.registerFactory<GetSingleCommentCubitCubit>(
    () => GetSingleCommentCubitCubit(
      injection(),
    ),
  );

  injection.registerLazySingleton<GetSingleCommentCase>(
    () => GetSingleCommentCase(
      injection(),
    ),
  );

  injection.registerLazySingleton<CommentRepository>(
    () => CommentRepositoryImpl(
      internetConnectionChecker: injection(),
      source: injection(),
    ),
  );

  injection.registerLazySingleton<CommentSource>(
    () => CommentSourceImpl(
      injection(),
    ),
  );
}
