import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final Widget prefixIcon;
  final TextEditingController controller;
  final Function functionValidate;
  final Function onSubmitField;

  const CustomTextFormField(
    this.hintText,
    this.controller,
    this.prefixIcon,
    this.functionValidate,
    this.onSubmitField,
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
      ),
      style: TextStyle(
        color: Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    );
  }
}
