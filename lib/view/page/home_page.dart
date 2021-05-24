import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lazy_account/view/page/account_page.dart';
import 'package:lazy_account/view/page/personal_page.dart';
import 'package:lazy_account/view/page/record_page.dart';

/// 首页
class HomePage extends StatefulWidget {
  /// 账户页面下标
  static const ACCOUNT_PAGE = 0;

  /// 记账页面下标
  static const RECORD_PAGE = 1;

  /// 个人页面下标
  static const PERSONAL_PAGE = 2;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// 当前下标
  var _currentPageIndex;

  /// tab页面
  var accountPage, recordPage, personalPage;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = HomePage.RECORD_PAGE;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: getCurrentBody(),
//      CupertinoTabBar 是IOS分格
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        elevation: 8.0,
        type: BottomNavigationBarType.fixed,
//        selectedItemColor: ThemeUtils.getNavigatorSelectTextColor(context),
//        unselectedItemColor: ThemeUtils.getNavigatorUnSelectTextColor(context),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 15,
        unselectedFontSize: 12,
//        selectedLabelStyle: navSelTextStyle,
//        unselectedLabelStyle: navUnSelTextStyle,
//        backgroundColor: ThemeUtils.getNavigatorBgColor(context),
        mouseCursor: SystemMouseCursors.none,
        onTap: ((index) {
          setState(() {
            _currentPageIndex = index;
          });
        }),
        items: [
          BottomNavigationBarItem(
            label: ("账本"),
            icon: Icon(
              Icons.book,
              color: Colors.orangeAccent,
            ),
          ),
          BottomNavigationBarItem(
            label: ("记账"),
            icon: Icon(
              Icons.add_circle,
              color: Colors.orangeAccent,
            ),
          ),
          BottomNavigationBarItem(
            label: ("个人"),
            icon: Icon(
              Icons.account_circle,
              color: Colors.orangeAccent,
            ),
          ),
        ],
      ),
    );
  }

  ///当前页面body样式
  getCurrentBody() {
    switch (_currentPageIndex) {
      case HomePage.ACCOUNT_PAGE:
        //  ??运算，当homePage为空时将new HomePage()赋值给homePage，否则保持不变
        accountPage ??= new AccountPage();
        return accountPage;
        break;
      case HomePage.RECORD_PAGE:
        recordPage ??= new RecordPage();
        return recordPage;
        break;
      case HomePage.PERSONAL_PAGE:
        personalPage ??= new PersonalPage();
        return personalPage;
        break;
    }
    return Container(
      child: Text("error"),
    );
  }
}
