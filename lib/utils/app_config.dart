

import 'package:expense_manager/app_configuration.dart';
import 'package:expense_manager/base/env_enums.dart';

class AppConfigProvider {
  AppConfiguration? appConfiguration;
  static final _instance = AppConfigProvider._internal();

  AppConfigProvider._internal();

  void setAppConfig(AppConfiguration appConfiguration) {
    this.appConfiguration = appConfiguration;
  }

  factory AppConfigProvider() {
    return _instance;
  }

  String get getBaseurl => appConfiguration!.baseUrl;
  AppEnvironment get getAppEnv => appConfiguration!.appEnvironment;
}
