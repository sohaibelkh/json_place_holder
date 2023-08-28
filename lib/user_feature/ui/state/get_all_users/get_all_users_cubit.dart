import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:jsonplaceholder_full_project/user_feature/domain/entities/user_entity.dart';
import 'package:jsonplaceholder_full_project/user_feature/domain/use_cases/get_all_users_use_case.dart';

part 'get_all_users_state.dart';

class GetAllUsersCubit extends Cubit<GetAllUsersState> {
  GetAllUsersCubit(this.getAllUsersUseCase) : super(GetAllUsersInitial());

  final GetAllUsersUseCase getAllUsersUseCase;

  Future<void> loadAllUsers() async {
    emit(GetAllUsersLoading());
    final Either<String, List<User>> result =
        await getAllUsersUseCase.execute();
    result.fold(
      (String failure) => emit(
        GetAllUsersFailure(failure),
      ),
      (List<User> users) => emit(
        GetAllUsersSuccess(users),
      ),
    );
  }
}
