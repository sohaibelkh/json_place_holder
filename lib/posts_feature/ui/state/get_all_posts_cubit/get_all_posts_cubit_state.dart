part of 'get_all_posts_cubit_cubit.dart';

sealed class GetAllPostsCubitState extends Equatable {
  const GetAllPostsCubitState();

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

final class GetAllPostsCubitInitial extends GetAllPostsCubitState {}

final class GetAllPostsCubitLoading extends GetAllPostsCubitState {}

final class GetAllPostsCubitSuccess extends GetAllPostsCubitState {
  final List<Posts> posts;

 const GetAllPostsCubitSuccess(this.posts);


  @override
  List<Object> get props => [posts];

  @override
  bool? get stringify => true;
}

final class GetAllPostsCubitFailure extends GetAllPostsCubitState {
  final String errMessage;

 const GetAllPostsCubitFailure(this.errMessage);


  @override
  List<Object> get props => [errMessage];

  @override
  bool? get stringify => true;
}
