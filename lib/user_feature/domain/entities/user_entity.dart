import 'package:equatable/equatable.dart';
import 'package:jsonplaceholder_full_project/user_feature/domain/entities/address_entity.dart';
import 'package:jsonplaceholder_full_project/user_feature/domain/entities/company_entity.dart';

class User extends Equatable {
  final String name;
  final String userName;
  final String email;
  final dynamic phone;
  final String website;
  final int id;
  final Address address;
  final Company company;

  const User({
   required this.address,
   required this.company,
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    required this.phone,
    required this.website,
  });

  @override
  List<Object?> get props => [name, userName, email, phone, website, id];

  @override
  bool? get stringify => true;
}
