import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder_full_project/app_dependency_tree.dart';
import 'package:jsonplaceholder_full_project/constants.dart';
import 'package:jsonplaceholder_full_project/core/ui/widgets/user_failure_widget.dart';
import 'package:jsonplaceholder_full_project/todo_feature/ui/state/get_all_todos/get_all_todos_cubit.dart';

@RoutePage()
class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key, required this.userId});

  final int userId;

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final GetAllTodosCubit _cubit = injection<GetAllTodosCubit>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _cubit.loadAllTodos(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPurpleColor,
        title: const Text(
          'User Todos List',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<GetAllTodosCubit, GetAllTodosState>(
        bloc: _cubit,
        builder: (context, state) {
          if (state is GetAllTodosLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: kPurpleColor,
              ),
            );
          } else if (state is GetAllTodosSuccess) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todos[index].title),
                  trailing: Checkbox(
                    activeColor: kPurpleColor,
                    value: state.todos[index].completed,
                    onChanged: (value) {},
                  ),
                );
              },
            );
          } else if (state is GetAllTodosFailure) {
            return UserFailureWidget(
              message: state.errMessage,
              onRetry: () async => _cubit.loadAllTodos(widget.userId),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
