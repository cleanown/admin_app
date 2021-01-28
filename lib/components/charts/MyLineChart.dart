import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
//折线图
class MyLineChart extends StatefulWidget {
  @override
  _MyLineChartState createState() => _MyLineChartState();
}

class _MyLineChartState extends State<MyLineChart> {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(
            enabled: false
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
              switch (value.toInt()) {
                case 2:
                  return 'SEPT';
                case 7:
                  return 'OCT';
                case 12:
                  return 'DEC';
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
              switch (value.toInt()) {
                case 1:
                  return '1m';
                case 2:
                  return '2m';
                case 3:
                  return '3m';
                case 4:
                  return '5m';
                case 5:
                  return '6m';
              }
              return '';
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
        maxX: 14,
        maxY: 6,
        minY: 0,
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(1, 1),
              FlSpot(3, 4),
              FlSpot(5, 1.8),
              FlSpot(7, 5),
              FlSpot(10, 2),
              FlSpot(12, 2.2),
              FlSpot(13, 1.8),
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
          LineChartBarData(
            spots: [
              FlSpot(1, 1),
              FlSpot(3, 2.8),
              FlSpot(5, 1.8),
              FlSpot(7, 2.5),
              FlSpot(10, 6.7),
              FlSpot(12, 2.8),
              FlSpot(13, 0.8),
            ],
            isCurved: true,
            curveSmoothness: 0,
            colors: const [
              Color(0x99aaa4cfc)
            ],
            barWidth: 4,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: false
            ),
            belowBarData: BarAreaData(
              show: false,
              colors: [Color(0x33aa4cfc)]
            ),
          ),
          LineChartBarData(
            spots: [
              FlSpot(1, 3.8),
              FlSpot(3, 1.98),
              FlSpot(6, 5),
              FlSpot(10, 3.3),
              FlSpot(13, 4.5),
            ],
            isCurved: true,
            curveSmoothness: 0,
            colors: const [
              Color(0x444af699)
            ],
            barWidth: 4,
            isStrokeCapRound: true,
            dotData: FlDotData(
                show: true
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
