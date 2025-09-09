import 'package:flutter/material.dart';

class WatermarkPainter extends CustomPainter {
  final String text;

  WatermarkPainter(this.text);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black.withOpacity(0.1);
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: const TextStyle(fontSize: 24, color: Colors.black)),
      textDirection: TextDirection.ltr,
    )..layout();

    for (double y = 0; y < size.height; y += 100) {
      for (double x = 0; x < size.width; x += 200) {
        canvas.save();
        canvas.translate(x, y);
        canvas.rotate(-0.5);
        textPainter.paint(canvas, Offset.zero);
        canvas.restore();
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
