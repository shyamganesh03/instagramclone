import 'package:flutter/material.dart';

class AlertBox {
  AlertBox({
    required this.context,
    required this.title,
    required this.description,
    required this.buttonLabel,
    this.onPressed,
  });
  final BuildContext context;
  final String title;
  final String description;
  final String buttonLabel;
  final void Function()? onPressed;

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(description),
              ],
            ),
          ),
          actions: <Widget>[
            buttonLabel.isNotEmpty
                ? TextButton(
                    onPressed: onPressed,
                    child: Text(buttonLabel),
                  )
                : Container(),
          ],
        );
      },
    );
  }
}
