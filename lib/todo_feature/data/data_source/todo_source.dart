import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jsonplaceholder_full_project/todo_feature/data/models/exceptions.dart';
import 'package:jsonplaceholder_full_project/todo_feature/data/models/todo_model.dart';

abstract class TodoSourceJsonPlaceholder {

  Future<List<TodoModel>> getAllTodos(int userId);
}

class TodoSourceJsonPlaceholderImpl implements TodoSourceJsonPlaceholder {
  final Dio dio;

  TodoSourceJsonPlaceholderImpl(this.dio);

  @override
  Future<List<TodoModel>> getAllTodos(int userId) async {
    final String url =
        "https://jsonplaceholder.typicode.com/todos?userId=$userId";
    final Response result = await dio.get(url,options: Options());
    if (result.statusCode == 200) {
      debugPrint("DEBUG: data=${result.data}, result=$result, ");
      final List<TodoModel> todos = [];
      for (dynamic item in result.data!) {
        final Map<String,dynamic> itemTodo = item as Map<String,dynamic>;
        todos.add(TodoModel.fromMap(itemTodo));
      }
      return todos;
    } else {
      const TodoException exception = TodoException("Todo list is empty");
      debugPrint("TodoSourceJsonPlaceholder getAllTodos exception=$exception");
      throw exception;
    }
  }
  
  
}
