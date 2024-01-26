import 'package:flutter/material.dart';
import 'pie.dart';

class ResultPage extends StatelessWidget {
  final String emiResult;
  final String totalInterest;
  final String principalAmount;

  const ResultPage({
    Key? key,
    required this.emiResult,
    required this.totalInterest,
    required this.principalAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'EMI Result',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Monthly EMI',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Text(
              emiResult,
              style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              'Total Interest',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Text(
              totalInterest,
              style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
            ),
            Flexible(
                child: ElevatedButton(
              child: Text("PieChart"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyPieChart(
                          totalInterest: totalInterest,
                          principalAmount: principalAmount)),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
