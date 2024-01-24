
import 'package:expense_manager/base/base_mapper.dart';
import 'package:expense_manager/ui/auth/models/login_data.dart';
import 'package:expense_manager/ui/auth/models/rest/res/res_login.dart';

class LoginResponseMapper extends BaseMapper<ResLogin, LoginData> {
  @override
  LoginData map(ResLogin t) {
    return LoginData(
      id: t.id,
      
    );
  }
}
