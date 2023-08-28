import 'package:jsonplaceholder_full_project/album_feature/data/models/almub_constants.dart';
import 'package:jsonplaceholder_full_project/album_feature/domain/entities/photos_entity.dart';

class PhotoModel extends Photos {
  const PhotoModel({
    required super.albumId,
    required super.photoId,
    required super.url,
    required super.thumbnailUrl,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> data) {
    final int albumId =
        num.parse(data[AlbumConstants.albumId].toString()).toInt();
    final int photoId =
        num.parse(data[AlbumConstants.photoId].toString()).toInt();
    final String url = data[AlbumConstants.url].toString();
    final String thumbnailUrl = data[AlbumConstants.thumbnailUrl].toString();

    return PhotoModel(
      albumId: albumId,
      photoId: photoId,
      url: url,
      thumbnailUrl: thumbnailUrl,
    );
  }
}
