import 'package:flutter/material.dart';
import 'package:jsonplaceholder_full_project/constants.dart';
import 'package:jsonplaceholder_full_project/user_feature/ui/widgets/single_user_infos_body.dart';

class SingleUserInfos extends StatelessWidget {
  const SingleUserInfos({super.key, required this.id, required this.username});

  final int id;
  final String username;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: kPurpleColor,
        title:  Text(
          '$username Infos',
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body:  SingleUserInfosBody(id: id),
    );
  }
}