import 'package:expense_manager/base/base_bloc.dart';
import 'package:expense_manager/base/base_stateful_widget.dart';
import 'package:expense_manager/service/route_service.dart';
import 'package:expense_manager/ui/auth/bloc/login_bloc.dart';
import 'package:expense_manager/utils/app_utils.dart';
import 'package:expense_manager/utils/color_const.dart';
import 'package:expense_manager/utils/extensions.dart';
import 'package:expense_manager/utils/image_const.dart';
import 'package:expense_manager/utils/text_styles.dart';
import 'package:expense_manager/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen> {
  final LoginBloc _loginBloc = LoginBloc();

  final TextEditingController _emailorphoneCTR = TextEditingController();
  final TextEditingController _passwordCTR = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool isConfPasswordVisible = false;
  final FocusNode _focusnodeEmail = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  64.vs,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ImageConsts.walletLogo, height: 54)
                          .allp(9.37),
                      17.hs,
                      Expanded(
                        child: Text(
                          'Expense Mate',
                          style: AppTextStyles.bold(
                              fontSize: 32, color: ColorConst.appbluecolor),
                        ),
                      )
                    ],
                  ),
                  28.vs,
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Hello {hitesh} baldwa glad to see you ",
                            style: AppTextStyles.regular(fontSize: 20)),
                        TextSpan(
                            text: 'Sign In Now!',
                            style: AppTextStyles.bold(fontSize: 20))
                      ])).hp(42),
                  28.vs,
                  AppTextFormFields(
                    padding: EdgeInsets.zero,
                    controller: _emailorphoneCTR,
                    hint: "Email/Phone",
                    showError: true,
                    focusNode: _focusnodeEmail,
                    validator: AppUtils.validateEmail,
                    textInputAction: TextInputAction.next,
                  ),
                  24.vs,
                  AppTextFormFields(
                    padding: EdgeInsets.zero,
                    controller: _passwordCTR,
                    hint: 'Password',
                    showError: true,
                    obscureText: !isPasswordVisible,
                    validator: AppUtils.validateNotEmpty,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      child: Icon(
                        Icons.visibility,
                        color: isPasswordVisible
                            ? ColorConst.primaryBlack
                            : ColorConst.appgreycolor,
                        size: 16,
                      ),
                    ),
                  ),
                  4.vs,
                  InkWell(
                    onTap: () => RouteManager.pushNamed(
                        RouteConstants.forgotpasswordscreen),
                    child: Text(
                      'forgot password',
                      style: AppTextStyles.regular(
                          fontSize: 12, color: ColorConst.appgreycolor),
                    ),
                  ),
                  104.vs,
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ColorConst.appredcolor),
                    width: double.infinity,
                    child: TextButton(
                      child: const Text("LOGIN"),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _loginBloc.login(
                            _emailorphoneCTR.text.trim(),
                            _passwordCTR.text.trim(),
                          );
                        }
                      },
                    ),
                  ),
                  16.vs,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don’t have an account? ',
                          style: AppTextStyles.regular(fontSize: 16)),
                      InkWell(
                        onTap: () =>
                            RouteManager.pushNamed(RouteConstants.signup),
                        child: Text(
                          'Sign Up',
                          style: AppTextStyles.medium(
                              fontSize: 16, color: ColorConst.appredcolor),
                        ),
                      )
                    ],
                  ),
                  20.vs,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  BaseBloc? getBaseBloc() {
    return _loginBloc;
  }
}
