import 'package:expense_manager/base/base_response_data.dart';
import 'package:expense_manager/base/base_ui_state.dart';

class BaseDataState extends BaseUiState<BaseResponseData> {
  BaseDataState.loading() : super.loading();

  BaseDataState.completed(BaseResponseData data) : super.completed(data: data);

  BaseDataState.error(dynamic error) : super.error(error);
}
