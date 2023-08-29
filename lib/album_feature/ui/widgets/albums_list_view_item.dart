import 'package:flutter/material.dart';
import 'package:jsonplaceholder_full_project/album_feature/ui/widgets/photos_cubit_widget.dart';

class AlbumsListViewItem extends StatelessWidget {
  const AlbumsListViewItem({
    super.key, required this.title,  required this.id,
  });

  final String title;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width*0.65,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14),
            ),
          ),
           PhotosCubitWidget(
            albumId: 1,
            id: id,
          ),
        ],
      ),
    );
  }
}
