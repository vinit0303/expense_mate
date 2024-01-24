import 'package:expense_manager/base/base_bloc.dart';
import 'package:expense_manager/base/base_response_data.dart';
import 'package:expense_manager/service/route_service.dart';
import 'package:expense_manager/ui/auth/models/rest/req/req_login.dart';
import 'package:expense_manager/ui/auth/repo/auth_repo.dart';
import 'package:expense_manager/ui/auth/states/login_state.dart';
import 'package:expense_manager/utils/dialog_utils.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BaseBloc {
  final customerRepo = AuthRepo();

  BehaviorSubject<LoginState> loginState = BehaviorSubject<LoginState>();

  void login(String email, String password) {
    var req = ReqLogin(email: email, password: password);
    DialogUtils.showLoader();
    subscription
        .add(
      customerRepo
          .login(req)
          .map((data) => LoginState.completed(data))
          .onErrorReturnWith((error, stackTrace) => LoginState.error(error))
          .startWith(LoginState.loading())
          .listen((event) async {
        loginState.add(event);
        if (event.isCompleted()) {
          DialogUtils.hideLoader();
          RouteManager.pushReplacementNamed(RouteConstants.dashboard);
        } else if (event.isError()) {
          DialogUtils.hideLoader();
          var err = event.error;
          try {
            var res = BaseResponseData.fromJson(err.response?.data ?? {});
            if (!(res.success ?? true)) {
              showErrorDialog(res.error.toString());
            }
          } catch (e) {
            showErrorDialog('Email or Password is wrong!!');
          }
        }
      }),
    )
        .onError((e) {
      DialogUtils.hideLoader();
      loginState.add(LoginState.error(e));
    });
  }

  @override
  void dispose() {
    loginState.close();
    super.dispose();
  }
}
