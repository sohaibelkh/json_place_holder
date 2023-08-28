import 'package:dartz/dartz.dart';
import 'package:jsonplaceholder_full_project/core/domain/entities/all_failures.dart';
import 'package:jsonplaceholder_full_project/user_feature/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getAllUsers();
  Future<Either<Failure, List<User>>> getSingleUser(int id);
}