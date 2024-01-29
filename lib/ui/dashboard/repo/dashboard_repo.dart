import 'package:expense_manager/ui/dashboard/data_source/dashboard_data_source.dart';
import 'package:expense_manager/ui/dashboard/data_source/remote_data_source.dart';
import 'package:expense_manager/ui/dashboard/model/dashboard_model.dart';

class DashboardRepo {
  DashboardDatasource get _getDataSource => RemoteDataSource();

  Stream<DashboardData> getuserDetail() {
    return _getDataSource.getuserDetail();
  }
}
