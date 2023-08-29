
import 'package:jsonplaceholder_full_project/post_details/domain/entities/posts_entity.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/data/models/post_constants.dart';

class PostDetailsModel extends PostDetail {
 const PostDetailsModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.body,
  });


  factory PostDetailsModel.fromJson(Map<String, dynamic> data){
    final String title = data[PostsConstants.title].toString();
    final String body = data[PostsConstants.body].toString();
    final int id = num.parse(data[PostsConstants.id].toString()).toInt();
    final int userId = num.parse(data[PostsConstants.userId].toString()).toInt();

    return PostDetailsModel(id: id, userId: userId, title: title, body: body);
  }
}
