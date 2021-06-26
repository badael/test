// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:test_database_floor/models/currency.dart';
import 'package:test_database_floor/models/wallet.dart';
import 'package:test_database_floor/servises/dao_currency.dart';

import 'package:test_database_floor/servises/dao_wallet.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Wallet, Currency])
abstract class AppDatabase extends FloorDatabase {
  WalletDao get walletDao;
  CurrencyDao get baselDao;
}
