import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jsonplaceholder_full_project/user_feature/data/models/user_exception.dart';
import 'package:jsonplaceholder_full_project/user_feature/data/models/user_model.dart';

abstract class UserSource {
  Future<List<UserModel>> getAllUsers();

  Future<List<UserModel>> getSingleUser(int id);
}

class UserSourceImpl implements UserSource {
  final Dio dio;

  UserSourceImpl(this.dio);
  @override
  Future<List<UserModel>> getAllUsers() async {
    const String url = 'https://jsonplaceholder.typicode.com/users';

    final Response result = await dio.get(url);

    if (result.statusCode == 200) {
      final List<UserModel> users = [];
      for (dynamic item in result.data) {
        debugPrint("DEBUG: data=${result.data}, result=$result, ");
        final Map<String, dynamic> userItem = item as Map<String, dynamic>;
        users.add(UserModel.fromJson(userItem));
      }
      return users;
    }else{
      const UserException exception = UserException('User List is empty');
      debugPrint("TodoSourceJsonPlaceholder getAllusers exception=$exception");
      throw exception;
    }
  }

  @override
  Future<List<UserModel>> getSingleUser(int id) async {
    final String url = 'https://jsonplaceholder.typicode.com/users?id=$id';

    final Response result = await dio.get(url);

    if(result.statusCode == 200){
      final List<UserModel> users = [];
      for(dynamic item in result.data){
        final Map<String, dynamic> userItem = item as Map<String, dynamic>;
        users.add(UserModel.fromJson(userItem));
      }
      return users;
    }else{
      const UserException exception = UserException('User List is empty');
      debugPrint("TodoSourceJsonPlaceholder getAllusers exception=$exception");
      throw exception;
    }
  }
}
