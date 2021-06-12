import 'dart:math';

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
  /// 设置-卡片列表
  var cardList = <UserInfo>[];

  /// 用户名称
  var userName = "user_";

  /// vip等级
  var vipLevel = "vip: ";

  /// 提醒-标题
  var alarmTitle = "提醒";

  /// 提醒-内容
  var alarmContent = "振动提醒";

  /// 设置-标题
  var settingTitle = "其他设置";

  /// 设置
  var settingContent = "";

  /// 帮助中心
  var helpCenter = "帮助中心";

  @override
  void initState() {
    super.initState();
    userName = userName + Random().nextInt(10000).toString();
    vipLevel = vipLevel + Random().nextInt(6).toString();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// 初始化数据
  void _initData() {
    if (cardList.isNotEmpty) {
      cardList.clear();
    }
    cardList.add(UserInfo(
        index: 0,
        iconPath: "images/icon_alarm.png",
        name: alarmTitle,
        infoContent: alarmContent));
    cardList.add(UserInfo(
      index: 1,
      iconPath: "images/icon_setting.png",
      name: settingTitle,
    ));

    cardList.add(UserInfo(
      index: 3,
      iconPath: "images/icon_help.png",
      name: helpCenter,
    ));
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
                    EdgeInsets.only(top: 50, left: 30, right: 30, bottom: 30),
                color: Colors.transparent,
                child: Card(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: _getHeaderWidget(),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          userName,
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.orangeAccent,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                        margin: EdgeInsets.only(right: 20, bottom: 70),
                        child: Text(
                          vipLevel,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.orangeAccent,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return _getCardWidget(index, cardList[index]);
              },
              itemCount: cardList?.length ?? 0,
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  height: 20,
                );
              },
            ),
          ),
          Container(
            height: 30,
          ),
        ],
      ),
    );
  }

  /// 标题
  Widget _getHeaderWidget() {
    return Container(
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow[800], width: 1),
                borderRadius: BorderRadius.circular(42)),
            child: ClipOval(
              child: Image.asset(
                'images/default_avatar.png',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 设置卡片
  Widget _getCardWidget(int index, UserInfo userInfo) {
    return _getShadowWidget(
      70.0,
      null,
      index == cardList.length - 1 ? 30.0 : 0.0,
      30.0,
      30.0,
      InkWell(
        child: Container(
          padding: EdgeInsets.only(left: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 24,
                height: 24,
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
                  left: 15.0,
                ),
                child: Text(
                  null == userInfo.name ? "" : userInfo.name,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: Container(
                  width: (null == userInfo.infoContent ||
                          "" == userInfo.infoContent)
                      ? 15.0
                      : null,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  right: 15.0,
                ),
                child: Text(
                  null == userInfo.infoContent ? "" : userInfo.infoContent,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          print("onTap: ${userInfo.name ?? "card"}");
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
        top: null == marginTop ? 0 : marginTop,
        left: null == marginLeft ? 0 : marginLeft,
        right: null == marginRight ? 0 : marginRight,
        bottom: null == marginBottom ? 0 : marginBottom,
      ),
      decoration: BoxDecoration(
          color: Color(0xCCFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(8)),
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
