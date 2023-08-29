import 'package:dartz/dartz.dart';
import 'package:jsonplaceholder_full_project/core/domain/entities/all_failures.dart';
import 'package:jsonplaceholder_full_project/post_details/domain/entities/comment_failure.dart';
import 'package:jsonplaceholder_full_project/post_details/domain/entities/comments_entity.dart';
import 'package:jsonplaceholder_full_project/post_details/domain/repository/post_details_repository.dart';

class GetSingleCommentCase {
  final PostDetailsRepository repository;

  GetSingleCommentCase(this.repository);

  Future<Either<String, List<Comments>>> execute(int postId) async {
    final Either<Failure, List<Comments>> result =
        await repository.getSingleComment(postId);

    return result.bimap(
      (Failure failure) {
        if (failure is InternetFailure) {
          return 'Internet Failure';
        } else if (failure is CommentFailure) {
          return failure.errMessage;
        } else {
          return 'Uknown failure, please try again later';
        }
      },
      (List<Comments> comments) => comments,
    );
  }
}
