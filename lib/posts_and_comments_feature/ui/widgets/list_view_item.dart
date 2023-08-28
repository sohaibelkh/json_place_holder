import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
    required this.listTitle,
  });

  final String listTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 110,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            listTitle,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
          const SizedBox(height: 10),
          const Text(
            'Tap to see comments..',
            style: TextStyle(fontSize: 16, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
