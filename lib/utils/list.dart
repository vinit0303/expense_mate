import 'package:expense_manager/ui/activity/activity_screen.dart';
import 'package:expense_manager/ui/dashboard/screens/dashboard_screen.dart';
import 'package:expense_manager/ui/group/group_screen.dart';
import 'package:expense_manager/ui/profile/screen/profile_screen.dart';
import 'package:expense_manager/utils/image_const.dart';
import 'package:fl_chart/fl_chart.dart';

class BottomSheetList {
  List iconList = [
    ImageConsts.category,
    ImageConsts.date,
    ImageConsts.note,
    ImageConsts.group,
    ImageConsts.person,
    ImageConsts.payment,
    ImageConsts.upload,
  ];
  List srtingList = [
    "Category",
    "Date",
    "Note",
    "Group",
    "Payee",
    "Payment Type",
    "Upload Image"
  ];
}

class RouteList {
  List list = [
    const DashboardScreen(),
    const GroupScreen(),
    null,
    const ActivityScreen(),
    const ProfileScreen()
  ];
}

class DropdownListitem {
  static const List<String> list = <String>['Male', 'Female', 'Other'];
}

class GraphList {
  static const dateList = [11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1];
  static const amountList = [
    20,
    60,
    150,
    240,
    360,
    2700,
    240,
    470,
    230,
    120,
    110,
  ];
  final maxamount =
      amountList.reduce((value, element) => value > element ? value : element);

  final list = <FlSpot>[];
  l() {
    for (var i = 0; i < amountList.length; i++) {
      list.add(FlSpot(dateList[i].toDouble(), amountList[i].toDouble()));
    }
  }
  // static final list = [
  //   const FlSpot(10, 60),
  //   const FlSpot(9, 150),
  //   const FlSpot(8, 240),
  //   const FlSpot(7, 360),
  //   const FlSpot(6, 1700),
  //   const FlSpot(5, 240),
  //   const FlSpot(4, 470),
  //   const FlSpot(3, 230),
  //   const FlSpot(2, 120),
  //   const FlSpot(1, 1000),
  // ];
}
