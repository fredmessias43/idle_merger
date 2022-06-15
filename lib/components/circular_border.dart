import 'dart:math';

import 'package:flutter/material.dart';

class CircularBorder extends StatelessWidget {
  final Color color;
  final double size;
  final double boxSize;
  final double width;
  final Widget child;

  const CircularBorder(
      {Key? key,
      this.color = Colors.blue,
      this.size = 50,
      this.boxSize = 50,
      this.width = 5.0,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          child,
          CustomPaint(
            size: Size(size, size),
            foregroundPainter: MyPainter(
                completeColor: color,
                width: width,
                boxSize: Size(boxSize, boxSize)),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  Color lineColor = Colors.transparent;
  Color completeColor;
  double width;
  Size boxSize;
  MyPainter(
      {required this.completeColor,
      required this.width,
      required this.boxSize});
  @override
  void paint(Canvas canvas, Size size) {
    Paint complete = Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Offset center = Offset(boxSize.width / 2, boxSize.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    var percent = (size.width * 0.001) / 2;

    double arcAngle = 2 * pi * percent;
    // debugPrint("$radius - radius");
    // debugPrint("$arcAngle - arcAngle");
    // debugPrint("${radius / arcAngle} - divider");

    for (var i = 0; i < 8; i++) {
      var init = (-pi / 2) * (i / 2);

      canvas.drawArc(Rect.fromCircle(center: center, radius: radius), init,
          arcAngle, false, complete);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
