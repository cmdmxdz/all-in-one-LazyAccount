import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_account/model/personal_user_info.dart';

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

  var cardList = <UserInfo>[];

  @override
  void initState() {
    super.initState();
    currentPage = PersonalPage.RECORD_PAGE;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _initData() {
    if (cardList.isNotEmpty) {
      cardList.clear();
    }
    cardList.add(
        UserInfo(0, 0, "images/default_avatar.png", "name1", "infoContent1"));
    cardList.add(
        UserInfo(0, 1, "images/default_avatar.png", "name2", "infoContent2"));
    cardList.add(
        UserInfo(1, 0, "images/default_avatar.png", "name3", "infoContent3"));
    cardList.add(
        UserInfo(1, 1, "images/default_avatar.png", "name4", "infoContent4"));
    cardList.add(
        UserInfo(2, 0, "images/default_avatar.png", "name5", "infoContent5"));
  }

  @override
  Widget build(BuildContext context) {
    _initData();
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 100,
                color: Colors.orangeAccent,
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 50, left: 50, right: 50, bottom: 30),
                color: Colors.transparent,
                child: Card(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 50, right: 50),
                        child: headerWidget,
                      ),
                      Container(
                        child: Text("name"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            // margin: EdgeInsets.only(
            //   left: 20,
            //   right: 20,
            // ),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return _getCardWidget(index, cardList[index]);
                },
                itemCount: cardList?.length ?? 0),
          ),
          Container(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget headerWidget = Container(
    height: 150,
//    color: Colors.yellow[600],
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 84,
          height: 84,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.yellow[800], width: 1),
              borderRadius: BorderRadius.circular(42)),
          child: ClipOval(
            child: Image.asset(
              'images/default_avatar.png',
              width: 83,
              height: 83,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(
            'Bliss',
            style: TextStyle(
                fontSize: 18.0,
                color: Color(0x824E00),
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    ),
  );

  Widget cardWidget = Card(
    child: Container(
      width: 345,
      height: 150,
      color: Colors.yellow[600],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 84,
            height: 84,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow[800], width: 1),
                borderRadius: BorderRadius.circular(42)),
            child: ClipOval(
              child: Image.asset(
                'images/default_avatar.png',
                width: 83,
                height: 83,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              'Bliss',
              style: TextStyle(
                  fontSize: 18.0,
                  color: Color(0x824E00),
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    ),
  );

  Widget _getCardWidget(int index, UserInfo userInfo) {
    return _getShadowWidget(
        null,
        null,
        index == cardList.length - 1 ? 30.0 : 0.0,
        userInfo.y == 0 ? 30.0 : 0.0,
        userInfo.y == 1 ? 30.0 : 0.0,
        Container(
          // color: Colors.yellow[600],
          padding: EdgeInsets.only(top: 15.0, left: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow[800], width: 1),
                    borderRadius: BorderRadius.circular(42)),
                child: ClipOval(
                  child: Image.asset(
                    null == userInfo.iconPath ? "" : userInfo.iconPath,
                    width: 83,
                    height: 83,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 15.0,
                ),
                child: Text(
                  null == userInfo.name ? "" : userInfo.name,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 15.0,
                ),
                child: Text(
                  null == userInfo.infoContent ? "" : userInfo.infoContent,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ));
  }

  /// 方框阴影
  Widget _getShadowWidget(num height, num marginTop, num marginBottom,
      num marginLeft, num marginRight, Widget subWidget) {
    return Container(
      height: null == height ? null : height,
      margin: EdgeInsets.only(
        top: null == marginTop ? 0 : marginTop,
        left: null == marginLeft ? 0 : marginLeft,
        right: null == marginRight ? 0 : marginRight,
        bottom: null == marginBottom ? 0 : marginBottom,
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
