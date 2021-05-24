import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 个人页
class PersonalPage extends StatefulWidget {
  static const ACCOUNT_PAGE = 0;

  static const RECORD_PAGE = 1;

  static const PERSONAL_PAGE = 2;

  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  var currentPage;

  @override
  void initState() {
    super.initState();
    currentPage = PersonalPage.RECORD_PAGE;
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
        child: Text("PersonalPage"),
      ),
    );
  }
}
