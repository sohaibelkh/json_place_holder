import 'package:dio/dio.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/data/models/exceptions.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/data/models/posts_model.dart';

abstract class PostSource {
  Future<List<PostModel>> getAllPosts(int userId);
  Future<List<PostModel>> getSinglePost({
    required int userId,
    required int id,
  });
}


class PostSourceImp implements PostSource{
  final Dio dio;

  PostSourceImp(this.dio);

 
  @override
  Future<List<PostModel>> getAllPosts(int userId)async {
 final String url =
        'https://jsonplaceholder.typicode.com/posts?userId=$userId';

    final Response result = await dio.get(url);

    if (result.statusCode == 200) {
      final List<PostModel> postsList = [];

      for (dynamic item in result.data) {
        final Map<String, dynamic> data = item as Map<String, dynamic>;
        postsList.add(PostModel.fromJson(data));
      }
      return postsList;
    } else {
      const PostException postException = PostException('Something went wrong');
      throw postException;
    }
  }

  @override
  Future<List<PostModel>> getSinglePost({required int userId, required int id}) async{
     final String url =
        'https://jsonplaceholder.typicode.com/posts?id=$id&userId=$userId';

    final Response result = await dio.get(url);

    if(result.statusCode == 200){
      final List<PostModel> postsList = [];

      for (dynamic item in result.data) {
        final Map<String, dynamic> data = item as Map<String, dynamic>;
        postsList.add(PostModel.fromJson(data));
      }
      return postsList;
    }else{
      const PostException postException = PostException('Something went wrong');
      throw postException;
    }
  }

}
