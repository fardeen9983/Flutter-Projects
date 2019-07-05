import 'package:flutter/material.dart';

import '../painter/page_painter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: CustomPaint(
          child: Container(
            width: 300,
            height: 150,
          ),
          foregroundPainter: PagePainter(),
        ),
      ),
    );
  }
}
