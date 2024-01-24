
import 'package:expense_manager/base/base_ui_state.dart';
import 'package:expense_manager/ui/auth/models/login_data.dart';

class LoginState extends BaseUiState<LoginData> {
  LoginState.loading() : super.loading();

  LoginState.completed(LoginData data) : super.completed(data: data);

  LoginState.error(dynamic error) : super.error(error);
}
