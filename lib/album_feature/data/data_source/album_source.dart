import 'package:dio/dio.dart';
import 'package:jsonplaceholder_full_project/album_feature/data/models/album_model.dart';
import 'package:jsonplaceholder_full_project/album_feature/data/models/exceptions.dart';

abstract class AlbumSource {
  Future<List<AlbumModel>> getAllAlbums(int userId);
}

class AlbumSourceImp implements AlbumSource {
  final Dio dio;

  AlbumSourceImp(this.dio);

  @override
  Future<List<AlbumModel>> getAllAlbums(int userId) async {
    final String url =
        'https://jsonplaceholder.typicode.com/albums?userId=$userId';

    final Response result = await dio.get(url);

    if (result.statusCode == 200) {
      final List<AlbumModel> albums = [];
      for (dynamic item in result.data) {
        final Map<String, dynamic> data = item as Map<String, dynamic>;
        albums.add(
          AlbumModel.fromJson(data),
        );
      }
      return albums;
    }else{
      const AlbumException exception = AlbumException("Album List is empty");
      throw exception;
    }
  }
}
