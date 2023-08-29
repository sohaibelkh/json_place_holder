import 'package:jsonplaceholder_full_project/core/domain/entities/all_failures.dart';

class PostFailure implements Failure{
  final String errMessage;

  PostFailure(this.errMessage);

  @override
  List<Object?> get props =>[errMessage];

  @override
  bool? get stringify =>true;

}