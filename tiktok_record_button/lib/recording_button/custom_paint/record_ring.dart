import 'package:flutter/material.dart';
import 'package:tiktok_record_button/common/constants.dart';

class RecordRing extends StatelessWidget {
  const RecordRing({Key? key, required this.progress}) : super(key: key);
  final double progress;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: CustomPaint(
        painter: RecordRingPainter(
          progress: progress,
        ),
      ),
    );
  }
}

class RecordRingPainter extends CustomPainter {
  RecordRingPainter({
    required this.progress,
  });

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final baseRadius = size.width / 2;
    final minRingSize = baseRadius * AppConstants.initialRingThicknessFactor;
    final ringRadiusAnimationRange =
        baseRadius * AppConstants.ringAnimationRangeFactor;

    final paint = Paint();
    paint.color = AppConstants.buttonColor;

    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()..addOval(Rect.fromCircle(center: center, radius: baseRadius)),
        Path()
          ..addOval(Rect.fromCircle(
            center: center,
            radius: minRingSize - ringRadiusAnimationRange * progress,
          ))
          ..close(),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant RecordRingPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
