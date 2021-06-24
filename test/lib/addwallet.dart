import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:test_database_floor/database/database.dart';
import 'package:test_database_floor/models/wallet.dart';
import 'package:test_database_floor/myhomepage.dart';
import 'package:test_database_floor/servises/dao_wallet.dart';

class Addwallet extends StatefulWidget {
  final WalletDao dao;
  Addwallet(this.dao);
  @override
  _AddwalletState createState() => _AddwalletState();
}

class _AddwalletState extends State<Addwallet> {
  TextEditingController nameController = TextEditingController();

  int isID;
  AppDatabase database;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'What do people call you?',
            labelText: 'Name Wallet',
          ),
        ),
        SizedBox(
          height: 50,
        ),
        FlatButton(
            child: Text('save'),
            onPressed: () {
              setState(() {
                Wallet wallet = Wallet(isID, nameController.text);
                widget.dao.insertPerson(wallet);
              });
              Navigator.of(context).pop();
            })
      ]),
    );
  }
}
