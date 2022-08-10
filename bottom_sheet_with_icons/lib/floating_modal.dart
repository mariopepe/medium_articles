import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CustomFloatingModal extends StatelessWidget {
  const CustomFloatingModal(
      {Key? key, required this.child, this.backgroundColor})
      : super(key: key);

  static const int secondsBeforeDismissingStateVisualizer = 3;

  final Widget child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: EdgeInsets.only(
        /// .viewInsets.bottom when the keyboard is closed is 0, when open
        /// circa 336. So when keyboard is closed that '* 0.08' has no
        /// effect, when open, guarantees that there is some space between
        /// keyboard and the modal sheet.
        bottom: MediaQuery.of(context).viewInsets.bottom +
            MediaQuery.of(context).viewInsets.bottom * 0.08,
      ),
      duration: const Duration(milliseconds: 200),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            type: MaterialType.transparency,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(Icons.heart_broken_outlined),
                      SizedBox(width: 8),
                      Icon(Icons.music_note),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 32.0),
                  child: Stack(
                    children: [
                      Container(
                        height: 3,
                        decoration: const BoxDecoration(
                            color: Colors.black45,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                      Container(
                        height: 3.5,
                        width: 80,
                        decoration: const BoxDecoration(
                            color: Colors.black45,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.zero,
            child: Material(
              color: backgroundColor,
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(32),
              child: SingleChildScrollView(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    child,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<dynamic> showFloatingModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? backgroundColor,
  bool isDismissible = true,
  bool isDraggable = true,
}) async {
  final dynamic result = await showCustomModalBottomSheet<dynamic>(
    context: context,
    isDismissible: isDismissible,
    enableDrag: isDraggable,
    builder: builder,
    containerWidget: (_, animation, child) => CustomFloatingModal(
      backgroundColor: Colors.white,
      child: child,
    ),
    expand: false,
  );

  return result;
}
