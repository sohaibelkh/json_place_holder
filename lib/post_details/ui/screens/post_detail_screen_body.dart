import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder_full_project/app_dependency_tree.dart';
import 'package:jsonplaceholder_full_project/post_details/ui/state/get_single_post_cubit/get_single_post_cubit.dart';

import 'comment_cubit_widget.dart';

class PostDetailScreenBody extends StatefulWidget {
  const PostDetailScreenBody(
      {super.key, required this.id, required this.userId});

  final int id;
  final int userId;

  @override
  State<PostDetailScreenBody> createState() => _PostDetailScreenBodyState();
}

final GetSinglePostCubit _postCubit = injection<GetSinglePostCubit>();

class _PostDetailScreenBodyState extends State<PostDetailScreenBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _postCubit.loadPost(userId: widget.userId, id: widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSinglePostCubit, GetSinglePostState>(
      bloc: _postCubit,
      builder: (context, state) {
        if (state is GetSinglePostLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        } else if (state is GetSinglePostFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else if (state is GetSinglePostSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 16, left: 16, top: 16, bottom: 16),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 170,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        state.post.first.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      state.post.first.body,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              CommentCubitWidget(
                postId: state.post.first.id,
              ),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

