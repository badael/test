import 'package:flutter/material.dart';
import 'package:test_database_floor/screens/exchange/add_exchange.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context)
                  .pop(MaterialPageRoute(builder: (context) => AddExchange()));
            },
          ),
          centerTitle: true,
          title: Text('Add Exchang Category'),
          backgroundColor: Colors.amber[400],
        ),
        body: Container(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
          child: InkWell(
            onTap: () {},
            child: GridView.extent(
              mainAxisSpacing: 7.0,
              maxCrossAxisExtent: 75.0,
              crossAxisSpacing: 7.0,
              children: _buildGridImages(65),
            ),
          ),
        ));
  }
}

List<Widget> _buildGridImages(numberOfImage) {
  List<Container> containers =
      List<Container>.generate(numberOfImage, (int index) {
    final imageName = index < 9
        ? 'assets/category/image0${index + 1}.png'
        : 'assets/category/image${index + 1}.png';
    return Container(
      child: Image.asset(imageName),
    );
  });
  return containers;
}

Future<void> setImage() {}
