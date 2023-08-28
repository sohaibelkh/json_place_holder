import 'package:get_it/get_it.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/data/data_source/post_source.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/data/repository_impl/post_repository_impl.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/domain/repository/posts_repository.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/domain/use_cases/get_all_posts.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/domain/use_cases/get_single_post.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/ui/state/get_all_posts_cubit/cubit/get_all_posts_cubit_cubit.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/ui/state/get_single_post_cubit/cubit/get_single_post_cubit_cubit.dart';

void injectPostsDependencies(GetIt injection) {
  injection.registerFactory<GetAllPostsCubitCubit>(
    () => GetAllPostsCubitCubit(
      injection(),
    ),
  );

  injection.registerFactory<GetSinglePostCubitCubit>(
    () => GetSinglePostCubitCubit(
      injection(),
    ),
  );

  injection.registerLazySingleton<GetAllPostsCase>(
    () => GetAllPostsCase(
      injection(),
    ),
  );

  injection.registerLazySingleton<GetSinglePostCase>(
    () => GetSinglePostCase(
      injection(),
    ),
  );

  injection.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(
      source: injection(),
      internetConnectionChecker: injection(),
    ),
  );
  injection.registerLazySingleton<PostSource>(
    () => PostSourceImp(
      injection(),
    ),
  );
}
