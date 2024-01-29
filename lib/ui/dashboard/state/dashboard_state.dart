import 'package:expense_manager/base/base_ui_state.dart';
import 'package:expense_manager/ui/dashboard/model/dashboard_model.dart';

class DashboardState extends BaseUiState<DashboardData> {
  DashboardState.loading() : super.loading();

  DashboardState.completed(DashboardData data) : super.completed(data: data);

  DashboardState.error(dynamic error) : super.error(error);
}
