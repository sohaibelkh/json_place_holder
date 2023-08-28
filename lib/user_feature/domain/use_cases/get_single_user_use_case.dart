import 'package:dartz/dartz.dart';
import 'package:jsonplaceholder_full_project/core/domain/entities/all_failures.dart';
import 'package:jsonplaceholder_full_project/user_feature/domain/entities/user_entity.dart';
import 'package:jsonplaceholder_full_project/user_feature/domain/entities/user_failure.dart';
import 'package:jsonplaceholder_full_project/user_feature/domain/repository/user_repository.dart';

class GetSingleUserUseCase {
  final UserRepository repository;

  GetSingleUserUseCase(this.repository);

  Future<Either<String, List<User>>> execute(int id) async {
    final Either<Failure, List<User>> result =
        await repository.getSingleUser(id);

    return result.bimap(
      (Failure failure) {
        if (failure is InternetFailure) {
          return 'Internet Failure';
        } else if (failure is Userfailure) {
          return failure.errMessage;
        } else {
          return 'Unknown falire, please try again later';
        }
      },
      (List<User> users) => users,
    );
  }
}
