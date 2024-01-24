

import 'package:expense_manager/base/base_ui_state.dart';
import 'package:expense_manager/ui/profile/model/user_data.dart';

class AddUserState extends BaseUiState<UserData> {
  AddUserState.loading() : super.loading();

  AddUserState.completed(UserData data) : super.completed(data: data);

  AddUserState.error(dynamic error) : super.error(error);
}
