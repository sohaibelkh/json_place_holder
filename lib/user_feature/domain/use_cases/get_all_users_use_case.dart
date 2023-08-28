import 'package:dartz/dartz.dart';
import 'package:jsonplaceholder_full_project/core/domain/entities/all_failures.dart';
import 'package:jsonplaceholder_full_project/user_feature/domain/entities/user_entity.dart';
import 'package:jsonplaceholder_full_project/user_feature/domain/entities/user_failure.dart';
import 'package:jsonplaceholder_full_project/user_feature/domain/repository/user_repository.dart';

class GetAllUsersUseCase {
  final UserRepository repository;

  GetAllUsersUseCase(this.repository);

  Future<Either<String, List<User>>> execute() async {
    final Either<Failure, List<User>> result = await repository.getAllUsers();

    return result.bimap(
      (Failure failure) {
        if (failure is Userfailure) {
          return failure.errMessage;
        } else if (failure is InternetFailure) {
          return 'Internet Failure';
        } else {
          return 'Unknown falire, please try again later';
        }
      },
      (List<User> users) => users,
    );
  }
}
