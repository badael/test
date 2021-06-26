// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:test_database_floor/models/wallet.dart';

@dao
abstract class WalletDao {
  @insert
  Future<void> insertWallet(Wallet wallet);

  @update
  Future<int> updateWallet(List<Wallet> wallet);

  @Query('SELECT * FROM Wallet WHERE id = :id')
  Future<Wallet> deletWallet(int id);

  @Query('SELECT * FROM Wallet')
  Future<List<Wallet>> getAllwallet();
}
