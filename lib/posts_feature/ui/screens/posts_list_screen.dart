import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder_full_project/app_dependency_tree.dart';
import 'package:jsonplaceholder_full_project/core/ui/routes/app_router.gr.dart';
import 'package:jsonplaceholder_full_project/core/ui/widgets/user_failure_widget.dart';
import 'package:jsonplaceholder_full_project/posts_feature/ui/state/get_all_posts_cubit/get_all_posts_cubit_cubit.dart';

import '../widgets/list_view_item.dart';

@RoutePage()
class PostsListScreen extends StatefulWidget {
  const PostsListScreen({super.key, required this.userId});

  final int userId;

  @override
  State<PostsListScreen> createState() => _PostsListScreenState();
}

final GetAllPostsCubitCubit _cubit = injection<GetAllPostsCubitCubit>();

class _PostsListScreenState extends State<PostsListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _cubit.loadAllPosts(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'User Posts List',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<GetAllPostsCubitCubit, GetAllPostsCubitState>(
        bloc: _cubit,
        builder: (context, state) {
          if (state is GetAllPostsCubitLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          } else if (state is GetAllPostsCubitFailure) {
            return UserFailureWidget(
              message: state.errMessage,
              onRetry: () async => _cubit.loadAllPosts(widget.userId),
            );
          } else if (state is GetAllPostsCubitSuccess) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              physics: const BouncingScrollPhysics(),
              itemCount: state.posts.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: GestureDetector(
                    onTap: () {
                      context.pushRoute(
                        PostDetailRoute(
                          id: state.posts[index].id,
                          userId: state.posts[index].userId,
                        ),
                      );
                    },
                    child: ListViewItem(
                      listTitle: state.posts[index].title,
                    ),
                  ),
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
