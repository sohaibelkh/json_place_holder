import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder_full_project/app_dependency_tree.dart';
import 'package:jsonplaceholder_full_project/post_details/ui/state/get_single_comment_cubit/get_comment_cubit.dart';

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

final GetCommentCubit _commentCubit =
    injection<GetCommentCubit>();

class _CommentCubitWidgetState extends State<CommentCubitWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _commentCubit.loadComment(widget.postId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCommentCubit, GetCommentState>(
      bloc: _commentCubit,
      builder: (context, state) {
        if (state is GetCommentLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        } else if (state is GetCommentFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else if (state is GetCommentSuccess) {
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
