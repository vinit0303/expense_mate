import 'package:expense_manager/app.dart';
import 'package:expense_manager/app_configuration.dart';
import 'package:expense_manager/base/env_enums.dart';
import 'package:expense_manager/utils/app_config.dart';
import 'package:flutter/material.dart';

void start({
  required String baseUrl,
  required AppEnvironment environment,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  final appConfiguration = AppConfiguration(
    baseUrl: baseUrl,
    appEnvironment: environment,
  );

  AppConfigProvider().setAppConfig(appConfiguration);

  runApp(const MyApp());
}
