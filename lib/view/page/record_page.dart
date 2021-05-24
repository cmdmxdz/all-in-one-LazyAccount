import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 记账页
class RecordPage extends StatefulWidget {
  static const ACCOUNT_PAGE = 0;

  static const RECORD_PAGE = 1;

  static const PERSONAL_PAGE = 2;

  @override
  _RecordPageState createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  var currentPage;

  @override
  void initState() {
    super.initState();
    currentPage = RecordPage.RECORD_PAGE;
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
        child: Text("RecordPage"),
      ),
    );
  }
}