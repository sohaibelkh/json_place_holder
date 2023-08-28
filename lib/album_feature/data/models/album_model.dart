import 'package:jsonplaceholder_full_project/album_feature/domain/entities/albums_entity.dart';

import 'almub_constants.dart';

class AlbumModel extends Albums {
  const AlbumModel({
    required super.userId,
    required super.id,
    required super.title,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> data) {
    final int id = num.parse(data[AlbumConstants.id].toString()).toInt();
    final int userId = num.parse(data[AlbumConstants.userId].toString()).toInt();
    final String title = data[AlbumConstants.title].toString();

    return AlbumModel(userId: userId, id: id, title: title);
  }
}
