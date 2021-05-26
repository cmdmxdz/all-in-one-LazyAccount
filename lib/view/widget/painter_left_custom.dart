import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class MyPainterLeft extends CustomPainter {
  //虚线
  double dottedLineLength;

  //虚线之间的间距
  double dottedSpacing;
  double circleSize;
  Gradient myGradient;
  bool isDash;
  Color lineColor;
  double paintWidth;

  MyPainterLeft(
      {this.circleSize,
      this.myGradient,
      this.isDash = false,
      this.dottedLineLength = 5.0,
      this.dottedSpacing = 10.0,
      this.lineColor = Colors.redAccent,
      this.paintWidth = 4});

  Paint _paint = Paint()
    ..strokeCap = StrokeCap.square //画笔笔触类型
    ..isAntiAlias = true; //是否启动抗锯齿//画笔的宽度
  Path _path = new Path();

  @override
  Future paint(Canvas canvas, Size size) {
    final Rect arcRect = Rect.fromLTWH(10, 5, 4, size.height);
    _paint.style = PaintingStyle.stroke; // 画线模式
    _paint.color = this.lineColor;
    _paint.strokeWidth = this.paintWidth;
    _path.moveTo(size.width, 0); // 移动起点到（20,40）
    _path.lineTo(size.width, size.height); // 画条斜线
    if (myGradient != null) {
      _paint.shader = myGradient.createShader(arcRect);
    }
    if (myGradient != null && isDash) {
      canvas.drawPath(
        dashPath(_path,
            dashArray: CircularIntervalList<double>(
                <double>[dottedLineLength, dottedSpacing]),
            dashOffset: DashOffset.absolute(1)),
        _paint,
      );
    } else {
      canvas.drawPath(_path, _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
