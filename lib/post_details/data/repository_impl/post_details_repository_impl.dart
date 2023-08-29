import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jsonplaceholder_full_project/core/domain/entities/all_failures.dart';
import 'package:jsonplaceholder_full_project/post_details/data/data_source/post_details_source.dart';
import 'package:jsonplaceholder_full_project/post_details/data/models/comments_model.dart';
import 'package:jsonplaceholder_full_project/post_details/data/models/exceptions.dart';
import 'package:jsonplaceholder_full_project/post_details/data/models/post_details_model.dart';
import 'package:jsonplaceholder_full_project/post_details/domain/entities/comment_failure.dart';
import 'package:jsonplaceholder_full_project/post_details/domain/entities/comments_entity.dart';
import 'package:jsonplaceholder_full_project/post_details/domain/entities/post_failure.dart';
import 'package:jsonplaceholder_full_project/post_details/domain/entities/posts_entity.dart';
import 'package:jsonplaceholder_full_project/post_details/domain/repository/post_details_repository.dart';

class PostDetailsRepositoryImpl implements PostDetailsRepository{

  final InternetConnectionChecker internetConnectionChecker;
  final PostDetailsSource source;

  PostDetailsRepositoryImpl({required this.internetConnectionChecker,required this.source});
  @override
  Future<Either<Failure, List<Comments>>> getSingleComment(int postId)async {
    final bool connected = await internetConnectionChecker.hasConnection;

    if (connected) {
      try {
        final List<CommentModel> result = await source.getSingleComment(postId);
        return right(result);
      } on CommentException catch (ex) {
        return left(
          CommentFailure(ex.errMessage),
        );
      }
    } else {
      return left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, List<PostDetail>>> getSinglePost({required int id, required int userId})async {
    final bool connected = await internetConnectionChecker.hasConnection;
    if (connected) {
      try {
        final List<PostDetailsModel> result =
            await source.getSinglePost(userId: userId, id: id);
        return right(result);
      } on PostDetailsException catch (ex) {
        return left(
          PostFailure(ex.errMessage),
        );
      }
    } else {
      return left(InternetFailure());
    }
  }
}