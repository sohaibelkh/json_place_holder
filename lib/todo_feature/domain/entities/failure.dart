
import 'package:jsonplaceholder_full_project/core/domain/entities/all_failures.dart';

class TodoFailure implements Failure {
  final String message;

  TodoFailure(this.message);
  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => true;
}
