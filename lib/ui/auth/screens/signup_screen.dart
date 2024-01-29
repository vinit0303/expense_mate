import 'package:expense_manager/base/base_bloc.dart';
import 'package:expense_manager/base/base_stateful_widget.dart';
import 'package:expense_manager/service/route_service.dart';
import 'package:expense_manager/ui/auth/bloc/signup_bloc.dart';
import 'package:expense_manager/utils/app_utils.dart';
import 'package:expense_manager/utils/color_const.dart';
import 'package:expense_manager/utils/extensions.dart';
import 'package:expense_manager/utils/image_const.dart';
import 'package:expense_manager/utils/text_styles.dart';
import 'package:expense_manager/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends BaseState<SignupScreen> {
  final SignupBloc _signupbloc = SignupBloc();

  final TextEditingController _emailorphoneCTR = TextEditingController();
  final TextEditingController _passwordCTR = TextEditingController();
  final TextEditingController _confpassword = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool isConfPasswordVisible = false;
  final FocusNode _focusnodeEmail = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                108.vs,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ImageConsts.walletLogo, height: 54)
                          .allp(9.37),
                      17.hs,
                      Text(
                        'Expense Mate',
                        style: AppTextStyles.bold(
                            fontSize: 32, color: ColorConst.appbluecolor),
                      )
                    ],
                  ),
                ),
                28.vs,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Your journey starts here - ",
                            style: AppTextStyles.regular(fontSize: 20)),
                        TextSpan(
                            text: 'Sign Un Now!',
                            style: AppTextStyles.bold(fontSize: 20))
                      ])),
                ),
                48.vs,
                AppTextFormFields(
                  controller: _emailorphoneCTR,
                  textInputType: TextInputType.emailAddress,
                  hint: "Email",
                  showError: true,
                  focusNode: _focusnodeEmail,
                  validator: AppUtils.validateEmail,
                  textInputAction: TextInputAction.next,
                ),
                24.vs,
                AppTextFormFields(
                  controller: _usernamecontroller,
                  hint: 'Username',
                  showError: true,
                  validator: AppUtils.validateNotEmpty,
                  textInputType: TextInputType.name,
                ),
                24.vs,
                AppTextFormFields(
                  controller: _passwordCTR,
                  textInputType: TextInputType.visiblePassword,
                  hint: 'password',
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
                          : Colors.grey,
                      size: 16,
                    ),
                  ),
                ),
                24.vs,
                AppTextFormFields(
                  controller: _confpassword,
                  hint: 'Confirm Password',
                  textInputType: TextInputType.visiblePassword,
                  showError: true,
                  obscureText: !isConfPasswordVisible,
                  validator: AppUtils.validateNotEmpty,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isConfPasswordVisible = !isConfPasswordVisible;
                      });
                    },
                    child: Icon(
                      Icons.visibility,
                      color: isPasswordVisible
                          ? ColorConst.primaryBlack
                          : Colors.grey,
                      size: 16,
                    ),
                  ),
                ),
                64.vs,
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorConst.appredcolor),
                  width: double.infinity,
                  child: TextButton(
                    child: const Text("SIGN UP"),
                    onPressed: () {
                      if (_passwordCTR.text == _confpassword.text) {
                        _signupbloc.signup(
                            _emailorphoneCTR.text.trim(),
                            _passwordCTR.text.trim(),
                            _usernamecontroller.text.trim());
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                'Confirm password and password must be same')));
                      }
                    },
                  ),
                ),
                16.vs,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account? ',
                        style: AppTextStyles.regular(fontSize: 16)),
                    InkWell(
                      onTap: () => RouteManager.pushReplacementNamed(
                          RouteConstants.login),
                      child: Text(
                        'Sign In',
                        style: AppTextStyles.medium(
                            fontSize: 16, color: ColorConst.appredcolor),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  BaseBloc? getBaseBloc() {
    return _signupbloc;
  }
}
