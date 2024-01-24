import 'package:expense_manager/base/base_bloc.dart';
import 'package:expense_manager/base/base_stateful_widget.dart';
import 'package:expense_manager/utils/color_const.dart';
import 'package:expense_manager/utils/extensions.dart';
import 'package:expense_manager/utils/list.dart';
import 'package:expense_manager/utils/text_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomLineChart extends StatefulWidget {
  const CustomLineChart({super.key});

  @override
  State<CustomLineChart> createState() => _CustomLineChartState();
}

class _CustomLineChartState extends BaseState<CustomLineChart> {
  double interval = 0;
  GraphList graphList = GraphList();
  @override
  void initState() {
    graphList.l();
     if (graphList.maxamount < 1000) {
      interval = ((graphList.maxamount / 100).ceil()) * 10;
    }
    else if (graphList.maxamount >= 1000) {
      interval = ((graphList.maxamount / 1000).ceil()) * 100;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        LineChart(
          mainData(),
        ).rp(20),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        '${value.toInt()} jan',
        style: AppTextStyles.regular(fontSize: 11),
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        value == 0
            ? '0'
            : (value % interval == 0 ? value.toInt().toString() : ""),
        style: AppTextStyles.regular(fontSize: 11),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: interval,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: ColorConst.dividercolor,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: ColorConst.dividercolor,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: interval,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        border: const Border(
            bottom: BorderSide.none,
            left: BorderSide.none,
            top: BorderSide.none,
            right: BorderSide(width: 1, color: ColorConst.dividercolor)),
        show: true,
      ),
      minX: 1,
      maxX: GraphList.dateList.length.toDouble(),
      minY: 0,
      maxY: graphList.maxamount.toDouble(),
      lineBarsData: [
        LineChartBarData(
          spots: graphList.list,
          isCurved: true,
          color: ColorConst.appbluecolor,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            getDotPainter: (p0, p1, p2, p3) {
              return FlDotCirclePainter(
                  radius: 4,
                  color: ColorConst.appbluecolor,
                  strokeWidth: 2,
                  strokeColor: ColorConst.primaryWhite);
            },
            show: true,
          ),
          belowBarData: BarAreaData(
              show: true, color: ColorConst.appbluecolor.withOpacity(0.3)),
        ),
      ],
    );
  }

  @override
  BaseBloc? getBaseBloc() {
    throw UnimplementedError();
  }
}
