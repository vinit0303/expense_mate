import 'package:expense_manager/utils/color_const.dart';
import 'package:expense_manager/utils/extensions.dart';
import 'package:expense_manager/utils/list.dart';
import 'package:expense_manager/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

bottomSheet(context) {
  DateTime yourDate = DateTime.now();
  DateTime date = DateTime.now();

  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return NewWidget(yourDate: yourDate, date: date);
    },
  );
}

String getTimerSteampFormessge(DateTime yourdate) {
  int diff = DateTime.now()
      .difference(DateTime(yourdate.year, yourdate.month, yourdate.day))
      .inDays;

  switch (diff) {
    case 0:
      return "Today,${DateFormat('hh:mm a').format(yourdate)}";
    case 1:
      return "Yesterday,${DateFormat('hh:mm a').format(yourdate)}";
    default:
      return DateFormat('MMMd,hh:mm a').format(yourdate);
  }
}


// ignore: must_be_immutable
class NewWidget extends StatefulWidget {
  NewWidget({
    super.key,
    required this.yourDate,
    required this. date,
  });

  DateTime yourDate;
   DateTime date;

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  void _handleDatepicker() async {
    final lastdate = DateTime(widget.yourDate.year - 2023,
        widget.yourDate.month, widget.yourDate.day);
    final DateTime today = DateTime.now();
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: lastdate,
      lastDate: today,
    );
    if (date != null && date != widget.yourDate) {
      setState(() {
        widget.yourDate = date;
      });
    }
  }

  @override
  void initState() {
    selectedBtn = 0;
    super.initState();
  }

  var selectedBtn = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        10.vs,
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorConst.primaryBlack,
          ),
          height: 5,
          width: 88,
        ),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.9),
              color: const Color(0x3c3c435c),
            ),
            height: 28,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedBtn = 0;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.93),
                        color: selectedBtn == 0
                            ? ColorConst.appredcolor
                            : Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          'Expense',
                          style: AppTextStyles.bold(
                              fontSize: 13,
                              color: selectedBtn == 0
                                  ? ColorConst.primaryWhite
                                  : ColorConst.primaryBlack),
                        ),
                      ),
                    ),
                  ),
                ),
                const VerticalDivider(
                  width: 0,
                  color: ColorConst.appgreycolor,
                ).vp(6),
                Flexible(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedBtn = 1;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.93),
                          color: selectedBtn == 1
                              ? ColorConst.appbluecolor
                              : Colors.transparent),
                      child: Center(
                        child: Text(
                          'Income',
                          style: AppTextStyles.bold(
                              fontSize: 13,
                              color: selectedBtn == 1
                                  ? ColorConst.primaryWhite
                                  : ColorConst.primaryBlack),
                        ),
                      ),
                    ),
                  ),
                ),
                const VerticalDivider(
                  width: 0,
                  color: ColorConst.appgreycolor,
                ).vp(6),
                Flexible(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedBtn = 2;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.93),
                        color: selectedBtn == 2
                            ? ColorConst.primaryWhite
                            : Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          'Transfer',
                          style: AppTextStyles.bold(
                              fontSize: 13, color: ColorConst.primaryBlack),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )).tp(33).hp(16),
        28.vs,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 24,
              width: 58,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: ColorConst.dividercolor,
              ),
              child: Center(
                child: Text(
                  '₹ INR',
                  style: AppTextStyles.regular(fontSize: 16),
                ),
              ),
            ),
            selectedBtn == 1
                ? Text(
                    '+700',
                    style: AppTextStyles.bold(
                        fontSize: 34, color: ColorConst.appbluecolor),
                  )
                : Text(
                    selectedBtn == 2 ? '-900' : '-400',
                    style: AppTextStyles.bold(
                        fontSize: 34, color: ColorConst.appredcolor),
                  )
          ],
        ).hp(16),
        const Divider(),
        ListView.separated(
          shrinkWrap: true,
          itemCount: BottomSheetList().iconList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                if (BottomSheetList().srtingList[index] == "Date") {
                  _handleDatepicker();
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        BottomSheetList().iconList[index],
                        height: 24,
                        color: ColorConst.primaryBlack,
                      ),
                      16.hs,
                      Text(
                        BottomSheetList().srtingList[index],
                        style: AppTextStyles.regular(fontSize: 16),
                      )
                    ],
                  ),
                  BottomSheetList().srtingList[index] != "Date"
                      ? Row(
                          children: [
                            BottomSheetList().srtingList[index] == "Category"
                                ? const Text('Required')
                                : const Text(''),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 14,
                            )
                          ],
                        )
                      : Row(
                          children: [
                            Text(getTimerSteampFormessge(widget.yourDate)),
                          ],
                        )
                ],
              ).vp(8).hp(16),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              color: ColorConst.dividercolor,
              thickness: 1,
            );
          },
        ),
        const Divider(
          color: ColorConst.dividercolor,
          thickness: 1,
        ),
        12.vs,
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorConst.appredcolor,
          ),
          width: double.infinity,
          height: 42,
          child: Center(
            child: Text(
              'Save',
              style: AppTextStyles.extrabold(
                  fontSize: 16, color: ColorConst.primaryWhite),
            ),
          ),
        ).hp(16).bp(22)
      ],
    );
  }
}
