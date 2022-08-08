import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:tiktok_record_button/common/animation_controller_state.dart';
import 'package:tiktok_record_button/common/constants.dart';
import 'package:tiktok_record_button/recording_button/custom_paint/record_box.dart';
import 'package:tiktok_record_button/recording_button/custom_paint'
    '/record_ring.dart';

class RecordingButton extends StatefulWidget {
  const RecordingButton({Key? key}) : super(key: key);

  final bool completed = true;

  @override
  State<RecordingButton> createState() =>
      _RecordingButtonState(AppConstants.animationDuration);
}

class _RecordingButtonState extends AnimationControllerState<RecordingButton> {
  _RecordingButtonState(Duration duration) : super(duration);

  late final Animation<double> _curveAnimation;
  bool isDoneRecording = false;
  bool isRecording = false;

  /// This is needed for the initial movement of the animation
  bool isFirstAnimationLoopDone = false;

  /// This is needed for the outro part of the animation
  bool isLastLoopInProgress = false;

  void _checkStatusUpdates(AnimationStatus status) {
    if (animationController.value == 0.0 &&
        !isFirstAnimationLoopDone &&
        !isLastLoopInProgress) {
      /// This is used to have the start of the animation faster than the
      /// rest of the animation
      timeDilation = AppConstants.initialAnimationSpeedUp;
    }

    if (status == AnimationStatus.completed) {
      /// Reset animation speed
      timeDilation = 1;
      animationController.reverse();
      setState(() => isFirstAnimationLoopDone = true);
    }
    if (animationController.value == 0.0 &&
        isRecording &&
        !isLastLoopInProgress) {
      animationController.forward();
    }
    if (animationController.value == 0.0 && isLastLoopInProgress) {
      animationController.stop();
      setState(() => isLastLoopInProgress = false);
    }
  }

  @override
  void initState() {
    super.initState();
    animationController.addStatusListener(_checkStatusUpdates);
    _curveAnimation = animationController.drive(
      CurveTween(curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    animationController.removeStatusListener(_checkStatusUpdates);
    super.dispose();
  }

  void _handleLongPressStart(LongPressStartDetails _) {
    if (isRecording) {
      setState(() => isRecording = false);
      animationController.reset();
    } else {
      setState(() => isRecording = true);
      animationController.reset();
      animationController.forward();
    }
  }

  void _handleLongPressEnd(LongPressEndDetails _) {
    setState(() {
      isLastLoopInProgress = true;
      isRecording = false;
      isFirstAnimationLoopDone = false;
      isDoneRecording = false;
    });
    animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: _handleLongPressStart,
      onLongPressEnd: _handleLongPressEnd,
      child: AnimatedBuilder(
        animation: _curveAnimation,
        builder: (BuildContext context, Widget? child) {
          final progress = _curveAnimation.value;
          return Stack(
            children: [
              Align(
                child: Transform.scale(
                  scale: isFirstAnimationLoopDone
                      ? 1
                      : (1 -
                          AppConstants.initialZoomOutFactorRecordingRing *
                              (1 - progress)),
                  child: RecordRing(
                    progress: progress,
                  ),
                ),
              ),
              Align(
                child: Transform.scale(
                  scale: isFirstAnimationLoopDone
                      ? 1
                      : (1 +
                          AppConstants.initialZoomInFactorRecordingBox *
                              (1 - progress)),
                  child: RecordBox(
                    progress: isFirstAnimationLoopDone && !isLastLoopInProgress
                        ? 1
                        : progress,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
