import 'package:expense_manager/ui/profile/model/rest/req/username_model.dart';
import 'package:expense_manager/ui/profile/model/rest/res/res_username.dart';


abstract class UserDataSource {
  Stream<ReqUser> editUserData(ReqUser reqTodo);
  Stream<ResUser> getuserDetail();
  Stream<ResUser> deleteUser(String id);
  Stream updatePass(String newpass);
}

