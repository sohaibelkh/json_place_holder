import 'package:dio/dio.dart';
import 'package:jsonplaceholder_full_project/post_details/data/models/comments_model.dart';
import 'package:jsonplaceholder_full_project/post_details/data/models/exceptions.dart';
import 'package:jsonplaceholder_full_project/post_details/data/models/post_details_model.dart';

abstract class PostDetailsSource {
  Future<List<CommentModel>> getSingleComment(int postId);

  Future<List<PostDetailsModel>> getSinglePost({
    required int userId,
    required int id,
  });
}


class PostDetailsSourceImpl implements PostDetailsSource{

   final Dio dio;

  PostDetailsSourceImpl(this.dio);
  @override
  Future<List<CommentModel>> getSingleComment(int postId)async {
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

  @override
  Future<List<PostDetailsModel>> getSinglePost({required int userId, required int id}) async{
    final String url =
        'https://jsonplaceholder.typicode.com/posts?id=$id&userId=$userId';

    final Response result = await dio.get(url);

    if(result.statusCode == 200){
      final List<PostDetailsModel> postsList = [];

      for (dynamic item in result.data) {
        final Map<String, dynamic> data = item as Map<String, dynamic>;
        postsList.add(PostDetailsModel.fromJson(data));
      }
      return postsList;
    }else{
      const PostDetailsException postException = PostDetailsException('Something went wrong');
      throw postException;
    }
  }

}