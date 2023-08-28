import 'package:flutter/material.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/ui/widgets/posts_list_screen_body.dart';

class PostsListScreen extends StatelessWidget {
  const PostsListScreen({super.key, required this.userId, required this.username});

  final int userId;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:  Text(
          '$username Posts List',
          style:const  TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body:  PostsListScreenBody(userId: userId),
    );
  }
}