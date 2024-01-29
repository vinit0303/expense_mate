import 'package:expense_manager/base/base_bloc.dart';
import 'package:expense_manager/base/base_stateful_widget.dart';
import 'package:expense_manager/ui/auth/bloc/forgot_bloc.dart';
import 'package:expense_manager/utils/app_utils.dart';
import 'package:expense_manager/utils/color_const.dart';
import 'package:expense_manager/utils/extensions.dart';
import 'package:expense_manager/utils/image_const.dart';
import 'package:expense_manager/utils/text_styles.dart';
import 'package:expense_manager/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends BaseState<ForgotPasswordScreen> {
  final Forgotbloc _fotgotbloc = Forgotbloc();

  final TextEditingController _emailorphoneCTR = TextEditingController();

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
              crossAxisAlignment: CrossAxisAlignment.end,
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
                    child: Text(
                      'Have you Forgot the password?',
                      style: AppTextStyles.regular(
                          fontSize: 20, color: ColorConst.appgreycolor),
                    )),
                48.vs,
                AppTextFormFields(
                  controller: _emailorphoneCTR,
                  textInputType: TextInputType.emailAddress,
                  hint: "Email/Phone",
                  showError: true,
                  focusNode: _focusnodeEmail,
                  validator: AppUtils.validateEmail,
                  textInputAction: TextInputAction.next,
                ),
                104.vs,
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorConst.appredcolor),
                  width: double.infinity,
                  child: TextButton(
                    child: const Text("Sand Mail"),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _fotgotbloc.forgot(_emailorphoneCTR.text);
                      }
                    },
                  ),
                ),
                16.vs,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '*Verfiy your email & change your password',
                      style: AppTextStyles.regular(fontSize: 16),
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
    return _fotgotbloc;
  }
}
