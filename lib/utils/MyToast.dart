import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future <bool> myToast ({
  @required String msg,
  Color color = Colors.white,
  Color bgColor = Colors.black,
}) async => Fluttertoast.showToast(
  msg: msg,
  textColor: color,
  backgroundColor: bgColor,
  gravity: ToastGravity.TOP
);