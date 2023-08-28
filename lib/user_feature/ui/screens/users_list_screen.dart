import 'package:flutter/material.dart';
import 'package:jsonplaceholder_full_project/constants.dart';
import 'package:jsonplaceholder_full_project/user_feature/ui/widgets/user_list_screen_body.dart';

class UsersListScreen extends StatelessWidget {
  const UsersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPurpleColor,
        title: const Text(
          'Users List',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: const UsersListScreenBody(),
    );
  }
}
