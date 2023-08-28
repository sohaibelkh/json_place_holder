import 'package:equatable/equatable.dart';

class AlbumException extends Equatable implements Exception{

  final String errMessage;

 const AlbumException(this.errMessage);
  @override
  List<Object?> get props =>[errMessage];

  @override
  bool? get stringify => true;
}

class PhotoException extends Equatable implements Exception{

  final String errMessage;

 const PhotoException(this.errMessage);
  @override
  List<Object?> get props =>[errMessage];

  @override
  bool? get stringify => true;
}