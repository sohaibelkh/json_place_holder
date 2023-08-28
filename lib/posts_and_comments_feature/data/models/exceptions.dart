import 'package:equatable/equatable.dart';

class PostException extends Equatable implements Exception{

  final String errMessage;

 const PostException(this.errMessage);

  @override
  List<Object?> get props =>[errMessage];

  @override
  bool? get stringify => true;
}

class CommentException extends Equatable implements Exception{

  final String errMessage;

 const CommentException(this.errMessage);

  @override
  List<Object?> get props =>[errMessage];

  @override
  bool? get stringify => true;
}