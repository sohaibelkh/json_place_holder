import 'package:jsonplaceholder_full_project/core/domain/entities/all_failures.dart';

class CommentFailure implements Failure{
  final String errMessage;

  CommentFailure(this.errMessage);
  @override
  List<Object?> get props =>[errMessage];

  @override
  bool? get stringify =>true;
}