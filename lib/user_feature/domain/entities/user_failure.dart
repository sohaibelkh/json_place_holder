import 'package:jsonplaceholder_full_project/core/domain/entities/all_failures.dart';

class Userfailure implements Failure{

  final String errMessage;

  Userfailure(this.errMessage);



  @override
  List<Object?> get props =>[errMessage];

  @override
  bool? get stringify =>true;

}