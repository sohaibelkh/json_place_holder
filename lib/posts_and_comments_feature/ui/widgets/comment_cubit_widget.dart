import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder_full_project/app_dependency_tree.dart';
import 'package:jsonplaceholder_full_project/posts_and_comments_feature/ui/state/get_single_comment_cubit/cubit/get_single_comment_cubit_cubit.dart';

import 'comment_list_view_item.dart';

class CommentCubitWidget extends StatefulWidget {
  const CommentCubitWidget({
    super.key,
    required this.postId,
  });

  final int postId;

  @override
  State<CommentCubitWidget> createState() => _CommentCubitWidgetState();
}

final GetSingleCommentCubitCubit _commentCubit =
    injection<GetSingleCommentCubitCubit>();

class _CommentCubitWidgetState extends State<CommentCubitWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _commentCubit.loadAllComments(widget.postId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSingleCommentCubitCubit, GetSingleCommentCubitState>(
      bloc: _commentCubit,
      builder: (context, state) {
        if (state is GetSingleCommentCubitLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        } else if (state is GetSingleCommentCubitFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else if (state is GetSingleCommentCubitSuccess) {
          return Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: state.comments.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return CommentListViewItem(
                  name: '${state.comments[index].name}  :',
                  comment: state.comments[index].commentBody,
                );
              },
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
