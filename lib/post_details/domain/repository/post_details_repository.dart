import 'package:dartz/dartz.dart';
import 'package:jsonplaceholder_full_project/core/domain/entities/all_failures.dart';
import 'package:jsonplaceholder_full_project/post_details/domain/entities/comments_entity.dart';
import 'package:jsonplaceholder_full_project/post_details/domain/entities/posts_entity.dart';

abstract class PostDetailsRepository{
  Future<Either<Failure, List<Comments>>> getSingleComment(int postId);

  Future<Either<Failure, List<PostDetail>>> getSinglePost({
    required int id,
    required int userId,
  });
}