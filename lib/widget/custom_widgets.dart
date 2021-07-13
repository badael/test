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

Widget customAlertDialog({
  @required String title,
  @required String content,
}) {
  return AlertDialog(
    title: Text(title),
    titlePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
    content: Text(content),
    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    contentTextStyle: TextStyle(color: Colors.black12, fontSize: 15),
    actions: [
      Row(
        children: [
          customRaisedButton(text: 'ok', onPressed: () {}),
          SizedBox(
            width: 25,
          ),
          customRaisedButton(text: 'cancel', onPressed: () {}),
        ],
      ),
    ],
  );
}

Widget customCardTransaction({
  @required String titleExchange,
  @required String datetime,
  @required CircleAvatar iconMoneyType,
  @required String moneyType,
  @required String contact,
  @required String note,
  @required String totaleMoney,
  @required String attachments,
  @required String payedMoney,
}) {
  return Card(
    elevation: 5.0,
    child: Container(
      padding: EdgeInsets.all(10),
      color: Colors.grey[200],
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(),
              SizedBox(
                width: 15,
              ),
              Text(titleExchange),
              SizedBox(
                width: 69,
              ),
              Text(datetime),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete),
              ),
            ],
          ),
          Divider(
            color: Colors.grey[400],
            endIndent: 20,
            indent: 20,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(),
              SizedBox(
                width: 15,
              ),
              Text(contact),
              SizedBox(
                width: 120,
              ),
              IconButton(onPressed: () {}, icon: iconMoneyType),
              Text(moneyType),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(),
              SizedBox(
                width: 15,
              ),
              Text(note),
              SizedBox(
                width: 115,
              ),
              Text(totaleMoney),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(),
              SizedBox(
                width: 15,
              ),
              Text(attachments),
              SizedBox(
                width: 115,
              ),
              Text(payedMoney),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget customContainerWallet({
  @required String title,
  @required CircleAvatar circleAvatar,
  @required Function searchMethod,
  @required Function addMethod,
  @required Function editMethod,
}) {
  return Container(
    height: 60,
    color: Colors.grey,
    child: ListTile(
      leading: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          circleAvatar,
          SizedBox(
            width: 15,
          ),
          Text(title),
        ],
      ),
      trailing: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: searchMethod(),
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: addMethod(),
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: editMethod(),
            icon: Icon(Icons.edit),
          ),
        ],
      ),
    ),
  );
}
