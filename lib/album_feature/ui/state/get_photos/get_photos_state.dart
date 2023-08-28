part of 'get_photos_cubit.dart';

sealed class GetPhotosState extends Equatable {
  const GetPhotosState();

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

final class GetPhotosInitial extends GetPhotosState {}

final class GetPhotosLoading extends GetPhotosState {}

final class GetPhotosSuccess extends GetPhotosState {
  final List<Photos> photos;

  const GetPhotosSuccess(this.photos);

   @override
  List<Object> get props => [photos];


  @override
  bool? get stringify => true;

}

final class GetPhotosFailure extends GetPhotosState {
  final String errMessage;

  const GetPhotosFailure(this.errMessage);

   @override
  List<Object> get props => [errMessage];


  @override
  bool? get stringify => true;
  
}

