import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:lazy_account/view/custom/calendar/medic_history_provider.dart';
import 'package:lazy_account/view/page/splash_page.dart';
import 'package:lazy_account/view/router/router_config.dart';
import 'package:lazy_account/view/router/router_helper.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _MyAppState() {
    final router = FluroRouter();
    RouterConfig.configureRoutes(router);
    RouterHelper.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MedicHistoryProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashPage(),
      ),
    );
  }
}
