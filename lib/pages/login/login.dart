import 'package:admin_app/pages/dataAnalysis/dataAnalysis.dart';
import 'package:admin_app/utils/myToast.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _phone = TextEditingController();
  bool _isPhoneSuffix = false;
  bool _isPhoneFocus = false;
  TextEditingController _pwd = TextEditingController();
  bool _isPwdSuffix = false;
  bool _isPwdFocus = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/basic/bg_login.png'),
                  fit: BoxFit.cover,
                )
              ),
            )
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Container(
                          width: 70,
                          height: 70,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/basic/logo.png'),
                              fit: BoxFit.fill
                            )
                          ),
                        ),
                        onLongPress: () {
                          setState(() {
                            _phone.text = "18320166299";
                            _pwd.text = "lingji1688";
                            _isPhoneSuffix = true;
                            _isPwdSuffix = true;
                            _isPwdFocus = false;
                            _isPhoneFocus = false;
                          });
                          _loginSubmit();
                        },
                      ),
                      Container(
                        child: Text(
                          '领积信息技术有限公司\n数据汇总',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white70
                    ),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  width: 300,
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextField(
                    controller: _phone,
                    autofocus: _isPhoneFocus,
                    cursorColor: Colors.white70,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: Colors.white
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      hintText: "请输入手机号",
                      hintStyle: TextStyle(
                        color: Colors.white70
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none
                      ),
                      suffixIcon: Visibility(
                        visible: _isPhoneSuffix,
                        child: InkWell(
                          child: Icon(
                            Icons.close,
                            color: Colors.white70,
                          ),
                          onTap: () {
                            setState(() {
                              _phone.text = '';
                              _isPhoneSuffix = false;
                            });
                          },
                        ),
                      )
                    ),
                    onSubmitted: (val) {
                      if (val.isEmpty) {
                        myToast(msg: "请输入手机号码 ");
                      } else {
                        setState(() {
                          _isPwdFocus = true;
                        });
                      }
                    },
                    onChanged: (val) {
                      if (val.isEmpty) {
                        setState(() {
                          _isPhoneSuffix = false;
                        });
                      } else {
                        if (_isPhoneSuffix == false) {
                          setState(() {
                            _isPhoneSuffix = true;
                          });
                        }
                      }
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white70
                    ),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  width: 300,
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextField(
                    controller: _pwd,
                    autofocus: _isPwdFocus,
                    cursorColor: Colors.white70,
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.white
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      hintText: "请输入密码",
                      hintStyle: TextStyle(
                        color: Colors.white70
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none
                      ),
                      suffixIcon: Visibility(
                        visible: _isPwdSuffix,
                        child: InkWell(
                          child: Icon(
                            Icons.close,
                            color: Colors.white70,
                          ),
                          onTap: () {
                            setState(() {
                              _pwd.text = '';
                              _isPwdSuffix = false;
                            });
                          },
                        ),
                      )
                    ),
                    onSubmitted: (val) {
                      if (val.isEmpty) {
                        myToast(msg: "请输入密码");
                      } else {
                        _loginSubmit();
                      }
                    },
                    onChanged: (val) {
                      if (val.isEmpty) {
                        setState(() {
                          _isPwdSuffix = false;
                        });
                      } else {
                        if (_isPwdSuffix == false) {
                          setState(() {
                            _isPwdSuffix = true;
                          });
                        }
                      }
                    },
                  ),
                ),
                RaisedButton(
                  child: Text(
                    '确认',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    _loginSubmit();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
  void _loginSubmit () {
    print(_phone.text);
    print(_pwd.text);
    if (_phone.text.isEmpty) {
      myToast(msg: "手机号不得为空");
      return;
    }
    if (_pwd.text.isEmpty) {
      myToast(msg: "密码不得为空");
      return;
    }
    if (_phone.text != "18320166299" && _pwd.text != "lingji1688") {
      myToast(msg: "账号密码错误");
      return;
    } else {
      Navigator.of(context).pushReplacementNamed('/dataAnalysis',arguments: 100000);
    }
  }
}
