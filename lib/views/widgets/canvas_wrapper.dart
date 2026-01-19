import 'package:flutter/material.dart';

class CanvasWrapper extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;

  const CanvasWrapper({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CanvasPainter(),
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: child,
      ),
    );
  }
}

class CanvasPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // simple decorative background (light grey)
    final paint = Paint()
      ..color = Colors.grey.shade100
      ..style = PaintingStyle.fill;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // small decorative road curve on bottom-right (purely aesthetic)
    final path = Path();
    final w = size.width;
    final h = size.height;
    path.moveTo(w * 0.6, h);
    path.quadraticBezierTo(w * 0.8, h * 0.6, w, h * 0.8);
    final paint2 = Paint()
      ..color = Colors.grey.shade200
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
