import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jsonplaceholder_full_project/core/domain/entities/all_failures.dart';
import 'package:jsonplaceholder_full_project/posts_feature/data/data_source/post_source.dart';
import 'package:jsonplaceholder_full_project/posts_feature/data/models/exceptions.dart';
import 'package:jsonplaceholder_full_project/posts_feature/data/models/posts_model.dart';
import 'package:jsonplaceholder_full_project/posts_feature/domain/entities/post_failure.dart';
import 'package:jsonplaceholder_full_project/posts_feature/domain/entities/posts_entity.dart';
import 'package:jsonplaceholder_full_project/posts_feature/domain/repository/posts_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostSource source;
  final InternetConnectionChecker internetConnectionChecker;

  PostRepositoryImpl({required this.source,required this.internetConnectionChecker});

  @override
  Future<Either<Failure, List<Posts>>> getAllPosts(int userId) async {
    final bool connected = await internetConnectionChecker.hasConnection;
    if (connected) {
      try {
        final List<PostModel> result = await source.getAllPosts(userId);
        return right(result);
      } on PostException catch (ex) {
        return left(
          PostFailure(ex.errMessage),
        );
      }
    } else {
      return left(InternetFailure());
    }
  }
}
