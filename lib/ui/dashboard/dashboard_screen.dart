import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/base/base_bloc.dart';
import 'package:expense_manager/base/base_stateful_widget.dart';
import 'package:expense_manager/utils/global_var.dart';
import 'package:expense_manager/widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:expense_manager/utils/color_const.dart';
import 'package:expense_manager/utils/extensions.dart';
import 'package:expense_manager/utils/image_const.dart';
import 'package:expense_manager/utils/text_styles.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends BaseState<DashboardScreen> {
  String name = '';
  bool _seemore = false;
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection('User')
        .doc(UserId.id)
        .get()
        .then((value) {
      setState(() {
        name = value.data()!['userName'];
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello ${name.toUpperCase()}✌️',
          style:
              AppTextStyles.bold(fontSize: 20, color: ColorConst.primaryWhite),
        ).lp(0).tp(0),
        actions: [
          InkWell(
              onTap: () {},
              child: Image.asset(
                ImageConsts.bellLogo,
                height: 24,
              ).rp(16).tp(0))
        ],
        backgroundColor: ColorConst.appbluecolor,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 50,
                  color: ColorConst.appbluecolor,
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: ColorConst.primaryWhite,
                    boxShadow: const [
                      BoxShadow(
                        color: ColorConst.dividercolor,
                        blurRadius: 10.0,
                      ), //BoxShadow
                      //BoxShadow
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 16,
                            decoration: BoxDecoration(
                                color: const Color(0xffF0F0F0),
                                borderRadius: BorderRadius.circular(16)),
                            child: Text(
                              'Mar 2023',
                              style: AppTextStyles.regular(fontSize: 10),
                            ).vp(2).hp(7),
                          )
                        ],
                      ).allp(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Available Fund',
                                style: AppTextStyles.regular(fontSize: 16),
                              ),
                              3.vs,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '₹{4800}',
                                    style: AppTextStyles.extrabold(
                                        fontSize: 24,
                                        color: ColorConst.appbluecolor),
                                  ),
                                  5.hs,
                                  InkWell(
                                    onTap: () {},
                                    child: Image.asset(
                                      ImageConsts.edit,
                                      color: ColorConst.appbluecolor,
                                      height: 16.73,
                                      width: 16.73,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Expenses',
                                style: AppTextStyles.regular(fontSize: 16),
                              ),
                              3.vs,
                              Text(
                                '₹{4900}',
                                style: AppTextStyles.extrabold(
                                    fontSize: 24,
                                    color: ColorConst.appredcolor),
                              ),
                            ],
                          ),
                        ],
                      ).hp(8).vp(4),
                    ],
                  ),
                ).hp(16),
                16.vs,
                Container(
                    height: 212,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: ColorConst.primaryWhite,
                      boxShadow: const [
                        BoxShadow(
                          color: ColorConst.dividercolor,
                          blurRadius: 10.0,
                        ), //BoxShadow
                        //BoxShadow
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Balance Trend',
                              style: AppTextStyles.medium(fontSize: 16),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Image.asset(ImageConsts.icmenu),
                            )
                          ],
                        ).tp(8).hp(12),
                        const Divider(
                          color: ColorConst.dividercolor,
                        ).hp(8),
                        const Expanded(child: CustomLineChart()),
                      ],
                    )).hp(16),
                10.vs,
                Container(
                  height: _seemore ? 372 : 272,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: ColorConst.primaryWhite,
                    boxShadow: const [
                      BoxShadow(
                        color: ColorConst.dividercolor,
                        blurRadius: 10.0,
                      ), //BoxShadow
                      //BoxShadow
                    ],
                  ),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Expenses',
                          style: AppTextStyles.bold(fontSize: 16),
                        ),
                        const Icon(Icons.menu)
                      ],
                    ).allp(8),
                    const Divider(
                      height: 0,
                      color: ColorConst.appgreycolor,
                      thickness: 0,
                    ).hp(8),
                    8.vs,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'This Month',
                          style: AppTextStyles.regular(
                              fontSize: 12, color: ColorConst.appgreycolor),
                        ),
                      ],
                    ).hp(8),
                    12.vs,
                    SizedBox(
                      height: _seemore ? 270 : 170,
                      child: ListView.builder(
                        physics: _seemore
                            ? const AlwaysScrollableScrollPhysics()
                            : const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(ImageConsts.bag),
                              12.hs,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Shopping',
                                    style: AppTextStyles.bold(fontSize: 12),
                                  ),
                                  Text(
                                    'Cash',
                                    style: AppTextStyles.regular(
                                        fontSize: 12,
                                        color: ColorConst.appgreycolor),
                                  ),
                                  Text(
                                    '"Trends"',
                                    style: AppTextStyles.regular(
                                        fontSize: 12,
                                        color: ColorConst.appgreycolor),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('₹{470}',
                                      style: AppTextStyles.bold(
                                          fontSize: 16,
                                          color: ColorConst.appredcolor)),
                                  Text(
                                    '{28 mar,2024}',
                                    style: AppTextStyles.regular(
                                        fontSize: 12,
                                        color: ColorConst.appgreycolor),
                                  )
                                ],
                              ),
                            ],
                          ).hp(8).bp(8);
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (_seemore == false) {
                                _seemore = true;
                              } else {
                                _seemore = false;
                              }
                            });
                          },
                          child: Text(
                            _seemore ? 'see less' : 'see more',
                            style: AppTextStyles.bold(
                                fontSize: 12, color: ColorConst.appbluecolor),
                          ),
                        )
                      ],
                    ).hp(8)
                  ]),
                ).hp(16),
                8.vs
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  BaseBloc? getBaseBloc() {
    throw UnimplementedError();
  }
}
