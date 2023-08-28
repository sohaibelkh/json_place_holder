import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jsonplaceholder_full_project/core/domain/entities/all_failures.dart';
import 'package:jsonplaceholder_full_project/user_feature/data/data_source/users_data_source.dart';
import 'package:jsonplaceholder_full_project/user_feature/data/models/user_exception.dart';
import 'package:jsonplaceholder_full_project/user_feature/data/models/user_model.dart';
import 'package:jsonplaceholder_full_project/user_feature/domain/entities/user_entity.dart';
import 'package:jsonplaceholder_full_project/user_feature/domain/entities/user_failure.dart';
import 'package:jsonplaceholder_full_project/user_feature/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserSource source;
  final InternetConnectionChecker internetConnectionChecker;

  UserRepositoryImpl(
      {required this.source, required this.internetConnectionChecker});

  @override
  Future<Either<Failure, List<User>>> getAllUsers() async {
    final bool connected = await internetConnectionChecker.hasConnection;
    if (connected) {
      try {
        final List<UserModel> result = await source.getAllUsers();
        return right(result);
      } on UserException catch (ex) {
        return left(
          Userfailure(ex.errMessage),
        );
      }
    } else {
      return left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, List<User>>> getSingleUser(int id) async {
    final bool connected = await internetConnectionChecker.hasConnection;

    if (connected) {
      try {
        final List<UserModel> result = await source.getSingleUser(id);
        return right(result);
      } on UserException catch (ex) {
        return left(Userfailure(ex.errMessage));
      }
    } else {
      return left(InternetFailure());
    }
  }
}
