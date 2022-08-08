import 'package:flutter/material.dart';
import 'package:tiktok_record_button/common/constants.dart';

class RecordBox extends StatelessWidget {
  const RecordBox({Key? key, required this.progress}) : super(key: key);
  final double progress;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: CustomPaint(
        painter: RecordBoxPainter(
          progress: progress,
        ),
      ),
    );
  }
}

class RecordBoxPainter extends CustomPainter {
  RecordBoxPainter({
    required this.progress,
  });

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final side = size.width / AppConstants.boxSizeFactor;

    final minCornerRadius = side * AppConstants.minBoxCornerRadiusFactor;
    final maxCornerRadius = side / 2;

    final paint = Paint();
    paint.color = AppConstants.buttonColor;

    canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: center,
            width: side,
            height: side,
          ),
          Radius.circular(maxCornerRadius - progress * minCornerRadius),
        ),
        paint);
  }

  @override
  bool shouldRepaint(covariant RecordBoxPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
