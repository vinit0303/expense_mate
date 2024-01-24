
import 'package:expense_manager/base/env_enums.dart';

class AppConfiguration {
  /// Holds the Rest API base url.
  final String baseUrl;

  /// Represents the current environment in which app is running.
  final AppEnvironment appEnvironment;

  AppConfiguration({
    required this.baseUrl,
    required this.appEnvironment,
  });
}
