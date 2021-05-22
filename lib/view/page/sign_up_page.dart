import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_account/view/router/router_helper.dart';

/// 注册页
class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

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
                  "跳转登录",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () {
                _navigationLoginPage();
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
