import 'dart:math';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lazy_account/view/router/router_helper.dart';

import 'login_page.dart';

/// 注册页
class SignUpPage extends StatefulWidget {
  /// 注册成功，跳转首页
  static const REGISTER_SUCCESS = 1;

  /// 已注册，登陆提示弹窗
  static const HAS_ACCOUNT = 0;

  /// 注册信息有误
  static const INFO_ERROR = -1;

  /// 网络等其他问题
  static const ERROR = -2;

  /// 账号密码错误，登陆失败
  static const LOGIN_FAILED = -1;
  static const ACCOUNT_ENTER = 0;
  static const PASSWORD_ENTER = 1;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var account;
  var password;

  /// 跳转登录页面
  void _navigationLoginPage() {
    RouterHelper.router.navigateTo(context, "LoginPage",
        transition: TransitionType.inFromRight);
  }

  /// 跳转首页
  void _navigationHomePage() {
    RouterHelper.router.navigateTo(context, "HomePage",
        transition: TransitionType.inFromRight);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('注册', style: Theme.of(context).textTheme.headline6),
            Text('Sign Up', style: Theme.of(context).textTheme.headline6),
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
                    {_textFieldChanged(SignUpPage.PASSWORD_ENTER, value)},
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
                    "注册",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                onTap: () {
                  switch (_register()) {
                    case SignUpPage.REGISTER_SUCCESS:
                      Fluttertoast.showToast(
                        //必填
                        msg: '直接使用注册信息登陆，进入主页',
                        toastLength: Toast.LENGTH_SHORT,
                      );
                      _navigationHomePage();
                      break;
                    case SignUpPage.HAS_ACCOUNT:
                      Fluttertoast.showToast(
                        //必填
                        msg: '已有登陆信息，返回登陆页面',
                        toastLength: Toast.LENGTH_SHORT,
                      );
                      _navigationLoginPage();
                      break;
                    case SignUpPage.INFO_ERROR:
                      Fluttertoast.showToast(
                        //必填
                        msg: '填写信息有误，需要检查注册信息',
                        toastLength: Toast.LENGTH_SHORT,
                      );
                      break;
                    case SignUpPage.ERROR:
                      Fluttertoast.showToast(
                        //必填
                        msg: '网络错误，需要重新注册',
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
      case SignUpPage.ACCOUNT_ENTER:
        account = str;
        break;
      case SignUpPage.PASSWORD_ENTER:
        password = str;
        break;
      default:
        print("error");
    }
  }

  /// 登陆
  int _register() {
    // return SignUpPage.ERROR;
    if (!_checkIsCorrect()) {
      return SignUpPage.INFO_ERROR;
    } else {
      if (!_checkIsSignedUp()) {
        return SignUpPage.REGISTER_SUCCESS;
      } else {
        return SignUpPage.HAS_ACCOUNT;
      }
    }
  }

  /// 检查该账号是否在数据库中（是否曾经注册过）
  bool _checkIsSignedUp() {
    var boolValue = Random().nextBool();
    boolValue = true;
    boolValue = false;
    print("_checkIsSignedUp: boolValue = $boolValue");
    return boolValue;
  }

  /// 检查信息是否正确
  bool _checkIsCorrect() {
    var boolValue = Random().nextBool();
    boolValue = true;
    // boolValue = false;
    print("_checkIsCorrect: boolValue = $boolValue");
    return boolValue;
  }
}
