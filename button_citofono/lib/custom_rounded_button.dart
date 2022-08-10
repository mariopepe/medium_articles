import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomRoundedButton extends StatefulWidget {
  const CustomRoundedButton({
    Key? key,
    required this.onPressed,
    this.shouldVibrateOnTap = false,
  }) : super(key: key);

  final VoidCallback onPressed;
  final bool shouldVibrateOnTap;

  @override
  State<CustomRoundedButton> createState() => _CustomRoundedButtonState();
}

class _CustomRoundedButtonState extends State<CustomRoundedButton> {
  final double scaleAfterAnimation = 0.9;
  final Duration animationDuration = const Duration(milliseconds: 180);

  double scale = 1.0;

  void onTapDown() {
    setState(() => scale = scaleAfterAnimation);
  }

  void onTapUp() {
    Future.delayed(animationDuration - const Duration(milliseconds: 60), () {
      setState(() => scale = 1);
    });
  }

  void onTapCancel() {
    setState(() => scale = 1);
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.all(
              Radius.circular(
                constraints.maxWidth / 4,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(constraints.maxWidth * 0.075),
            child: GestureDetector(
              onTapDown: (_) {
                onTapDown();
              },
              onTapCancel: onTapCancel,
              onTapUp: (_) {
                if (widget.shouldVibrateOnTap) {
                  HapticFeedback.lightImpact();
                }
                onTapUp();
                widget.onPressed();
              },
              child: AnimatedScale(
                duration: animationDuration,
                scale: scale,
                curve: Curves.easeInOut,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        spreadRadius: 6,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        constraints.maxWidth / 3.2,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(constraints.maxWidth * 0.24),
                    child: const FittedBox(
                      fit: BoxFit.fill,
                      child: Icon(
                        Icons.power_settings_new_rounded,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
