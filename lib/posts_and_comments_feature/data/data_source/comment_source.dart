import 'package:dio/dio.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/data/models/comments_model.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/data/models/exceptions.dart';

abstract class CommentSource {
  Future<List<CommentModel>> getSingleComment(int postId);
}

class CommentSourceImpl implements CommentSource {
  final Dio dio;

  CommentSourceImpl(this.dio);
  @override
  Future<List<CommentModel>> getSingleComment(int postId) async {
    final String url =
        'https://jsonplaceholder.typicode.com/comments?postId=$postId';

    final Response result = await dio.get(url);

    if (result.statusCode == 200) {
      final List<CommentModel> commentsList = [];

      for (dynamic item in result.data) {
        final Map<String, dynamic> data = item as Map<String, dynamic>;
        commentsList.add(
          CommentModel.fromJson(data),
        );
      }
      return commentsList;
    } else {
      const CommentException exception =
          CommentException('Something went wrong');
      throw exception;
    }
  }
}
