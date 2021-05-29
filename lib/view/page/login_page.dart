import 'dart:math';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
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

/// 页面参考链接：https://github.com/lizhuoyuan/flutter_study/blob/master/lib/page/login_page.dart
class _LoginPageState extends State<LoginPage> {
  var account;
  var password;

  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  bool _isObscure = true;
  var _iconPassword = Icons.visibility;
  Color _eyeColor;
  List _loginMethod = [
    {
      "title": "facebook",
      "icon": GroovinMaterialIcons.facebook,
    },
    {
      "title": "google",
      "icon": GroovinMaterialIcons.google,
    },
    {
      "title": "twitter",
      "icon": GroovinMaterialIcons.twitter,
    },
  ];

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

  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              children: <Widget>[
                SizedBox(
                  height: kToolbarHeight,
                ),
                buildTitle(),
                buildTitleLine(),
                SizedBox(height: 70.0),
                buildEmailTextField(),
                SizedBox(height: 30.0),
                buildPasswordTextField(context),
                buildForgetPasswordText(context),
                SizedBox(height: 60.0),
                buildLoginButton(context),
                SizedBox(height: 30.0),
                buildOtherLoginText(),
                buildOtherMethod(context),
                buildRegisterText(context),
              ],
            )));
  }

  /// 绘制注册
  Align buildRegisterText(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('没有账号？'),
            GestureDetector(
              child: Text(
                '点击注册',
                style: TextStyle(color: Colors.orangeAccent),
              ),
              onTap: () {
                //TODO 跳转到注册页面
                print('去注册');
                _navigationSignUpPage();
              },
            ),
          ],
        ),
      ),
    );
  }

  /// 绘制第三方app直接登陆
  ButtonBar buildOtherMethod(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: _loginMethod
          .map((item) => Builder(
                builder: (context) {
                  return IconButton(
                    icon: Icon(item['icon'],
                        color: Theme.of(context).iconTheme.color),
                    onPressed: () {
                      //TODO : 第三方登录方法
                      ScaffoldMessenger.of(context).showSnackBar(
                        new SnackBar(
                          content: new Text("${item['title']}登录"),
                          action: new SnackBarAction(
                            label: "取消",
                            onPressed: () {},
                          ),
                        ),
                      );
                    },
                  );
                },
              ))
          .toList(),
    );
  }

  /// 绘制其他账号登陆
  Align buildOtherLoginText() {
    return Align(
        alignment: Alignment.center,
        child: Text(
          '其他账号登录',
          style: TextStyle(color: Colors.grey, fontSize: 14.0),
        ));
  }

  /// 绘制登陆按钮
  Align buildLoginButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 45.0,
        width: 270.0,
        child: FlatButton(
          child: Text(
            'Login',
            style: Theme.of(context).primaryTextTheme.headline,
          ),
          color: Colors.orangeAccent,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              ///只有输入的内容符合要求通过才会到达此处
              _formKey.currentState.save();
              //TODO 执行登录方法
              print('email:$_email , assword:$_password');
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
            }
          },
          shape: StadiumBorder(
              side: BorderSide(
            color: Colors.transparent,
            width: 1.0,
            style: BorderStyle.solid,
          )),
        ),
      ),
    );
  }

  /// 绘制忘记密码
  Padding buildForgetPasswordText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: FlatButton(
          child: Text(
            '忘记密码？',
            style: TextStyle(fontSize: 14.0, color: Colors.grey),
          ),
          onPressed: () {
            Fluttertoast.showToast(
              //必填
              msg: '忘记密码-请重置',
              toastLength: Toast.LENGTH_SHORT,
            );
          },
        ),
      ),
    );
  }

  /// 绘制密码文本框
  TextFormField buildPasswordTextField(BuildContext context) {
    return TextFormField(
      onSaved: (String value) => _password = value,
      obscureText: _isObscure,
      validator: (String value) {
        if (value.isEmpty) {
          return '请输入密码';
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Password',
          suffixIcon: IconButton(
              icon: Icon(
                _iconPassword,
                // Icons.visibility,
                color: _eyeColor,
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                  _eyeColor = _isObscure ? Colors.grey : Colors.orangeAccent;
                  _iconPassword =
                      _isObscure ? Icons.visibility_off : Icons.visibility;
                });
              })),
    );
  }

  /// 绘制邮箱文本框
  TextFormField buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email Address',
      ),
      validator: (String value) {
        var emailReg = RegExp(
            r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
        if (!emailReg.hasMatch(value)) {
          return '请输入正确的邮箱地址';
        }
        return null;
      },
      onSaved: (String value) => _email = value,
    );
  }

  Padding buildTitleLine() {
    return Padding(
      padding: EdgeInsets.only(left: 12.0, top: 4.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          color: Colors.black,
          width: 40.0,
          height: 2.0,
        ),
      ),
    );
  }

  Padding buildTitle() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Login',
        style: TextStyle(fontSize: 42.0),
      ),
    );
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
