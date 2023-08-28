import 'package:flutter/material.dart';
import 'package:jsonplaceholder_full_project/constants.dart';
import 'package:jsonplaceholder_full_project/todo_feature/ui/widgets/todo_list_screen_body.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key, required this.userId, required this.username});

  final int userId;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPurpleColor,
        title:  Text(
          '$username Todos List',
          style:  const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body:   TodoListScreenBody(userId: userId),
    );
  }
}