import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final Function onPressed;
  final Widget text;

  CustomRaisedButton(
    this.onPressed,
    this.text,
  );
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed(),
      color: Colors.amberAccent,
      child: text,
      textColor: Colors.black,
    );
  }
}
