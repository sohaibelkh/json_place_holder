import 'package:flutter/material.dart';
import 'package:jsonplaceholder_full_project/album_feature/ui/widgets/all_albums_screen_body.dart';

class AllAlbumsScreen extends StatelessWidget {
  const AllAlbumsScreen({super.key, required this.userId});

  final int userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title:  const Text(
          'User Albums',
          style:  TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body:  AllAlbumsScreenBody(
        userId: userId,
      ),
    );
  }
}
