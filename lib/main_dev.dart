
import 'package:expense_manager/base/env_enums.dart';
import 'package:expense_manager/firebase_options.dart';
import 'package:expense_manager/main_base.dart';
import 'package:expense_manager/utils/rest_const.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  start(
    baseUrl: RestConst.baseDev,
    environment: AppEnvironment.development,
  );
}
