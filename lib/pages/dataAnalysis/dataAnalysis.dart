import 'package:admin_app/request/request.dart';
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
    _getDataAnalysisInfo();
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
                child: InkWell(
                  onTap: () {
                    // showDatePicker(
                    //   context: context,
                    //   initialDate: DateTime.now(),
                    //   firstDate: DateTime(1900),
                    //   lastDate: DateTime(2200),
                    //   selectableDayPredicate: (date) {
                    //     print(date);
                    //     print(DateFormat('yy-MM-dd').format(date));
                    //     return true;
                    //   }
                    // );
                    DatePicker.showDatePicker(
                      context,
                      onChanged: (date) {
                        print(date);
                      },
                      onConfirm: (date) {
                        print("confirm====>    ${DateFormat('yy-MM-dd').format(date)}");
                      },
                      locale: LocaleType.zh
                    );
                  },
                  child: Text(
                    "成交订单",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
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
                    )
                  ],
                ),
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
