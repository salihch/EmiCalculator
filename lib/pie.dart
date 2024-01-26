import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MyPieChart extends StatelessWidget {
  final String totalInterest;
  final String principalAmount;

  const MyPieChart({
    Key? key,
    required this.totalInterest,
    required this.principalAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Pie Chart",
          ),
          centerTitle: true,
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              "Blue = Principal Amount\nRed = Total Interest",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            PieChart(
              PieChartData(sections: [
                PieChartSectionData(
                  value: double.parse(totalInterest),
                  color: Colors.red,
                  radius: 55,
                  title: totalInterest,
                ),
                PieChartSectionData(
                  value: double.parse(principalAmount),
                  color: Colors.blue,
                  radius: 50,
                  title: principalAmount,
                ),
              ]),
              swapAnimationCurve: Curves.easeInOutQuint,
            ),
          ],
        ));
  }
}
