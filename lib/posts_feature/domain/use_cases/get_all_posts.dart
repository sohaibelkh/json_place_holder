import 'package:dartz/dartz.dart';
import 'package:jsonplaceholder_full_project/core/domain/entities/all_failures.dart';
import 'package:jsonplaceholder_full_project/posts_feature/domain/entities/post_failure.dart';
import 'package:jsonplaceholder_full_project/posts_feature/domain/entities/posts_entity.dart';
import 'package:jsonplaceholder_full_project/posts_feature/domain/repository/posts_repository.dart';

class GetAllPostsCase {
  final PostRepository repository;

  GetAllPostsCase(this.repository);
  Future<Either<String, List<Posts>>> execute(int userId) async {
    final Either<Failure, List<Posts>> result =
        await repository.getAllPosts(userId);

    return result.bimap(
      (Failure failure) {
        if (failure is InternetFailure) {
          return 'Internet failure';
        } else if (failure is PostFailure) {
          return failure.errMessage;
        } else {
          return 'Uknown failure, please try again';
        }
      },
      (List<Posts> posts) => posts,
    );
  }
}
