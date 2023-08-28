import 'package:equatable/equatable.dart';

class Photos extends Equatable {
  final int albumId;
  final int photoId;
  final String url;
  final String thumbnailUrl;

  const Photos({
    required this.albumId,
    required this.photoId,
    required this.url,
    required this.thumbnailUrl,
  });

  @override
  List<Object?> get props => [albumId, photoId, url, thumbnailUrl];


  @override
  bool? get stringify => true;
}
