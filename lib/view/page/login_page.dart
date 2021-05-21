import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_account/view/router/router_helper.dart';

/// 登录页
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          children: <Widget>[
            Text('登录', style: Theme.of(context).textTheme.headline6),
            Text('Login', style: Theme.of(context).textTheme.headline6),
            InkWell(
              child: Container(
                margin: EdgeInsets.only(top: 30, left: 50, right: 50),
                width: 100,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                child: Text(
                  "跳转注册",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () {
                _navigationSignUpPage();
              },
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.only(top: 30, left: 50, right: 50),
                width: 100,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                child: Text(
                  "跳转首页",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () {
                _navigationHomePage();
              },
            ),
          ],
        ),
      ),
    );
  }
}
