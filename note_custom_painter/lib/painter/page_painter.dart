import 'package:flutter/material.dart';

class PagePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Colors.grey;
    var rect =
        RRect.fromLTRBR(0, 0, size.width, size.height, Radius.circular(8.0));
    canvas.drawRRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
