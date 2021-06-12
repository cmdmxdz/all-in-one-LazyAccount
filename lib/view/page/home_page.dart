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

  ///保存页面的List
  List<Widget> pageList = [];

  /// 初始化控制器
  PageController pageController;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = HomePage.RECORD_PAGE;

    ///创建控制器的实例
    pageController = new PageController(
      ///用来配置PageView中默认显示的页面 从中间页面开始
      initialPage: HomePage.RECORD_PAGE,

      ///为true是保持加载的每个页面的状态
      keepPage: true,
    );

    ///PageView设置滑动监听
    pageController.addListener(() {
      //PageView滑动的距离
      double offset = pageController.offset;
      print("pageView 滑动的距离 $offset");
    });

    ///保存标签页面
    pageList = [
      accountPage ??= new AccountPage(),
      recordPage ??= new RecordPage(),
      personalPage ??= new PersonalPage(),
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  //底部导航栏按钮点击事件
  //动画切换页面
  void _onTapHandler(int index) {
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  //滑动切换页面
  void _onPageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // pageController.animateTo(
    //     MediaQuery.of(context).size.width * _currentPageIndex,
    //     duration: Duration(milliseconds: 200),
    //     curve: Curves.linear);
    return new Scaffold(
      body: PageView.builder(
          onPageChanged: _onPageChanged,
          controller: pageController,
          itemCount: pageList.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return pageList[index];
          }), //      CupertinoTabBar 是IOS分格
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
        onTap: _onTapHandler,
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

  ///封装方法构建PageView组件
  PageView buildBodyFunction() {
    ///可实现左右页面滑动切换
    return PageView(
      //当页面选中后回调此方法
      //参数[index]是当前滑动到的页面角标索引 从0开始
      onPageChanged: (int index) {
        print("当前的页面是 $index");

        /// 滑动PageView时，对应切换选择高亮的标签
        setState(() {
          _currentPageIndex = index;
        });
      },
      //值为flase时 显示第一个页面 然后从左向右开始滑动
      //值为true时 显示最后一个页面 然后从右向左开始滑动
      reverse: false,
      //滑动到页面底部无回弹效果
      physics: BouncingScrollPhysics(),
      //横向滑动切换
      scrollDirection: Axis.horizontal,
      //页面控制器
      controller: pageController,
      //所有的子Widget
      children: pageList,
    );
  }
}
