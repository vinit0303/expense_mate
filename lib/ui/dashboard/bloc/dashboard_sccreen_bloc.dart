import 'package:expense_manager/base/base_bloc.dart';
import 'package:expense_manager/base/base_response_data.dart';
import 'package:expense_manager/ui/dashboard/repo/dashboard_repo.dart';
import 'package:expense_manager/ui/dashboard/state/dashboard_state.dart';
import 'package:expense_manager/utils/dialog_utils.dart';
import 'package:rxdart/rxdart.dart';

class DashboardBloc extends BaseBloc {
  final addeditRepo = DashboardRepo();
  var seemore = BehaviorSubject<bool>.seeded(false);

  BehaviorSubject<DashboardState> dasboardstate =
      BehaviorSubject<DashboardState>();

  void getuserDetail() async {
    subscription
        .add(
      addeditRepo
          .getuserDetail()
          .map((data) => DashboardState.completed(data))
          .onErrorReturnWith((error, stackTrace) => DashboardState.error(error))
          .listen((event) async {
        DialogUtils.hideLoader();
        dasboardstate.add(event);
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

  @override
  void dispose() {
    dasboardstate.close();
    super.dispose();
  }
}
