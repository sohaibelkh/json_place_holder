
import 'package:equatable/equatable.dart';

class CommentException extends Equatable implements Exception{

  final String errMessage;

 const CommentException(this.errMessage);

  @override
  List<Object?> get props =>[errMessage];

  @override
  bool? get stringify => true;
}

class PostDetailsException extends Equatable implements Exception{

  final String errMessage;

 const PostDetailsException(this.errMessage);

  @override
  List<Object?> get props =>[errMessage];

  @override
  bool? get stringify => true;
}