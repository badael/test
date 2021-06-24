import 'package:floor/floor.dart';
import 'package:floor_test_2/models/wallet.dart';

@dao
abstract class WalletDAO {
  @insert
  Future<void> insertWallet(Wallet wallet);

  // @Query('DELETE FROM Wallet WHERE id = :id')
  // Future<Wallet> deleteWallet(int id);

  // @Query('DELETE FROM Wallet')
  // Future<void> deleteThisWallet();

  @Query('SELECT * FROM wallet')
  Future<List<Wallet>> findAllWallet();

  @update
  Future<void> updateWallet(Wallet wallet);
}
