part of 'get_albums_cubit.dart';

sealed class GetAlbumsState extends Equatable {
  const GetAlbumsState();

  @override
  List<Object> get props => [];


  @override
  bool? get stringify => true;
}

final class GetAlbumsInitial extends GetAlbumsState {}

final class GetAlbumsLoading extends GetAlbumsState {}

final class GetAlbumsSuccess extends GetAlbumsState {
  final List<Albums> albums;

  const GetAlbumsSuccess(this.albums);

   @override
  List<Object> get props => [albums];


  @override
  bool? get stringify => true;

}

final class GetAlbumsFailure extends GetAlbumsState {
  final String errMessage;

  const GetAlbumsFailure(this.errMessage);

   @override
  List<Object> get props => [errMessage];


  @override
  bool? get stringify => true;
  
}
