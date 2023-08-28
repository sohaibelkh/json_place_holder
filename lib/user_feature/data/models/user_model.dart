import 'package:jsonplaceholder_full_project/user_feature/data/models/address_model.dart';
import 'package:jsonplaceholder_full_project/user_feature/data/models/company_model.dart';
import 'package:jsonplaceholder_full_project/user_feature/data/models/user_constants.dart';
import 'package:jsonplaceholder_full_project/user_feature/domain/entities/user_entity.dart';

class UserModel extends User {
  const UserModel({
    required super.address,
    required super.company,
    required super.id,
    required super.name,
    required super.userName,
    required super.email,
    required super.phone,
    required super.website,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) {
    final String name = data[UserConstants.name].toString();
    final String userName = data[UserConstants.userName].toString();
    final String email = data[UserConstants.email].toString();
    final String website = data[UserConstants.website].toString();
    final int id = num.parse(data[UserConstants.id].toString()).toInt();
    final dynamic phone =data[UserConstants.phone].toString();
    final Map<String, dynamic> address = data[UserConstants.address];
    final Map<String, dynamic> company = data[UserConstants.company];

    return UserModel(
      address: AddressModel.fromJson(address),
      company: CompanyModel.fromJson(company),
      id: id,
      name: name,
      userName: userName,
      email: email,
      phone: phone,
      website: website,
    );
  }
}
