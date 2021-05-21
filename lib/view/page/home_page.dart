import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_account/view/router/router_helper.dart';

/// 首页
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// 跳转注册页面
  void _navigationSignUpPage() {
    RouterHelper.router.navigateTo(context, "SignUpPage",
        transition: TransitionType.inFromRight);
  }

  /// 跳转登录页面
  void _navigationLoginPage() {
    RouterHelper.router.navigateTo(context, "LoginPage",
        transition: TransitionType.inFromRight);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('首页', style: Theme.of(context).textTheme.headline6),
            Text('Home', style: Theme.of(context).textTheme.headline6),
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
          ],
        ),
      ),
    );
  }
}
