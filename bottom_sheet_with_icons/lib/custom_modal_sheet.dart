import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomModalSheet extends StatefulWidget {
  const CustomModalSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomModalSheet> createState() => _CustomModalSheetState();
}

class _CustomModalSheetState extends State<CustomModalSheet> {
  @override
  void initState() {
    super.initState();
  }

  final double horizontalPadding = 30.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 7,
        left: horizontalPadding,
        right: horizontalPadding,
        bottom: 20,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - horizontalPadding * 2,
        child: Column(
          children: const [
            SizedBox(height: 8),
            Text(
              'Your content goes here',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 200,
              child: Center(child: Text('Edit Sheet')),
            ),
          ],
        ),
      ),
    );
  }
}
