import 'package:get_it/get_it.dart';
import 'package:jsonplaceholder_full_project/post_details/data/data_source/post_details_source.dart';
import 'package:jsonplaceholder_full_project/post_details/data/repository_impl/post_details_repository_impl.dart';
import 'package:jsonplaceholder_full_project/post_details/domain/repository/post_details_repository.dart';
import 'package:jsonplaceholder_full_project/post_details/domain/use_cases/get_single_comment.dart';
import 'package:jsonplaceholder_full_project/post_details/ui/state/get_single_comment_cubit/get_comment_cubit.dart';

void injectCommentsDependencies(GetIt injection) {
  injection.registerFactory<GetCommentCubit>(
    () => GetCommentCubit(
      injection(),
    ),
  );

  injection.registerLazySingleton<GetSingleCommentCase>(
    () => GetSingleCommentCase(
      injection(),
    ),
  );

  injection.registerLazySingleton<PostDetailsRepository>(
    () => PostDetailsRepositoryImpl(
      internetConnectionChecker: injection(),
      source: injection(),
    ),
  );

  injection.registerLazySingleton<PostDetailsSource>(
    () => PostDetailsSourceImpl(
      injection(),
    ),
  );
}
