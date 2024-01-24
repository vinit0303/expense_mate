import 'package:expense_manager/ui/auth/models/rest/req/req_login.dart';
import 'package:expense_manager/ui/auth/models/rest/res/res_login.dart';

abstract class AuthDataSource {
  Stream<ResLogin> login(ReqLogin reqLogin);
  Stream<ResLogin> signup(ReqLogin reqLogin); 
  Stream<ResLogin> forgot(ReqLogin reqLogin); 
}