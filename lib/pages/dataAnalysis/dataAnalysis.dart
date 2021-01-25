import 'package:admin_app/request/request.dart';
import 'package:admin_app/utils/MyToast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
class DataAnalysis extends StatefulWidget {
  final arguments;
  DataAnalysis({
    this.arguments,
  });
  @override
  _DataAnalysisState createState() => _DataAnalysisState();
}

class _DataAnalysisState extends State<DataAnalysis> {

  @override
  void initState() {
    super.initState();
    // _getDataAnalysisInfo();
  }

  //成交订单搜索
  DateTime _orderStartTime = DateTime.now().subtract(Duration(days: 7));
  bool _isOrderStartClose = true;
  Color _orderStartColor = Colors.black;
  DateTime _orderEndTime = DateTime.now();
  bool _isOrderEndClose = true;
  Color _orderEndColor = Colors.black;
  //交易走势图
  DateTime _trendStartTime = DateTime.now().subtract(Duration(days: 7));
  bool _isTrendStartClose = true;
  Color _trendStartColor = Colors.black;
  DateTime _trendEndTime = DateTime.now();
  bool _isTrendEndClose = true;
  Color _trendEndColor = Colors.black;

  //金额换算
  String moneyChange (int val) {
    if (val == null) {
      myToast(msg: "金额错误");
      return null;
    }
    String changeVal;
    return changeVal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("数据汇总"),
        backgroundColor: Color.fromRGBO(35, 54, 69, 1),
        centerTitle: true,
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
          ),
          onTap: () {
            Navigator.pushNamed(context, "/login");
          },
        ),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "成交订单",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(
                height: 1,
                color: Colors.black,
              ),
              Container(
                height: 160,
                margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black26,
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      color: Colors.black12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "今日成交",
                            style: TextStyle(
                                fontSize: 16
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 1,
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                child: Text(
                                  "人均消费",
                                  style: TextStyle(
                                      fontSize: 16
                                  ),
                                ),
                              ),
                              Text(
                                "￥0",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    "成交量",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                Text(
                                  "0",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 80,
                            width: 1,
                            color: Colors.black26,
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    "成交额",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                Text(
                                  "￥0",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 160,
                margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black26,
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      color: Colors.black12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "昨日成交",
                            style: TextStyle(
                                fontSize: 16
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 1,
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                child: Text(
                                  "人均消费",
                                  style: TextStyle(
                                      fontSize: 16
                                  ),
                                ),
                              ),
                              Text(
                                "￥0",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    "成交量",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                Text(
                                  "0",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 80,
                            width: 1,
                            color: Colors.black26,
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    "成交额",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                Text(
                                  "￥0",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 160,
                margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black26,
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      color: Colors.black12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "近7日成交",
                            style: TextStyle(
                                fontSize: 16
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 1,
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                child: Text(
                                  "人均消费",
                                  style: TextStyle(
                                      fontSize: 16
                                  ),
                                ),
                              ),
                              Text(
                                "￥0",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    "成交量",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                Text(
                                  "0",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 80,
                            width: 1,
                            color: Colors.black26,
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    "成交额",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                Text(
                                  "￥0",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 160,
                margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black26,
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      color: Colors.black12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: 130,
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                      color: Colors.black38,
                                      size: 16,
                                    ),
                                    InkWell(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 5),
                                        child: Text(
                                          '${_orderStartTime != null ? DateFormat('yyyy-MM-dd').format(_orderStartTime) : '开始时间'}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: _orderStartColor,
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        DatePicker.showDatePicker(
                                          context,
                                          maxTime: DateTime.now(),
                                          onConfirm: (date) {
                                            setState(() {
                                              _orderStartTime = date;
                                              _isOrderStartClose = true;
                                              _orderStartColor = Colors.black;
                                            });
                                          },
                                          locale: LocaleType.zh,
                                        );
                                      },
                                    ),
                                    Visibility(
                                      visible: _isOrderStartClose,
                                      child: InkWell(
                                        child: Container(
                                          width: 15,
                                          height: 15,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(
                                              color: Colors.black38
                                            )
                                          ),
                                          child: Icon(
                                            Icons.close_rounded,
                                            color: Colors.black38,
                                            size: 12,
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            _orderStartTime = null;
                                            _isOrderStartClose = false;
                                            _orderStartColor = Colors.black38;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text('  -  '),
                              Container(
                                height: 30,
                                width: 130,
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                      color: Colors.black38,
                                      size: 16,
                                    ),
                                    InkWell(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 5),
                                        child: Text(
                                          '${_orderEndTime != null ? DateFormat('yyyy-MM-dd').format(_orderEndTime) : '结束时间'}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: _orderEndColor,
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        DatePicker.showDatePicker(
                                          context,
                                          maxTime: DateTime.now(),
                                          onConfirm: (date) {
                                            setState(() {
                                              _orderEndTime = date;
                                              _isOrderEndClose = true;
                                              _orderEndColor = Colors.black;
                                            });
                                          },
                                          locale: LocaleType.zh,
                                        );
                                      },
                                    ),
                                    Visibility(
                                      visible: _isOrderEndClose,
                                      child: InkWell(
                                        child: Container(
                                          width: 15,
                                          height: 15,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: Colors.black38
                                              )
                                          ),
                                          child: Icon(
                                            Icons.close_rounded,
                                            color: Colors.black38,
                                            size: 12,
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            _orderEndTime = null;
                                            _isOrderEndClose = false;
                                            _orderEndColor = Colors.black38;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          FlatButton(
                            height: 30,
                            minWidth: 60,
                            color: Colors.blue,
                            child: Text(
                              '搜索',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              if (_orderStartTime != null && _orderEndTime == null){
                                myToast(msg: "请选择结束时间");
                                return;
                              } else if (_orderStartTime == null && _orderEndTime != null) {
                                myToast(msg: "请选择开始时间");
                                return;
                              } else if (_orderStartTime != null && _orderEndTime != null) {
                                if (DateTime.parse(DateFormat('yyyy-MM-dd').format(_orderStartTime)).microsecondsSinceEpoch > DateTime.parse(DateFormat('yyyy-MM-dd').format(_orderEndTime)).microsecondsSinceEpoch){
                                  myToast(msg: "开始时间不得大于结束时间");
                                  return;
                                }
                              }
                              print(_orderStartTime);
                              print(_orderEndTime);
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    "成交量",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                Text(
                                  "0",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 80,
                            width: 1,
                            color: Colors.black26,
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    "成交额",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                Text(
                                  "￥0",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 80,
                            width: 1,
                            color: Colors.black26,
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    "人均消费",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                Text(
                                  "￥0",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.green,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "交易走势图",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(
                height: 1,
                color: Colors.black,
              ),
              Container(
                height: 260,
                margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black26,
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      color: Colors.black12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: 130,
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                      color: Colors.black38,
                                      size: 16,
                                    ),
                                    InkWell(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 5),
                                        child: Text(
                                          '${_trendStartTime != null ? DateFormat('yyyy-MM-dd').format(_trendStartTime) : '开始时间'}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: _trendStartColor,
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        DatePicker.showDatePicker(
                                          context,
                                          maxTime: DateTime.now(),
                                          onConfirm: (date) {
                                            setState(() {
                                              _trendStartTime = date;
                                              _isTrendStartClose = true;
                                              _trendStartColor = Colors.black;
                                            });
                                          },
                                          locale: LocaleType.zh,
                                        );
                                      },
                                    ),
                                    Visibility(
                                      visible: _isTrendStartClose,
                                      child: InkWell(
                                        child: Container(
                                          width: 15,
                                          height: 15,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: Colors.black38
                                              )
                                          ),
                                          child: Icon(
                                            Icons.close_rounded,
                                            color: Colors.black38,
                                            size: 12,
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            _trendStartTime = null;
                                            _isTrendStartClose = false;
                                            _trendStartColor = Colors.black38;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text('  -  '),
                              Container(
                                height: 30,
                                width: 130,
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                      color: Colors.black38,
                                      size: 16,
                                    ),
                                    InkWell(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 5),
                                        child: Text(
                                          '${_trendEndTime != null ? DateFormat('yyyy-MM-dd').format(_trendEndTime) : '结束时间'}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: _trendEndColor,
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        DatePicker.showDatePicker(
                                          context,
                                          maxTime: DateTime.now(),
                                          onConfirm: (date) {
                                            setState(() {
                                              _trendEndTime = date;
                                              _isTrendEndClose = true;
                                              _trendEndColor = Colors.black;
                                            });
                                          },
                                          locale: LocaleType.zh,
                                        );
                                      },
                                    ),
                                    Visibility(
                                      visible: _isTrendEndClose,
                                      child: InkWell(
                                        child: Container(
                                          width: 15,
                                          height: 15,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: Colors.black38
                                              )
                                          ),
                                          child: Icon(
                                            Icons.close_rounded,
                                            color: Colors.black38,
                                            size: 12,
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            _trendEndTime = null;
                                            _isTrendEndClose = false;
                                            _trendEndColor = Colors.black38;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          FlatButton(
                            height: 30,
                            minWidth: 60,
                            color: Colors.blue,
                            child: Text(
                              '搜索',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              if (_trendStartTime != null && _trendEndTime == null){
                                myToast(msg: "请选择结束时间");
                                return;
                              } else if (_trendStartTime == null && _trendEndTime != null) {
                                myToast(msg: "请选择开始时间");
                                return;
                              } else if (_trendStartTime != null && _trendEndTime != null) {
                                if (DateTime.parse(DateFormat('yyyy-MM-dd').format(_trendStartTime)).microsecondsSinceEpoch > DateTime.parse(DateFormat('yyyy-MM-dd').format(_trendEndTime)).microsecondsSinceEpoch){
                                  myToast(msg: "开始时间不得大于结束时间");
                                  return;
                                }
                              }
                              print(_trendStartTime);
                              print(_trendEndTime);
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 200,
                      child: Text('11111111'),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "单品销售TOP榜",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(
                height: 1,
                color: Colors.black,
              ),
            ],
          ),
        ],
      )
    );
  }

  void _getDataAnalysisInfo () {
    httpRequest(
      url: "menu_list",
      success: (res) {
        print(res);
      }
    );
  }
}
