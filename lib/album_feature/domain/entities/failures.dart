import 'package:jsonplaceholder_full_project/core/domain/entities/all_failures.dart';

class AlbumFailure implements Failure{


  final String errMessage;

  AlbumFailure(this.errMessage);

  @override
  List<Object?> get props => [errMessage];

  @override
  bool? get stringify => true;

}


class PhotoFailure implements Failure{


  final String errMessage;

  PhotoFailure(this.errMessage);

  @override
  List<Object?> get props => [errMessage];

  @override
  bool? get stringify => true;

}