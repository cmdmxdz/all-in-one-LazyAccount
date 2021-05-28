import 'dart:math';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'package:lazy_account/view/router/router_helper.dart';

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
                SizedBox(height: 60.0),
                buildSignUpConfirmedButton(context),
                SizedBox(height: 30.0),
                buildLoginText(context),
              ],
            )));
  }

  /// 绘制登陆
  Align buildLoginText(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('已有账号？'),
            GestureDetector(
              child: Text(
                '点击登陆',
                style: TextStyle(color: Colors.orangeAccent),
              ),
              onTap: () {
                //TODO 跳转到登陆页面
                print('去登陆');
                _navigationLoginPage();
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
                        Scaffold.of(context).showSnackBar(new SnackBar(
                          content: new Text("${item['title']}登录"),
                          action: new SnackBarAction(
                            label: "取消",
                            onPressed: () {},
                          ),
                        ));
                      });
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

  /// 绘制注册确认按钮
  Align buildSignUpConfirmedButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 45.0,
        width: 270.0,
        child: FlatButton(
          child: Text(
            '注册',
            style: Theme.of(context).primaryTextTheme.headline,
          ),
          color: Colors.orangeAccent,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              ///只有输入的内容符合要求通过才会到达此处
              _formKey.currentState.save();
              //TODO 执行注册方法
              print('email:$_email , assword:$_password');
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

  /// 绘制密码文本框
  TextFormField buildPasswordTextField(BuildContext context) {
    return TextFormField(
      onSaved: (String value) => _password = value,
      obscureText: _isObscure,
      validator: (String value) {
        if (value.isEmpty) {
          return '请输入密码';
        }
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
        labelText: '邮件地址',
      ),
      validator: (String value) {
        var emailReg = RegExp(
            r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
        if (!emailReg.hasMatch(value)) {
          return '请输入正确的邮箱地址';
        }
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
        '注册',
        style: TextStyle(fontSize: 42.0),
      ),
    );
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
