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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 100,
                color: Colors.orangeAccent,
              ),
              Container(
                margin: EdgeInsets.only(top: 50, left: 50, right: 50),
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
            height: 50,
            color: Colors.red,
          ),
//          ListView.separated(
//              shrinkWrap: true,
//              physics: NeverScrollableScrollPhysics(),
//              itemBuilder: (BuildContext context, int index) {
//                return _getDaySubBoxWidget(
//                    context, index, activitiesList[index]);
//              },
//              separatorBuilder: (context, index) => Container(
////                height: ScreenUtil.getInstance().setWidth(56),
//              ),
//              itemCount: activitiesList?.length ?? 0),
          cardWidget,
          Container(
            height: 30,
            color: Colors.blue,
          )
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
}
