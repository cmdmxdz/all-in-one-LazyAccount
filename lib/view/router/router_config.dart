import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:lazy_account/view/page/home_page.dart';
import 'package:lazy_account/view/page/login_page.dart';
import 'package:lazy_account/view/page/sign_up_page.dart';
import 'package:lazy_account/view/page/splash_page.dart';

/// 路由配置文件
class RouterConfig {
  static void configureRoutes(FluroRouter router) {
    /// 启动页
    var splashPage = Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return SplashPage();
    });
    router.define("SplashPage", handler: splashPage);

    /// 登录页
    var loginPage = Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return LoginPage();
    });
    router.define("LoginPage", handler: loginPage);

    /// 注册页
    var signUpPage = Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return SignUpPage();
    });
    router.define("SignUpPage", handler: signUpPage);

    /// 首页
    var homePage = Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return HomePage();
    });
    router.define("HomePage", handler: homePage);
  }
}
