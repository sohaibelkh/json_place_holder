import 'package:equatable/equatable.dart';

class UserException extends Equatable implements Exception{
  final String errMessage;

 const UserException(this.errMessage);

  @override
  List<Object?> get props =>[errMessage];

  @override
  bool? get stringify => true;
}