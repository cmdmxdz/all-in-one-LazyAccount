import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_account/view/router/router_helper.dart';

/// 启动页
class SplashPage extends StatefulWidget {
  /// 倒计时时间
  static const COUNT_DOWN_TIME = 3;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer _timer;
  int count = SplashPage.COUNT_DOWN_TIME;

  /// https://www.cnblogs.com/sangwl/p/11435191.html
  /// 广告页倒计时
  _startTime() async {
    //设置启动图生效时间
    var _duration = new Duration(seconds: 1);
    new Timer(_duration, () {
      // 空等1秒之后再计时
      _timer = new Timer.periodic(const Duration(milliseconds: 1000), (v) {
        count--;
        if (count == 0) {
          _navigationPage();
        } else {
          setState(() {});
        }
      });
      return _timer;
    });
  }

  /// 跳转页面
  void _navigationPage() {
    _timer.cancel();
    /// 要跳转的页面
    RouterHelper.router.navigateTo(context, "LoginPage",
        transition: TransitionType.inFromRight);
  }

  @override
  void initState() {
    super.initState();
    _startTime();
  }

  @override
  void dispose() {
    super.dispose();

    /// 突然关闭时，若倒计时未停止则手动停止
    if (_timer.isActive) {
      _timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('欢迎使用懒人记账应用', style: Theme.of(context).textTheme.headline6),
            Text('Welcome to use App LazyAccount',
                style: Theme.of(context).textTheme.headline6),
          ],
        ),
      ),
    );
  }
}
