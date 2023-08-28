import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:jsonplaceholder_full_project/user_feature/domain/entities/user_entity.dart';
import 'package:jsonplaceholder_full_project/user_feature/domain/use_cases/get_single_user_use_case.dart';

part 'get_single_user_state.dart';

class GetSingleUserCubit extends Cubit<GetSingleUserState> {
  GetSingleUserCubit(this.getSingleUserUseCase) : super(GetSingleUserInitial());

  final GetSingleUserUseCase getSingleUserUseCase;

  Future<void> loadSingleUser(int id) async {
    emit(GetSingleUserLoading());
    final Either<String, List<User>> result =
        await getSingleUserUseCase.execute(id);
    result.fold(
      (String failure) => emit(
        GetSingleUserFailure(failure),
      ),
      (List<User> users) => emit(
        GetSingleUserSuccess(users),
      ),
    );
  }
}
