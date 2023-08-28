import 'package:jsonplaceholder_full_project/user_feature/domain/entities/company_entity.dart';

import 'user_constants.dart';

class CompanyModel extends Company {
  const CompanyModel(
      {required super.name, required super.catchPhrase, required super.bs});

  factory CompanyModel.fromJson(Map<String, dynamic> data) {
    final String companyName = data[UserConstants.companyName].toString();
    final String catchPhrase = data[UserConstants.catchPhrase].toString();
    final String bs = data[UserConstants.bs].toString();

    return CompanyModel(name: companyName, catchPhrase: catchPhrase, bs: bs);
  }
}
