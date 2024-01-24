import 'package:expense_manager/ui/profile/datasource/add_username_data_source.dart';
import 'package:expense_manager/ui/profile/datasource/remote_data_source.dart';
import 'package:expense_manager/ui/profile/mapper/add_username_res_mapper.dart';
import 'package:expense_manager/ui/profile/model/rest/req/username_model.dart';
import 'package:expense_manager/ui/profile/model/user_data.dart';

class AddUserRepo {
  final AddUserResponseMapper mapper = AddUserResponseMapper();
  final DataResponseMapper datamapper = DataResponseMapper();

  // final ListMapper listmapper = ListMapper();

  UserDataSource get _getDataSource => RemoteDataSource();

  // UserDataSourceLocal get _getDataSource => LocalDataSource();

  Stream<UserData> deleteUser(String id) {
    return _getDataSource.deleteUser(id).map((event) => datamapper.map(event));
  }

  Stream<UserData> editUserData(
    ReqUser reqTodo,

  ) {
    return _getDataSource
        .editUserData(reqTodo)
        .map((event) => mapper.map(event));
  }

  Stream<UserData> getuserDetail() {
    return _getDataSource.getuserDetail().map((event) => datamapper.map(event));
  }
  Stream updatePass(String newpass) {
    return _getDataSource.updatePass(newpass);
  }
}
