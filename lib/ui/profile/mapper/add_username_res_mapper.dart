import 'package:expense_manager/base/base_mapper.dart';
import 'package:expense_manager/ui/profile/model/rest/req/username_model.dart';
import 'package:expense_manager/ui/profile/model/user_data.dart';
import 'package:expense_manager/ui/profile/model/rest/res/res_username.dart';

class AddUserResponseMapper extends BaseMapper<ReqUser, UserData> {
  @override
  UserData map(ReqUser t) {
    return UserData(
      birthdate: t.birthdate,
      email: t.email,
      firstname: t.firstname,
      gender: t.gander,
      id: t.id,
      imageUrl: t.imageUrl,
      lastName: t.lastName,
    );
  }
}

class DataResponseMapper extends BaseMapper<ResUser, UserData> {
  @override
  UserData map(ResUser t) {
    return UserData(
      birthdate: t.birthdate,
      email: t.email,
      firstname: t.firstName,
      gender: t.gender,
      id: t.id,
      imageUrl: t.imageUrl,
      lastName: t.lastName,
    );
  }
}
