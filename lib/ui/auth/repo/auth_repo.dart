import 'package:expense_manager/ui/auth/datasource/auth_data_source.dart';
import 'package:expense_manager/ui/auth/datasource/remote_auth_repo.dart';
import 'package:expense_manager/ui/auth/mappers/login_res_mapper.dart';
import 'package:expense_manager/ui/auth/models/login_data.dart';
import 'package:expense_manager/ui/auth/models/rest/req/req_login.dart';

class AuthRepo {
  final LoginResponseMapper mapper = LoginResponseMapper();

  //mock datasource
  // AuthDataSource get _getDataSource => MockDataSource();

  // //Remote server api call datasource
  AuthDataSource get _getDataSource => RemoteDataSource();

  Stream<LoginData> login(ReqLogin reqLogin) {
    return _getDataSource.login(reqLogin).map((event) => mapper.map(event));
  }
  Stream<LoginData> signup(ReqLogin reqLogin) {
    return _getDataSource.signup(reqLogin).map((event) => mapper.map(event));
  }
  Stream<LoginData> forgot(ReqLogin reqLogin) {
    return _getDataSource.forgot(reqLogin).map((event) => mapper.map(event));
  }
 
}
