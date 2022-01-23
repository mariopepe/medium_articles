import 'package:flutter/material.dart';
import 'package:functional_error_handling/core/error_handling/error_handling.dart';
import 'package:functional_error_handling/core/presentation/text_styles.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    Key? key,
    required this.errorObject,
  }) : super(key: key);

  final ErrorObject errorObject;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        width: 300,
        // color: const Color(0xffffc5c2),
        decoration: const BoxDecoration(
            color: Color(0xffffdbd9),
            borderRadius: BorderRadius.all(Radius.circular(40)),
            boxShadow: [
              BoxShadow(
                color: Color(0x10000000),
                spreadRadius: 3,
                offset: Offset(3, 3),
                blurRadius: 3,
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error, color: Colors.red, size: 70),
              const SizedBox(height: 20),
              Text(
                errorObject.title,
                style: TextStyles.errorTitle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                errorObject.message,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
