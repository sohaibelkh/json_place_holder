import 'package:jsonplaceholder_full_project/user_feature/data/models/user_constants.dart';
import 'package:jsonplaceholder_full_project/user_feature/data/models/geo_model.dart';
import 'package:jsonplaceholder_full_project/user_feature/domain/entities/address_entity.dart';

class AddressModel extends Address {
  const AddressModel(
      {required super.street,
      required super.city,
      required super.zipCode,
      required super.geo});

  factory AddressModel.fromJson(Map<String, dynamic> data) {
    final String street = data[UserConstants.street].toString();
    final String city = data[UserConstants.city].toString();
    final dynamic zipCode = data[UserConstants.zipcode].toString();
    final Map<String, dynamic> geo = data[UserConstants.geo];

    return AddressModel(
      street: street,
      city: city,
      zipCode: zipCode,
      geo: GeoModel.fromJson(geo),
    );
  }
}
