import 'package:admin_app/request/request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      body: Column(
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
            indent: 5,
            endIndent: 5,
            height: 7,
            color: Colors.black,
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
