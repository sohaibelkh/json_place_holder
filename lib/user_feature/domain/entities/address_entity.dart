import 'package:equatable/equatable.dart';
import 'package:jsonplaceholder_full_project/user_feature/domain/entities/geo_entity.dart';

class Address extends Equatable {
  final String street;
  final String city;
  final dynamic zipCode;
  final Geo geo;

  const Address({
    required this.geo,
    required this.street,
    required this.city,
    required this.zipCode,
  });

  @override
  List<Object?> get props => [street, city, zipCode, geo];

  @override
  bool? get stringify => true;
}
