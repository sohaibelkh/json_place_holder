import 'package:jsonplaceholder_full_project/user_feature/data/models/user_constants.dart';
import 'package:jsonplaceholder_full_project/user_feature/domain/entities/geo_entity.dart';

class GeoModel extends Geo {
  const GeoModel({required super.lat, required super.lng});

  factory GeoModel.fromJson(Map<String, dynamic> data) {
    final dynamic lat = data[UserConstants.lat].toString();
    final dynamic lng = data[UserConstants.lng].toString();

    return GeoModel(lat: lat, lng: lng);
  }
}
