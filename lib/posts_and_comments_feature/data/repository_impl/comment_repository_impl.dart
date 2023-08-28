import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jsonplaceholder_full_project/core/domain/entities/all_failures.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/data/data_source/comment_source.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/data/models/comments_model.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/data/models/exceptions.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/domain/entities/comment_failure.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/domain/entities/comments_entity.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/domain/repository/comments_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final InternetConnectionChecker internetConnectionChecker;
  final CommentSource source;

  CommentRepositoryImpl(
      {required this.internetConnectionChecker, required this.source});

  @override
  Future<Either<Failure, List<Comments>>> getSingleComment(int postId) async {
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
}
