import 'package:expense_manager/base/base_bloc.dart';
import 'package:expense_manager/base/base_stateful_widget.dart';
import 'package:expense_manager/service/route_service.dart';
import 'package:expense_manager/ui/profile/bloc/profile_sccreen_bloc.dart';
import 'package:expense_manager/ui/profile/model/rest/req/username_model.dart';
import 'package:expense_manager/ui/profile/state/add_username_state.dart';
import 'package:expense_manager/utils/app_utils.dart';
import 'package:expense_manager/utils/color_const.dart';
import 'package:expense_manager/utils/dialog_utils.dart';
import 'package:expense_manager/utils/extensions.dart';
import 'package:expense_manager/utils/global_var.dart';
import 'package:expense_manager/utils/list.dart';
import 'package:expense_manager/utils/text_styles.dart';
import 'package:expense_manager/widgets/app_text_field.dart';
import 'package:expense_manager/widgets/user_image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseState<ProfileScreen> {
  final AddUserBloc _addUserBloc = AddUserBloc();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _datecontroller = TextEditingController();
  final TextEditingController _gendercontroller = TextEditingController();
  final TextEditingController _newpasscontroller = TextEditingController();

  DateTime yourDate =
      DateTime.now().subtract(const Duration(days: 30 * 365 + 7));
  @override
  void initState() {
    _datecontroller.text = DateFormat('dd MMM,y')
        .format(DateTime.now().subtract(const Duration(days: 30 * 365 + 7)));
    _gendercontroller.text = 'Male';
    _addUserBloc.getuserDetail();
    super.initState();
  }

  void _handleDatepicker() async {
    final lastdate =
        DateTime(yourDate.year - 200, yourDate.month, yourDate.day);
    final DateTime today = DateTime.now();
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: yourDate,
      firstDate: lastdate,
      lastDate: today,
    );
    if (date != null && date != yourDate) {
      _datecontroller.text = DateFormat('dd MMM,y').format(date);
      yourDate = date;
      _addUserBloc.handleDate.add(date);
    }
  }

  @override
  void dispose() {
    super.dispose();
    yourDate;
  }

  final FocusNode _focusnodefirstname = FocusNode();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _addUserBloc.addUserState,
      builder: (context, AsyncSnapshot<AddUserState> snapshot) {
        if (snapshot.data?.isLoading() ?? true) {
          return const Center(
              child: CircularProgressIndicator(
            color: ColorConst.appbluecolor,
          ));
        } else {
          var userData = snapshot.data?.data;
          _firstnameController.text = userData?.firstname ?? '';
          yourDate = userData?.birthdate ?? yourDate;
          _datecontroller.text =
              DateFormat('dd MMM,y').format(userData?.birthdate ?? yourDate);

          _emailController.text = userData?.email ?? '';
          _lastnameController.text = userData?.lastName ?? '';
          _gendercontroller.text = userData?.gender ?? 'Male';
          return Scaffold(
              backgroundColor: ColorConst.primaryWhite,
              appBar: AppBar(
                title: Text(
                  'Profile',
                  style: AppTextStyles.bold(fontSize: 20),
                ),
                actions: [
                  IconButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      RouteManager.pushReplacementNamed(RouteConstants.login);
                    },
                    icon: const Icon(
                      Icons.logout_rounded,
                      color: ColorConst.primaryBlack,
                      size: 24,
                    ),
                    padding: EdgeInsets.zero,
                  )
                ],
              ),
              body: StreamBuilder(
                stream: _addUserBloc.addUserState,
                builder: (context, snapshot) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            UserImagePicker(
                                // onPickImage: (pickedImage) {
                                //   if (_selectedImage != pickedImage) {
                                //     _selectedImage = pickedImage;
                                //   }
                                //   _selectedImage;
                                // },
                                id: UserId.id,
                                imageUrl: userData?.imageUrl ?? '',
                                bloc: _addUserBloc),
                            24.hs,
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AppTextFormFields(
                                    // padding: EdgeInsets.zero,
                                    controller: _firstnameController,
                                    focusNode: _focusnodefirstname,
                                    label: 'First Name',
                                    showError: true,
                                    validator: AppUtils.validateNotEmpty,
                                  ),
                                  16.vs,
                                  AppTextFormFields(
                                    padding: EdgeInsets.zero,
                                    controller: _lastnameController,
                                    label: 'Last Name',
                                    showError: true,
                                    validator: AppUtils.validateNotEmpty,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        AppTextFormFields(
                          // padding: EdgeInsets.zero,
                          controller: _emailController,

                          label: 'Email',
                          showError: true,
                          validator: AppUtils.validateEmail,
                        ).vp(24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: AppTextFormFields(
                                onTap: () {
                                  _handleDatepicker();
                                },
                                padding: EdgeInsets.zero,
                                controller: _datecontroller,
                                readOnly: true,
                                label: 'Date Of Birth',
                                // showError: true,
                                // validator: AppUtils.validateNotEmpty,
                              ),
                            ),
                            17.hs,
                            Expanded(
                                child: StreamBuilder(
                              stream: _addUserBloc.isshowdropdown,
                              builder: (context, snapshot) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AppTextFormFields(
                                      onTap: () {
                                        _addUserBloc.isshowdropdown.add(true);
                                      },
                                      padding: EdgeInsets.zero,
                                      controller: _gendercontroller,
                                      readOnly: true,
                                      label: 'Gender',
                                      showError: true,
                                      validator: AppUtils.validateNotEmpty,
                                    ),
                                    snapshot.data == true
                                        ? Container(
                                            width: 98,
                                            height: 170,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: ColorConst
                                                        .appbluecolor),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: snapshot.data == true
                                                ? Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: DropdownListitem
                                                        .list
                                                        .map((gender) {
                                                      return ListTile(
                                                        title: Text(gender),
                                                        onTap: () {
                                                          _gendercontroller
                                                              .text = gender;
                                                          _addUserBloc
                                                              .isshowdropdown
                                                              .add(false);
                                                        },
                                                      );
                                                    }).toList(),
                                                  )
                                                : const SizedBox.shrink())
                                        : const SizedBox.shrink()
                                  ],
                                );
                              },
                            )),
                          ],
                        ),
                        StreamBuilder(
                          stream: _addUserBloc.ischangepass,
                          builder: (context, snapshot) {
                            return Column(
                              children: [
                                snapshot.data == true
                                    ? AppTextFormFields(
                                        // padding: EdgeInsets.zero,
                                        controller: _newpasscontroller,

                                        label: 'New Password',
                                        showError: true,
                                        validator: AppUtils.validateEmail,
                                      ).vp(24)
                                    : const SizedBox.shrink(),
                                40.vs,
                                InkWell(
                                  onTap: () async {
                                    if (snapshot.data == false) {
                                      _addUserBloc.ischangepass.add(true);
                                    } else {
                                      _addUserBloc.changePass(
                                          _newpasscontroller.text.trim());
                                      _addUserBloc.ischangepass.add(false);
                                    }
                                  },
                                  child: Container(
                                    height: 42,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ColorConst.appredcolor),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Center(
                                      child: Text(
                                        'Change Password',
                                        style: AppTextStyles.extrabold(
                                            fontSize: 16,
                                            color: ColorConst.appredcolor),
                                      ),
                                    ),
                                  ),
                                ),
                                (MediaQuery.of(context).size.height * .17).vs,
                              ],
                            );
                          },
                        ),
                        InkWell(
                          onTap: () {
                            _addUserBloc.editUser(
                              ReqUser(
                                  imageUrl: _addUserBloc.url.value,
                                  firstname: _firstnameController.text,
                                  birthdate: _addUserBloc.handleDate.value,
                                  id: UserId.id,
                                  lastName: _lastnameController.text,
                                  email: _emailController.text,
                                  gander: _gendercontroller.text),
                            );
                          },
                          child: Container(
                            height: 42,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: ColorConst.appredcolor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: Text(
                                'Update',
                                style: AppTextStyles.extrabold(
                                    fontSize: 16,
                                    color: ColorConst.primaryWhite),
                              ),
                            ),
                          ),
                        ),
                        16.vs,
                        InkWell(
                          onTap: () {
                            showconfirmDialog(
                                'Do you want to delete your account?', () {
                              _addUserBloc.deleteAcc(userData?.id! ?? '');

                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Account Deleted')));
                            });
                          },
                          child: Text(
                            "Delete your account?",
                            style: AppTextStyles.extrabold(
                                fontSize: 16, color: ColorConst.primaryBlack),
                          ),
                        )
                      ],
                    ).hp(16),
                  );
                },
              ));
        }
      },
    );
  }

  @override
  BaseBloc? getBaseBloc() {
    return _addUserBloc;
  }
}
