import 'package:expense_manager/base/base_bloc.dart';
import 'package:expense_manager/base/base_response_data.dart';
import 'package:expense_manager/service/route_service.dart';
import 'package:expense_manager/ui/profile/model/rest/req/username_model.dart';
import 'package:expense_manager/ui/profile/repo/username_repo.dart';
import 'package:expense_manager/ui/profile/state/add_username_state.dart';
import 'package:expense_manager/utils/dialog_utils.dart';
import 'package:rxdart/rxdart.dart';

class AddUserBloc extends BaseBloc {
  final addeditRepo = AddUserRepo();
  var url = BehaviorSubject<String>.seeded('');
  var ischangepass = BehaviorSubject<bool>.seeded(false);
  var isshowdropdown = BehaviorSubject<bool>.seeded(false);
  var handleDate = BehaviorSubject<DateTime>.seeded(DateTime.now());

  BehaviorSubject<AddUserState> addUserState = BehaviorSubject<AddUserState>();

  void getuserDetail() async {
    subscription
        .add(
      addeditRepo
          .getuserDetail()
          .map((data) => AddUserState.completed(data))
          .onErrorReturnWith((error, stackTrace) => AddUserState.error(error))
          .listen((event) async {
        DialogUtils.hideLoader();
        addUserState.add(event);
      }),
    )
        .onError((e) {
      DialogUtils.hideLoader();

      var err = e;
      try {
        var res = BaseResponseData.fromJson(err);
        if (!(res.success ?? true)) {
          showErrorDialog(res.error.toString());
        }
      } catch (e) {
        showErrorDialog('Something went wrong!!!');
      }
    });
  }

  void changePass(newPass) {
    DialogUtils.showLoader();
    subscription
        .add(addeditRepo.updatePass(newPass).listen((event) {
      DialogUtils.hideLoader();
      RouteManager.pushReplacementNamed(RouteConstants.dashboard);
    }))
        .onError((e) {
      DialogUtils.hideLoader();

      var err = e;
      try {
        var res = BaseResponseData.fromJson(err);
        if (!(res.success ?? true)) {
          showErrorDialog(res.error.toString());
        }
      } catch (e) {
        showErrorDialog('Something went wrong!!!');
      }
    });
  }

  void deleteAcc(String id) {
    DialogUtils.showLoader();
    subscription
        .add(addeditRepo.deleteUser(id).listen((event) {
      DialogUtils.hideLoader();
      RouteManager.pushReplacementNamed(RouteConstants.login);
    }))
        .onError((e) {
      DialogUtils.hideLoader();

      var err = e;
      try {
        var res = BaseResponseData.fromJson(err);
        if (!(res.success ?? true)) {
          showErrorDialog(res.error.toString());
        }
      } catch (e) {
        showErrorDialog('Something went wrong!!!');
      }
    });
  }

  void editUser(ReqUser reqUser) async {
    subscription
        .add(
      addeditRepo
          .editUserData(
            ReqUser(
              firstname: reqUser.firstname,
              birthdate: reqUser.birthdate,
              id: reqUser.id,
              imageUrl: reqUser.imageUrl,
              email: reqUser.email,
              gander: reqUser.gander,
              lastName: reqUser.lastName,
            ),
          )
          .map((data) => AddUserState.completed(data))
          .listen((event) async {
        DialogUtils.hideLoader();
        addUserState.add(event);
        if (event.isCompleted()) {
          await RouteManager.pushReplacementNamed(RouteConstants.dashboard);
        }
      }),
    )
        .onError((e) {
      DialogUtils.hideLoader();

      var err = e;
      try {
        var res = BaseResponseData.fromJson(err.response?.data ?? {});
        if (!(res.success ?? true)) {
          showErrorDialog(res.error.toString());
        }
      } catch (e) {
        showErrorDialog('Something went wrong!!!');
      }
    });
  }

  @override
  void dispose() {
    addUserState.close();
    super.dispose();
  }
}
