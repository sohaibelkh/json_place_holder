import 'package:dartz/dartz.dart';
import 'package:jsonplaceholder_full_project/core/domain/entities/all_failures.dart';
import 'package:jsonplaceholder_full_project/post_details/domain/entities/posts_entity.dart';
import 'package:jsonplaceholder_full_project/post_details/domain/repository/post_details_repository.dart';
import 'package:jsonplaceholder_full_project/posts_feature/domain/entities/post_failure.dart';


class GetSinglePostCase {
  final PostDetailsRepository repository;

  GetSinglePostCase(this.repository);

  Future<Either<String, List<PostDetail>>> execute({
    required int userId,
    required int id,
  }) async {
    final Either<Failure, List<PostDetail>> result = await repository.getSinglePost(id: id, userId: userId);
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
      (List<PostDetail> posts) => posts,
    );
  }
}
