import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder_full_project/app_dependency_tree.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/ui/screens/post_details_screen.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/ui/state/get_all_posts_cubit/cubit/get_all_posts_cubit_cubit.dart';

import 'list_view_item.dart';

class PostsListScreenBody extends StatefulWidget {
  const PostsListScreenBody({super.key, required this.userId});

  final int userId;

  @override
  State<PostsListScreenBody> createState() => _PostsListScreenBodyState();
}

final GetAllPostsCubitCubit _cubit = injection<GetAllPostsCubitCubit>();

class _PostsListScreenBodyState extends State<PostsListScreenBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _cubit.loadAllPosts(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllPostsCubitCubit, GetAllPostsCubitState>(
      bloc: _cubit,
      builder: (context, state) {
        if (state is GetAllPostsCubitLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        } else if (state is GetAllPostsCubitFailure) {
          return Center(
            child: Text(state.errMessage),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailScreen(
                          id: state.posts[index].id,
                          userId: state.posts[index].userId,
                        ),
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
    );
  }
}
