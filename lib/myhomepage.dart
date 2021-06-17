import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:test_database_floor/models/wallet.dart';
import 'package:test_database_floor/servises/dao_wallet.dart';
import 'addwallet.dart';
import 'database/database.dart';

class MyHomePage extends StatefulWidget {
  final WalletDao dao;
  MyHomePage(this.dao);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AppDatabase database;
  WalletDao dao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Wallet')),
      body: FutureBuilder(
        future: widget.dao.retrieveUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<Wallet>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title: Text(snapshot.data[index].name),
                  leading: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        widget.dao.deleteUser(snapshot.data[index].id);
                      });
                    },
                  ),
                ));
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => Addwallet(widget.dao))),
      ),
    );
  }
}
