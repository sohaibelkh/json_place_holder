import 'package:equatable/equatable.dart';

class Comments extends Equatable {
  final int postId;
  final int commentId;
  final String name;
  final String email;
  final String commentBody;

  const Comments({
    required this.postId,
    required this.commentId,
    required this.name,
    required this.email,
    required this.commentBody,
  });

  @override
  List<Object?> get props => [postId, commentId, name, email, commentBody];

  @override
  bool? get stringify => true;
}
