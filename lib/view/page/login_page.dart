import 'dart:math';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lazy_account/view/router/router_helper.dart';

/// 登录页
class LoginPage extends StatefulWidget {
  /// 登陆成功，跳转首页
  static const LOGIN_SUCCESS = 1;

  /// 未注册，注册提示弹窗
  static const JUMP_SIGN_UP = 0;

  /// 账号密码错误，登陆失败
  static const LOGIN_FAILED = -1;

  static const ACCOUNT_ENTER = 0;
  static const PASSWORD_ENTER = 1;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var account;
  var password;

  /// 跳转注册页面
  void _navigationSignUpPage() {
    RouterHelper.router.navigateTo(context, "SignUpPage",
        transition: TransitionType.inFromRight);
  }

  /// 跳转首页
  void _navigationHomePage() {
    RouterHelper.router.navigateTo(context, "HomePage",
        transition: TransitionType.inFromRight);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('登录', style: Theme.of(context).textTheme.headline6),
            Text('Login', style: Theme.of(context).textTheme.headline6),
            Container(
              width: 300,
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  // icon: Icon(Icons.text_fields),
                  labelText: '点击输入您的用户名/邮箱',
                  labelStyle: TextStyle(
                    color: Colors.orangeAccent,
                  ),
                ),
                onChanged: (value) =>
                    {_textFieldChanged(LoginPage.ACCOUNT_ENTER, value)},
                autofocus: false,
              ),
            ),
            Container(
              width: 300,
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  // icon: Icon(Icons.text_fields),
                  labelText: '点击输入您的账号密码',
                  labelStyle: TextStyle(
                    color: Colors.orangeAccent,
                  ),
                ),
                onChanged: (value) =>
                    {_textFieldChanged(LoginPage.PASSWORD_ENTER, value)},
                autofocus: false,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, left: 50, right: 50),
              child: InkWell(
                child: Container(
                  width: 100,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  child: Text(
                    "登陆",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                onTap: () {
                  switch (_login()) {
                    case LoginPage.LOGIN_SUCCESS:
                      _navigationHomePage();
                      break;
                    case LoginPage.JUMP_SIGN_UP:
                      _navigationSignUpPage();
                      break;
                    case LoginPage.LOGIN_FAILED:
                      Fluttertoast.showToast(
                        //必填
                        msg: '账号或密码错误，需要重新登陆',
                        toastLength: Toast.LENGTH_SHORT,
                      );
                      break;
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _textFieldChanged(int index, String str) {
    print("index = $index, str = $str");
    switch (index) {
      case LoginPage.ACCOUNT_ENTER:
        account = str;
        break;
      case LoginPage.PASSWORD_ENTER:
        password = str;
        break;
      default:
        print("error");
    }
  }

  /// 登陆
  int _login() {
    if (_checkIsSignedUp() && _checkIsCorrect()) {
      return LoginPage.LOGIN_SUCCESS;
    } else {
      if (!_checkIsSignedUp()) {
        return LoginPage.JUMP_SIGN_UP;
      } else {
        return LoginPage.LOGIN_FAILED;
      }
    }
  }

  /// 检查该账号是否在数据库中（是否曾经注册过）
  bool _checkIsSignedUp() {
    var boolValue = Random().nextBool();
    boolValue = true;
    print("_checkIsSignedUp: boolValue = $boolValue");
    return boolValue;
  }

  /// 检查登陆信息是否正确
  bool _checkIsCorrect() {
    var boolValue = Random().nextBool();
    boolValue = true;
    print("_checkIsCorrect: boolValue = $boolValue");
    return boolValue;
  }
}
