// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:test_database_floor/models/basel.dart';
import 'package:test_database_floor/models/wallet.dart';
import 'package:test_database_floor/servises/dao_basel.dart';
import 'package:test_database_floor/servises/dao_wallet.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Wallet, Basel])
abstract class AppDatabase extends FloorDatabase {
  WalletDao get walletDao;
  BaselDao get baselDao;
}
