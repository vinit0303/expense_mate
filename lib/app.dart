import 'package:expense_manager/service/route_service.dart';
import 'package:expense_manager/utils/color_const.dart';
import 'package:expense_manager/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return FlutterSizer(builder: (context, orientation, screenType) {
      return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: MaterialApp(
          title: 'BlocRX',
          debugShowCheckedModeBanner: false,
          navigatorKey: navigationKey,
          scrollBehavior: NoOverScrollScrollBehavior(),
          initialRoute: RouteConstants.splashScreen,
          onGenerateRoute: RouteManager.onGenerateRoute,
          theme: ThemeData(
            fontFamily: AppTextStyles.poppins,
            primaryColor: ColorConst.primaryBlack,
            scaffoldBackgroundColor: ColorConst.primaryBg,
            colorScheme: const ColorScheme.light(
              primary: ColorConst.primaryBlack,
            ),
            checkboxTheme: const CheckboxThemeData(
              fillColor: MaterialStatePropertyAll(ColorConst.primaryBlack),
            ),
            radioTheme: const RadioThemeData(
              fillColor: MaterialStatePropertyAll(ColorConst.primaryBlack),
            ),
          ),
        ),
      );
    });
  }
}

class NoOverScrollScrollBehavior extends MaterialScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
