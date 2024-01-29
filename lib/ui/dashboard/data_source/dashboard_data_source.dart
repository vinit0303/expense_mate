import 'package:expense_manager/ui/dashboard/model/dashboard_model.dart';

abstract class DashboardDatasource {
  Stream<DashboardData> getuserDetail();
}
