import 'package:equatable/equatable.dart';

class Albums extends Equatable{
  final int userId;
  final int id;
  final String title;

 const Albums({
    required this.userId,
    required this.id,
    required this.title,
  });
  
  @override
  List<Object?> get props => [userId, id, title];


  @override
  bool? get stringify => true;
}
