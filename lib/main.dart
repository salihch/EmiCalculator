// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields
import 'package:emi_calculator/splash_screen.dart';

import 'result_page.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
      title: 'EMI Calculator',
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
      theme: ThemeData(primaryColor: Colors.deepPurple),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _tenureTypes = ['Months(s)', 'Year(s)'];
  String _tenureType = "Year(s)";
  String _emiResult = "";
  String _totalInterest = "";

  final TextEditingController _principalAmount = TextEditingController();
  final TextEditingController _interestRate = TextEditingController();
  final TextEditingController _tenure = TextEditingController();

  bool _switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "EMI Calculator",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
          child: Container(
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: _principalAmount,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Enter Principal Amount",
                  border: OutlineInputBorder()),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: _interestRate,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Enter Interest Rate",
                  border: OutlineInputBorder()),
            ),
          ),
          Container(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                      flex: 4,
                      child: TextField(
                        controller: _tenure,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Tenure", border: OutlineInputBorder()),
                      )),
                  Flexible(
                      flex: 1,
                      child: Column(children: [
                        Text(_tenureType,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Switch(
                            value: _switchValue,
                            onChanged: (bool value) {
                              print(value);

                              if (value) {
                                _tenureType = _tenureTypes[1];
                              } else {
                                _tenureType = _tenureTypes[0];
                              }

                              setState(() {
                                _switchValue = value;
                              });
                            })
                      ]))
                ],
              )),
          Flexible(
            child: ElevatedButton(
              child: Text("Calculate"),
              onPressed: _handleCalculation,
            ),
          ),
        ]),
      )),
    );
  }

  void _handleCalculation() {
    double A = 0.0;
    int P = int.parse(_principalAmount.text);
    double r = int.parse(_interestRate.text) / 12 / 100;
    int n = _tenureType == "Year(s)"
        ? int.parse(_tenure.text) * 12
        : int.parse(_tenure.text);
    A = (P * r * pow((1 + r), n) / (pow((1 + r), n) - 1));
    double totalInterest;
    if (_tenureType == "Year(s)") {
      totalInterest = (A * n) - P;
    } else {
      totalInterest = (A * n) - P;
    }
    _emiResult = A.toStringAsFixed(2);
    _totalInterest = totalInterest.toStringAsFixed(2);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ResultPage(
              emiResult: _emiResult,
              totalInterest: _totalInterest,
              principalAmount: _principalAmount.text)),
    );
  }
}
