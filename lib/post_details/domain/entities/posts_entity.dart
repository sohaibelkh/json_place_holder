import 'package:equatable/equatable.dart';

class PostDetail extends Equatable{
  final int id;
  final int userId;
  final String title;
  final String body;

 const PostDetail({required this.id,required this.userId,required this.title,required this.body});
  
  @override
  List<Object?> get props =>[id, userId, title, body];

  @override
  bool? get stringify =>true;
}