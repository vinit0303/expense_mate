import 'package:expense_manager/base/base_bloc.dart';
import 'package:expense_manager/base/base_stateful_widget.dart';
import 'package:expense_manager/ui/new_expense/add_overlay.dart';
import 'package:expense_manager/utils/color_const.dart';
import 'package:expense_manager/utils/image_const.dart';
import 'package:expense_manager/utils/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends BaseState<Dashboard> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: Stack(children: [
          Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: ColorConst.appbluecolor,
              selectedItemColor: ColorConst.primaryWhite,
              unselectedItemColor: ColorConst.disselected,
              currentIndex: index,
              onTap: (value) {
                setState(() {
                  if (value == 2) {
                    return;
                  }
                  index = value;
                });
              },
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    ImageConsts.home,
                    color: ColorConst.primaryWhite,
                  ),
                  icon: Image.asset(ImageConsts.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    ImageConsts.group,
                    color: ColorConst.primaryWhite,
                  ),
                  icon: Image.asset(ImageConsts.group),
                  label: 'Group',
                ),
                const BottomNavigationBarItem(
                  icon: SizedBox(),
                  label: '',
                ),
                BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    ImageConsts.activity,
                    color: ColorConst.primaryWhite,
                  ),
                  icon: Image.asset(ImageConsts.activity),
                  label: 'Activity',
                ),
                BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    ImageConsts.person,
                    color: ColorConst.primaryWhite,
                  ),
                  icon: Image.asset(ImageConsts.person),
                  label: 'Person',
                ),
              ],
            ),
            body: RouteList().list[index],
          ),
          Positioned(
            // right: 8,
            bottom: 0,
            left: MediaQuery.of(context).size.width * .5 - 40,

            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                      topRight: Radius.circular(70)),
                  color: Colors.transparent),
              alignment: Alignment.topCenter,
              height: 83,
              width: 80,
              child: Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 4, color: ColorConst.primaryWhite),
                      color: ColorConst.appredcolor,
                      borderRadius: BorderRadius.circular(100)),
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        bottomSheet(context);
                      },
                      icon: const Icon(
                        Icons.add,
                        color: ColorConst.primaryWhite,
                        size: 32,
                      ))),
            ),
          ),
        ]));
  }

  @override
  BaseBloc? getBaseBloc() {
    return null;
  }
}
