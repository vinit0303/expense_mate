
import 'package:expense_manager/base/env_enums.dart';
import 'package:expense_manager/utils/rest_const.dart';

import 'main_base.dart';

void main() {
  start(
    baseUrl: RestConst.baseProd,
    environment: AppEnvironment.production,
  );
}
