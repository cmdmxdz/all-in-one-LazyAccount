import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_account/view/model/time_line_data.dart';
import 'package:lazy_account/view/widget/flutter_time_axis.dart';

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

  var mData = <TimeLineData>[];

  @override
  void initState() {
    super.initState();
    currentPage = RecordPage.RECORD_PAGE;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _initData() {
    mData.clear();

    mData.add(TimeLineData(0, TimeLineData.NORMAL, "test0", "sssssssss"));
    mData.add(TimeLineData(1, TimeLineData.NORMAL, "test1", "ssss\nsssss"));
    mData.add(TimeLineData(
        2, TimeLineData.NORMAL, "test2", "ssssss11111111111111sss"));
    mData.add(TimeLineData(
        3,
        TimeLineData.NORMAL,
        "test3",
        "sssssasssssssssssssssssssasssssssssssssssssssasssss"
            "s"
            "s"
            "ssssssssssssasssssssssssssssssssassssssssssssss"
            "ddsssssassssssssssssss"));

    mData.add(TimeLineData(3, TimeLineData.NORMAL, "test4", "ssszxcsss"));
  }

  @override
  Widget build(BuildContext context) {
    _initData();

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              child: Text(
                "记账页面",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              child: calendar,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return PaintCirLineItem(
                      8,
                      index,
                      leftWidget: leftWidget,
                      isDash: true,
                      myGradient: LinearGradient(
                          colors: [Colors.orange, Colors.orangeAccent]),
                      marginLeft: 16,
                      leftLineColor: Colors.red.withAlpha(50),
                      alignment: Alignment.centerLeft,
                      centerWight: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: 10,
                              right: 30,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  width: 3,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ),
                            child: Text(
                              mData[index].title,
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 10,
                              right: 30,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  width: 3,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ),
                            child: Text(
                              mData[index].content,
                              style: TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      timeAxisLineWidth: 4,
                    );
                  },
                  separatorBuilder: (context, index) => Container(
                        height: 0,
                      ),
                  itemCount: mData?.length ?? 0),
            ),
            Container(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget leftWidget = Container(
    width: 8,
    height: 8,
    decoration: BoxDecoration(
      color: Colors.orangeAccent,
      borderRadius: BorderRadius.all(Radius.circular(
        8,
      )),
    ),
  );

  Widget calendar = Container(
    height: 100,
    margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
    decoration: BoxDecoration(
      border: Border.all(
        width: 3,
        color: Colors.deepOrange,
      ),
    ),
    alignment: Alignment.center,
    child: Text("日历"),
  );
}
