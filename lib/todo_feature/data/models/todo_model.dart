import 'package:jsonplaceholder_full_project/todo_feature/domain/entities/todo_entity.dart';

import 'todo_constants.dart';

class TodoModel extends Todo {
  const TodoModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.completed,
  });

  factory TodoModel.fromMap(Map<String, dynamic> data) {
    final String title = data[TodosConstants.title].toString();
    final int id = num.parse(data[TodosConstants.id].toString()).toInt();
    final int userId =
        num.parse(data[TodosConstants.userId].toString()).toInt();
    final bool completed = data[TodosConstants.completed] as bool;
    return TodoModel(
      id: id,
      userId: userId,
      title: title,
      completed: completed,
    );
  }
}
