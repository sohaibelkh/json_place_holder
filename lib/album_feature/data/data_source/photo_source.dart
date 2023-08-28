import 'package:dio/dio.dart';
import 'package:jsonplaceholder_full_project/album_feature/data/models/exceptions.dart';
import 'package:jsonplaceholder_full_project/album_feature/data/models/photo_model.dart';

abstract class PhotoSource {
  Future<List<PhotoModel>> getPhoto({
    required int albumId,
    required int id,
  });
}

class PhotoSourceImpl implements PhotoSource {
  final Dio dio;

  PhotoSourceImpl(this.dio);

  @override
  Future<List<PhotoModel>> getPhoto(
      {required int albumId, required int id}) async {
    final String url =
        'https://jsonplaceholder.typicode.com/photos?albumId=$albumId&id=$id';

    final Response result = await dio.get(url);

    if (result.statusCode == 200) {
      final List<PhotoModel> photos = [];
      for (dynamic item in result.data) {
        final Map<String, dynamic> data = item as Map<String, dynamic>;
        photos.add(
          PhotoModel.fromJson(data),
        );
      }
      return photos;
    }else{
      const PhotoException exception = PhotoException('Photos not found');
      throw exception;
    }
  }
}
