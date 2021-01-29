import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//折线图
class MyLineChart extends StatefulWidget {
  @override
  _MyLineChartState createState() => _MyLineChartState();
}

class DataFormat {
   String _date;
   double _value;


   DataFormat(this._date, this._value);

   String get date => _date;

   set date(String value) {
     _date = value;
   }

   double get value => _value;

  set value(double value) {
    _value = value;
  }
}

class _MyLineChartState extends State<MyLineChart> {
  List<DataFormat> listTest = [
    DataFormat("2020-1-1",120),
    DataFormat("2020-2-1",460),
    DataFormat("2020-3-1",358),
    DataFormat("2020-4-1",250),
    DataFormat("2020-5-1",444),
    DataFormat("2020-6-1",358),
    DataFormat("2020-7-1",697),
  ];
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(
            enabled: true,
            fullHeightTouchLine: true,
            handleBuiltInTouches: true,
        ),
        gridData: FlGridData(
            show: false
        ),
        titlesData: FlTitlesData(
          bottomTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            getTextStyles: (value) => const TextStyle(
              color: Color(0xff72719b),
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
            margin: 10,
            getTitles: (value) {
              print('===>${value}');
              // return listTest[value.toInt()];
              switch (value.toInt()) {
                case 0:
                  print("listTest[0]._date : "+listTest[0]._date);
                  print("listTest[0]._value : "+listTest[0]._value.toString());
                  return listTest[0]._date;
                case 1:
                  return listTest[listTest.length~/2]._date;
                case 2:
                  return listTest[listTest.length-1]._date;
              }
              return '';
            },
          ),
          leftTitles: SideTitles(
            showTitles: true,
            getTextStyles: (value) => const TextStyle(
              color: Color(0xff75729e),
              fontWeight: FontWeight.bold,
              fontSize: 14
            ),
            getTitles: (value) {
              // switch (value.toInt()) {
              //   case 1:
              //     return '1m';
              //   case 2:
              //     return '2m';
              //   case 3:
              //     return '3m';
              //   case 4:
              //     return '5m';
              //   case 5:
              //     return '6m';
              // }
              print(value.toString());
              return value.toString();
            },
            margin: 8,
            reservedSize: 30
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: const Border(
            bottom: BorderSide(
              color: Color(0xff4e4965),
              width: 4,
            ),
            left: BorderSide(
              color: Colors.transparent,
            ),
            right: BorderSide(
              color: Colors.transparent,
            ),
            top: BorderSide(
              color: Colors.transparent,
            ),
          )
        ),
        minX: 0,
        maxX: 3,
        maxY: 1000,
        minY: 0,
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, listTest[0]._value.toDouble()),
              FlSpot(1, listTest[1]._value.toDouble()),
              FlSpot(2, listTest[2]._value.toDouble()),
            ],
            isCurved: true,
            curveSmoothness: 0,
            colors: const [
              Color(0x444af699)
            ],
            barWidth: 4,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: false
            ),
            belowBarData: BarAreaData(
              show: false
            ),
          ),
        ],
      )
    );

  }
}
