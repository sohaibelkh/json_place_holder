import 'package:flutter/material.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/ui/widgets/post_detail_screen_body.dart';

class PostDetailScreen extends StatelessWidget {
  const PostDetailScreen({super.key, required this.id, required this.userId});

  final int id;
  final int userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Post Comments',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: PostDetailScreenBody(id: id, userId: userId),
    );
  }
}