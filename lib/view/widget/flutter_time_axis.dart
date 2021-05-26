import 'package:flutter/material.dart';
import 'package:lazy_account/view/widget/painter_custom.dart';
import 'package:lazy_account/view/widget/painter_left_custom.dart';

///[index]这个属性主要是为了给左边的时间轴画部件来用的 This attribute is primarily to the left of the timeline painted parts to use;
///[timeAxisSize]时间轴的大小必须要的。
///
///
///
///
///
///
///
///
class PaintCirLineItem extends StatefulWidget {
  int index;
  double timeAxisSize;
  double contentLeft;
  Widget leftWidget;
  double lineToLeft;
  Gradient myGradient;
  bool isDash;
  double dottedLineLength;
  double dottedSpacing;
  double marginLeft;
  Color leftLineColor;
  Alignment alignment;
  Widget centerRightWidget;
  Widget centerLeftWidget;
  Widget centerWight;
  double timeAxisLineWidth;

  PaintCirLineItem(this.timeAxisSize, this.index,
      {this.contentLeft,
      this.leftWidget,
      this.lineToLeft,
      this.myGradient,
      this.marginLeft = 5,
      this.isDash,
      this.dottedLineLength = 5.0,
      this.dottedSpacing = 10.0,
      this.leftLineColor,
      this.alignment = Alignment.center,
      this.centerRightWidget,
      this.centerLeftWidget,
      this.centerWight,
      this.timeAxisLineWidth}) {
    if (lineToLeft == null) {
      this.lineToLeft = timeAxisSize / 2;
    }
    if (contentLeft == null) {
      this.contentLeft = lineToLeft + 3;
    }
  }

  @override
  State<StatefulWidget> createState() {
    return _PaintCirLineItemState();
  }
}

class _PaintCirLineItemState extends State<PaintCirLineItem> {
  @override
  Widget build(BuildContext context) {
    return widget.alignment == Alignment.centerLeft
        ? Container(
            padding: EdgeInsets.only(left: widget.marginLeft),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                widget.index == 0
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            width: widget.timeAxisSize,
                            child: widget.leftWidget,
                          )
                        ],
                      )
                    : Container(),
                CustomPaint(
                  painter: new MyPainter(
                      paintWidth: widget.timeAxisLineWidth,
                      circleSize: widget.lineToLeft,
                      myGradient: widget.myGradient,
                      isDash: widget.isDash,
                      lineColor: widget.leftLineColor,
                      dottedLineLenght: widget.dottedLineLength,
                      dottedSpacing: widget.dottedSpacing),
                  child: Container(
                    padding: EdgeInsets.only(left: widget.contentLeft),
                    child: Container(
                      child: widget.centerWight,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                        width: widget.timeAxisSize, child: widget.leftWidget)
                  ],
                )
              ],
            ))
        : Container(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              widget.index == 0
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          child: Container(
                            width: widget.timeAxisSize,
                            child: widget.leftWidget,
                          ),
                        ),
                      ],
                    )
                  : Container(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: CustomPaint(
                      painter: new MyPainterLeft(
                          myGradient: widget.myGradient,
                          isDash: widget.isDash,
                          lineColor: widget.leftLineColor),
                      child: widget.centerLeftWidget,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: CustomPaint(
                        painter: new MyPainter(
                            myGradient: widget.myGradient,
                            isDash: widget.isDash,
                            lineColor: widget.leftLineColor),
                        child: widget.centerRightWidget),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Container(
                      width: widget.timeAxisSize,
                      child: widget.leftWidget,
                    ),
                  ),
                ],
              )
            ],
          ));
  }
}
