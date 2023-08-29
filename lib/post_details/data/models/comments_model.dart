import 'package:jsonplaceholder_full_project/post_details/domain/entities/comments_entity.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/data/models/post_constants.dart';

class CommentModel extends Comments {
  const CommentModel({
    required super.postId,
    required super.commentId,
    required super.name,
    required super.email,
    required super.commentBody,
  });

  factory CommentModel.fromJson(Map<String, dynamic> data) {
    final int commentId =
        num.parse(data[PostsConstants.commentId].toString()).toInt();
    final int postId =
        num.parse(data[PostsConstants.postId].toString()).toInt();
    final String name = data[PostsConstants.name].toString();
    final String email = data[PostsConstants.email].toString();
    final String commentBody = data[PostsConstants.commentBody].toString();

    return CommentModel(
      postId: postId,
      commentId: commentId,
      name: name,
      email: email,
      commentBody: commentBody,
    );
  }
}
