import 'package:flutter/material.dart';
import 'LabelText.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.buttonType,
      required this.buttonLabel,
      required this.handleFunction});
  final String buttonType;
  final String buttonLabel;
  final void Function()? handleFunction;

  @override
  Widget build(BuildContext context) {
    if (buttonType == 'raised') {
      return SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: handleFunction,
          child: LabelText(
            label: buttonLabel,
            variant: 'secondaryHeading',
          ),
        ),
      );
    }
    if (buttonType == 'flat') {
      return SizedBox(
        height: 50,
        width: double.infinity,
        child: TextButton(
            onPressed: handleFunction,
            child: LabelText(
              label: buttonLabel,
              variant: 'primaryHeading',
            )),
      );
    }
    return Container();
  }
}
