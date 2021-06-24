import 'dart:async';
import 'package:floor/floor.dart';
import 'package:floor_test_2/models/currency.dart';
import 'package:floor_test_2/models/wallet.dart';
import 'package:floor_test_2/services/dao_currency.dart';

import 'package:floor_test_2/services/dao_wallet.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Wallet, Currency])
abstract class AppDatabase extends FloorDatabase {
  WalletDAO get walletDAO;
  CurrencyDao get currencyDao;
}
