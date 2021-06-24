import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:test_database_floor/servises/dao_wallet.dart';
import 'database/database.dart';
import 'myhomepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      await $FloorAppDatabase.databaseBuilder('database_wallet.db').build();
  final dao = database.walletDao;

  runApp(MyApp(dao));
}

class MyApp extends StatelessWidget {
  final WalletDao dao;
  MyApp(this.dao);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(dao),
    );
  }
}
