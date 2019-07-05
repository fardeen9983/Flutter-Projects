import 'package:flutter/material.dart';

class PagePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //Draw a grey rounded rectangle on full sized canvas
    var paint = Paint()..color = Colors.grey;
    var rect =
        RRect.fromLTRBR(0, 0, size.width, size.height, Radius.circular(8.0));
    canvas.drawRRect(rect, paint);

    //Create another white rounded rectangle over the previous one with margin from left
    paint = Paint()
      ..color = Colors.white;
    rect = RRect.fromLTRBR(6, 0, size.width, size.height, Radius.circular(8.0));
    canvas.drawRRect(rect, paint);

    //Draw horizontal lines on the white page
    paint = Paint()
      ..color = Colors.blueGrey
      ..strokeWidth = 1.0;
    canvas.drawLine(Offset(6, size.height * .2),
        Offset(size.width, size.height * .2), paint);
    canvas.drawLine(Offset(6, size.height * .4),
        Offset(size.width, size.height * .4), paint);
    canvas.drawLine(Offset(6, size.height * .6),
        Offset(size.width, size.height * .6), paint);
    canvas.drawLine(Offset(6, size.height * .8),
        Offset(size.width, size.height * .8), paint);

    //Create margin line
    paint = Paint()
      ..color = Colors.redAccent
      ..strokeWidth = 2.5;
    canvas.drawLine(Offset(size.width * .1, 0),
        Offset(size.width * .1, size.height), paint);

    paint = Paint()
      ..color = Colors.purpleAccent
      ..strokeWidth = 3;

    var text =
    TextSpan(text: "Hello",
        style: TextStyle(color: Colors.purpleAccent, fontSize: 22.0));
    var textPainter = TextPainter(textDirection: TextDirection.ltr, text: text);
    textPainter.layout();

    textPainter.paint(canvas, Offset(size.width * .14, size.height * .05));

    text = TextSpan(text: "World",
        style: TextStyle(color: Colors.purpleAccent, fontSize: 22.0));
    textPainter.text = text;
    textPainter.layout();
    textPainter.paint(canvas, Offset(size.width * .14, size.height * .25));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
