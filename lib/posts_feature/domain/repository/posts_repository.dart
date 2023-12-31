import 'package:dartz/dartz.dart';
import 'package:jsonplaceholder_full_project/core/domain/entities/all_failures.dart';
import 'package:jsonplaceholder_full_project/posts_feature/domain/entities/posts_entity.dart';

abstract class PostRepository {
  Future<Either<Failure, List<Posts>>> getAllPosts(int userId);
  
}
