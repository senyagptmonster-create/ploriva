import 'package:flutter/material.dart';

class WaterDropletPainter extends CustomPainter {
  final double hydrationRatio; // 0.0 to 1.0

  const WaterDropletPainter({required this.hydrationRatio});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    // Teardrop path
    final path = Path()
      ..moveTo(center.dx, 8)
      ..cubicTo(size.width * 0.95, size.height * 0.55, size.width * 0.85, size.height - 8, center.dx, size.height - 8)
      ..cubicTo(size.width * 0.15, size.height - 8, size.width * 0.05, size.height * 0.55, center.dx, 8)
      ..close();

    // Background drop outline
    final bgPaint = Paint()
      ..color = const Color(0xFF0F291E)
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, bgPaint);

    // Fill level inside drop
    final fillHeight = size.height * hydrationRatio.clamp(0.0, 1.0);
    final fillRect = Rect.fromLTWH(0, size.height - fillHeight, size.width, fillHeight);

    final fillPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF34D399), Color(0xFF059669)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    canvas.save();
    canvas.clipPath(path);
    canvas.drawRect(fillRect, fillPaint);
    canvas.restore();

    // Droplet border
    final borderPaint = Paint()
      ..color = const Color(0xFF34D399)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant WaterDropletPainter oldDelegate) {
    return oldDelegate.hydrationRatio != hydrationRatio;
  }
}
