import 'package:dartz/dartz.dart';
import 'package:jsonplaceholder_full_project/core/domain/entities/all_failures.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/domain/entities/comments_entity.dart';

abstract class CommentRepository {
  Future<Either<Failure, List<Comments>>> getSingleComment(int postId);
}
