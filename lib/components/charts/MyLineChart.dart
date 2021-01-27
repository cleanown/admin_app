import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
//折线图
class MyLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;//数据源
  final bool animate;//动画

  MyLineChart(this.seriesList, {this.animate});

  // factory MyLineChart.init() {
  //   return new MyLineChart(
  //     _lineData(),
  //     animate: false,
  //   );
  // }

  @override
  Widget build(BuildContext context) {//绘制
    return charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      behaviors: [
        new charts.RangeAnnotation([
          new charts.LineAnnotationSegment(
            DateTime(2020,1,10),
            charts.RangeAnnotationAxisType.domain,
            // startLabel: '2020-1-6'
          ),
          new charts.LineAnnotationSegment(
            DateTime(2020,6,10),
            charts.RangeAnnotationAxisType.domain,
            // endLabel: '2020-5-6'
          ),
        ])
      ],
    );
  }

  // static List<charts.Series<LineDataFormat, DateTime>> _lineData () {
  //   final data = [
  //     new LineDataFormat(DateTime(2020,1,10), 1000),
  //     new LineDataFormat(DateTime(2020,2,10), 1200),
  //     new LineDataFormat(DateTime(2020,3,10), 13000),
  //     new LineDataFormat(DateTime(2020,4,10), 1000),
  //     new LineDataFormat(DateTime(2020,5,10), 4000),
  //     new LineDataFormat(DateTime(2020,6,10), 100),
  //   ];
  //   return [
  //     new charts.Series<LineDataFormat, DateTime>(
  //       id: 'sales',
  //       domainFn: (LineDataFormat row, _) => row.year,
  //       measureFn: (LineDataFormat row, _) => row.sales,
  //       data: data,
  //     )
  //   ];
  // }
}

class LineDataFormat {//格式要求
  final DateTime year;
  final int sales;

  LineDataFormat(this.year, this.sales);
}