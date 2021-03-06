import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_account/model/account.dart';

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

  /// 账号信息
  var accountList = <Account>[];

  @override
  void initState() {
    super.initState();
    currentPage = AccountPage.RECORD_PAGE;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _initData(BuildContext context) {
    if (null != accountList || accountList.isNotEmpty) {
      accountList.clear();
    }
    accountList.add(Account(0, "cash", "content", 1000));
    accountList.add(Account(1, "card", "content2", 1000.9));
    accountList.add(Account(2, "other", "content3", 1080));
  }

  @override
  Widget build(BuildContext context) {
    _initData(context);
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              height: 20,
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return _getAccountSubWidget(context, accountList[index]);
                },
                separatorBuilder: (context, index) => Container(
                      height: 30,
                    ),
                itemCount: accountList?.length ?? 0),
            Container(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  /// second-day-主要活动时间段控件
  Widget _getAccountSubWidget(BuildContext context, Account account) {
    return _getShadowWidget(
      null,
      0.toDouble(),
      0.toDouble(),
      30.toDouble(),
      30.toDouble(),
      InkWell(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                  top: 10,
                  bottom: 10,
                ),
                child: Image.asset(
                  "images/icon_help.png",
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // height: 50,
                      margin: EdgeInsets.only(
                        top: 20,
                        bottom: 10,
                      ),
                      alignment: Alignment.topLeft,
                      child: Text(
                        account.name ?? "",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ),
                    Container(
                      // height: 50,
                      margin: EdgeInsets.only(
                        bottom: 20,
                      ),
                      alignment: Alignment.topLeft,
                      child: Text(
                        account.content ?? "",
                        style: TextStyle(
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              Container(
                // height: 50,
                margin: EdgeInsets.only(
                  right: 30,
                ),
                alignment: Alignment.topLeft,
                child: Text(
                  account.moneyNum.toString() ?? "",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.orangeAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          print("onTap: ${account.name ?? "account"}");
        },
      ),
    );
  }

  /// 方框阴影
  Widget _getShadowWidget(num height, num marginTop, num marginBottom,
      num marginLeft, num marginRight, Widget subWidget) {
    return Container(
      height: null == height ? null : height,
      margin: EdgeInsets.only(
        top: null == marginTop ? null : marginTop,
        left: marginLeft,
        right: marginRight,
        bottom: null == marginBottom ? null : marginBottom,
      ),
      decoration: BoxDecoration(
          color: Color(0xCCFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            //refer to :https://ninghao.net/video/6443
            BoxShadow(
                color: Color(0xFFDBDEE3),
                offset: Offset(12, 12),
                blurRadius: 20,
                spreadRadius: 0.0),
          ]),
      child: subWidget,
    );
  }
}
