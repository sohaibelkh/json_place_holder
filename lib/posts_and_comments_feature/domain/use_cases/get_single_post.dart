import 'package:dartz/dartz.dart';
import 'package:jsonplaceholder_full_project/core/domain/entities/all_failures.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/domain/entities/post_failure.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/domain/entities/posts_entity.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/domain/repository/posts_repository.dart';

class GetSinglePostCase {
  final PostRepository repository;

  GetSinglePostCase(this.repository);

  Future<Either<String, List<Posts>>> execute({
    required int userId,
    required int id,
  }) async {
    final Either<Failure, List<Posts>> result = await repository.getSinglePost(
      userId: userId,
      id: id,
    );
    return result.bimap(
      (Failure failure) {
        if (failure is InternetFailure) {
          return 'Internet Failure';
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
