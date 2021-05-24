import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 账户页
class AccountPage extends StatefulWidget {
  static const ACCOUNT_PAGE = 0;

  static const RECORD_PAGE = 1;

  static const PERSONAL_PAGE = 2;

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  var currentPage;

  @override
  void initState() {
    super.initState();
    currentPage = AccountPage.RECORD_PAGE;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text("AccountPage"),
      ),
    );
  }
}
