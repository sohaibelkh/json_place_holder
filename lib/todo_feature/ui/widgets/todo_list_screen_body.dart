import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder_full_project/app_dependency_tree.dart';
import 'package:jsonplaceholder_full_project/constants.dart';
import 'package:jsonplaceholder_full_project/todo_feature/ui/state/get_all_todos_cubit/cubit/get_all_todos_cubit.dart';

class TodoListScreenBody extends StatefulWidget {
  const TodoListScreenBody({super.key, required this.userId});

  final int userId;

  @override
  State<TodoListScreenBody> createState() => _TodoListScreenBodyState();
}

final GetAllTodosCubit _cubit = injection<GetAllTodosCubit>();

class _TodoListScreenBodyState extends State<TodoListScreenBody> {
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
            return Center(
              child: Text(state.errMessage),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
