import 'package:flutter/material.dart';

Widget customFormField(
    {@required TextEditingController controller,
      @required TextInputType type,
      Function(String) onSubmit,
      Function(String) onChange,
      var onTap,
      @required String label,
      @required IconData prefix,
      bool isClickable = true}) {
  return TextFormField(
    controller: controller,
    keyboardType: type,
    onFieldSubmitted: onSubmit,
    onChanged: onChange,
    enabled: isClickable,
    onTap: onTap,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(prefix),
      border: OutlineInputBorder(),
    ),
  );
}

Widget customRaisedButton({
  @required String text,
  @required Function onPressed,
}) {
  return RaisedButton(
    onPressed: onPressed,
    color: Colors.amberAccent,
    child: Text(text),
    textColor: Colors.black,
  );
}

Widget customFloatinActionButton({
  @required Icon icon,
  @required Function onPressed,
}) {
  return FloatingActionButton(
      backgroundColor: Colors.amber[400],
      onPressed: onPressed,
      child: Icon(
        Icons.add,
        color: Colors.blue,
        size: 25,
      ));
}

Widget customDropDown({
  final List items,
  final dropdownValue,
}) {
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

PreferredSizeWidget customAppBar({
  @required Icon icon,
  @required Text title,
}) {
  return AppBar(
    backgroundColor: Colors.amber[400],
    title: title,
    leading: icon,
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.search,
          size: 30,
        ),
      ),
      IconButton(
          icon: Icon(
            Icons.cancel_outlined,
            size: 30,
          ),
          onPressed: () {}),
    ],
  );
}