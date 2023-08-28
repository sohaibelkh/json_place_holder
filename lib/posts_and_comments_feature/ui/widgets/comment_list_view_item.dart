import 'package:flutter/material.dart';

class CommentListViewItem extends StatelessWidget {
  const CommentListViewItem({super.key, required this.name, required this.comment});

  final String name;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            name,
            style:const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Text(
            comment,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
