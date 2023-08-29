

import 'package:jsonplaceholder_full_project/posts_feature/data/models/post_constants.dart';
import 'package:jsonplaceholder_full_project/posts_feature/domain/entities/posts_entity.dart';

class PostModel extends Posts {
 const PostModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.body,
  });


  factory PostModel.fromJson(Map<String, dynamic> data){
    final String title = data[PostsConstants.title].toString();
    final String body = data[PostsConstants.body].toString();
    final int id = num.parse(data[PostsConstants.id].toString()).toInt();
    final int userId = num.parse(data[PostsConstants.userId].toString()).toInt();

    return PostModel(id: id, userId: userId, title: title, body: body);
  }
}
