import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final List items;
  final dropdownValue;
  CustomDropDown(this.dropdownValue, this.items);
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: [],
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
    );
  }
}
