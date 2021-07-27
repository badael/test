import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

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
  return FlatButton(
    shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.blue, width: 2.0)),
    onPressed: onPressed(),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
    ),
    color: Colors.white,
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
    margin: EdgeInsets.all(10),
    elevation: 5.0,
    child: Container(
      padding: EdgeInsets.all(10),
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 8.0),
                        child: CircleAvatar(
                          radius: 20.0,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(
                          titleExchange,
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        datetime,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8.0),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[400],
            endIndent: 20,
            indent: 20,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 18.0,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  titleExchange,
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
            ],
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 8.0),
                      child: CircleAvatar(
                        radius: 18.0,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        contact,
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 8.0),
                      child: IconButton(onPressed: () {}, icon: iconMoneyType),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        moneyType,
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 8.0),
                      child: CircleAvatar(
                        radius: 18.0,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        note,
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        totaleMoney,
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 8.0, top: 5.0),
                      child: CircleAvatar(
                        radius: 18.0,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        attachments,
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 8.0, bottom: 5.0),
                            child: Text(
                              payedMoney,
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 8.0, top: 8.0),
                            child: Text(
                              payedMoney,
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
    padding: EdgeInsets.all(10),
    color: Colors.grey,
    child: Column(children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.only(left: 8.0), child: circleAvatar),
              Container(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
            ],
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: searchMethod(),
                icon: Icon(
                  Icons.search,
                  size: 20,
                ),
              ),
              IconButton(
                onPressed: addMethod(),
                icon: Icon(
                  Icons.add,
                  size: 20,
                ),
              ),
              IconButton(
                onPressed: editMethod(),
                icon: Icon(
                  Icons.edit,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    ]),
  );
}

Widget customlinerIndicator({
  @required double percent,
  @required CircleAvatar icon,
  @required String type,
  @required Function choseIcon,
  @required String totalExchange,
}) {
  return Container(
    margin: EdgeInsets.all(5),
    padding: EdgeInsets.all(5),
    height: 100,
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(iconSize: 40, onPressed: choseIcon(), icon: icon),
                Text(
                  type,
                ),
              ],
            ),
            Text(
              '$totalExchange',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        LinearPercentIndicator(
          //leaner progress bar
          animation: true,
          animationDuration: 1000,
          lineHeight: 20.0,
          percent: percent / 100,
          padding: EdgeInsets.symmetric(horizontal: 20),
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "$percent  %",
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[400]),
            ),
          ),
          linearStrokeCap: LinearStrokeCap.roundAll,
          progressColor: Colors.blue[400],
          backgroundColor: Colors.grey[300],
        ),
      ],
    ),
  );
}
