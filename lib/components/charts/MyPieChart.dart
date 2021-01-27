import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
//饼图封装
class MyPieChart extends StatelessWidget {
  final List<charts.Series> seriesList;//定义传入的数据
  final bool animate;//动画
  MyPieChart(this.seriesList,{this.animate});
  // factory MyPieChart.init() {
  //   return new MyPieChart(
  //     _dataTest(),
  //     animate: false,
  //   );
  // }
  // static List<charts.Series<PieDataFormat, int>> _dataTest () {
  //   final data = [
  //     new PieDataFormat(1, 100),
  //     new PieDataFormat(2, 200),
  //     new PieDataFormat(3, 300),
  //     new PieDataFormat(4, 400),
  //     new PieDataFormat(5, 500),
  //   ];
  //   return [
  //     new charts.Series(
  //       id: 'Sales',
  //       data: data,
  //       domainFn: (PieDataFormat test, _) => test.year,
  //       measureFn: (PieDataFormat test, _) => test.sales,
  //       labelAccessorFn: (PieDataFormat test, _) => '${test.year}: ${test.sales}',
  //     )
  //   ];
  // }
  @override
  Widget build(BuildContext context) {//绘画图标
    return new charts.PieChart(
      seriesList,
      animate: animate,
      defaultRenderer: new charts.ArcRendererConfig(
        arcWidth: 60,
        arcRendererDecorators: [new charts.ArcLabelDecorator()]
      ),
    );
  }
}

class PieDataFormat {//格式要求
  final int year;
  final int sales;
  PieDataFormat(this.year, this.sales);
}