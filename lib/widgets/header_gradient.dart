import 'package:flutter/material.dart';

class HeaderGradient extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      // colors: [Color(0xffEBF4FF), Color(0xffE6FFFA)],
      colors: [Colors.white, Colors.black],
      tileMode: TileMode.clamp,
    );

    final Rect colorBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    final Paint paint = Paint()..shader = gradient.createShader(colorBounds);

    Path path = Path();
    path.moveTo(0, size.height * 1);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.5, size.width * 1,
        size.height * 0.25);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
