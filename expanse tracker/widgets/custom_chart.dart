import 'package:app/class/expanse.dart';
import 'package:app/class/expanse_types.dart';
import 'package:app/class/total_expanse_category.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomChart extends StatefulWidget {
  const CustomChart({super.key, required this.allExpanse});
  final List<Expanse> allExpanse;
  @override
  State<CustomChart> createState() => _CustomChartState();
}

class _CustomChartState extends State<CustomChart> {
  TooltipBehavior? _tooltipBehavior;

  List<TotalExpanseCategory> get totalExpanses {
    List<TotalExpanseCategory> l = [];
    TotalExpanseCategory foodExpanse =
        TotalExpanseCategory(type: Expansetypes.food, amount: 0);
    TotalExpanseCategory leisureExpanse =
        TotalExpanseCategory(type: Expansetypes.leisure, amount: 0);
    TotalExpanseCategory workExpanse =
        TotalExpanseCategory(type: Expansetypes.work, amount: 0);
    TotalExpanseCategory travelExpanse =
        TotalExpanseCategory(type: Expansetypes.travel, amount: 0);
    for (Expanse expanse in widget.allExpanse) {
      if (expanse.expnaseType == Expansetypes.food) {
        foodExpanse.amount += expanse.price;
      }
      if (expanse.expnaseType == Expansetypes.travel) {
        travelExpanse.amount += expanse.price;
      }
      if (expanse.expnaseType == Expansetypes.work) {
        workExpanse.amount += expanse.price;
      }
      if (expanse.expnaseType == Expansetypes.leisure) {
        leisureExpanse.amount += expanse.price;
      }
    }

    l.add(foodExpanse);
    l.add(workExpanse);
    l.add(travelExpanse);
    l.add(leisureExpanse);

    return l;
  }

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            // Chart title
            title: ChartTitle(text: 'Half yearly sales analysis'),
            // Enable legend
            legend: Legend(isVisible: true),
            // Enable tooltip
            tooltipBehavior: _tooltipBehavior,
            series: <LineSeries<TotalExpanseCategory, String>>[
          LineSeries<TotalExpanseCategory, String>(
              dataSource: totalExpanses,
              xValueMapper: (TotalExpanseCategory expanse, _) =>
                  expanse.type.toString().split('.')[1],
              yValueMapper: (TotalExpanseCategory expanse, _) => expanse.amount,
              // Enable data label
              dataLabelSettings: DataLabelSettings(isVisible: true))
        ]));
  }
}
