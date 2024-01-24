import 'package:expense_manager/service/route_service.dart';
import 'package:expense_manager/utils/color_const.dart';
import 'package:expense_manager/utils/extensions.dart';
import 'package:expense_manager/utils/image_const.dart';
import 'package:expense_manager/utils/text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen() {
    Future.delayed(const Duration(seconds: 2), () {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null ) {
          RouteManager.pushReplacementNamed(RouteConstants.login);
        } else {
          RouteManager.pushReplacementNamed(RouteConstants.dashboard);
        }
      });
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.appbluecolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageConsts.appLogo,
              height: 56.dp,
              width: 56.dp,
            ),
            10.vs,
            Text(
              'Expanse Mate',
              style: AppTextStyles.bold(
                  fontSize: 30, color: ColorConst.primaryWhite),
            )
          ],
        ),
      ),
    );
  }
}
