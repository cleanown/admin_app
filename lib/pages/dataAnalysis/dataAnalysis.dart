import 'package:flutter/material.dart';

class DataAnalysis extends StatefulWidget {
  @override
  _DataAnalysisState createState() => _DataAnalysisState();
}

class _DataAnalysisState extends State<DataAnalysis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          child: Text(
            '数据汇总',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontSize: 50,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}