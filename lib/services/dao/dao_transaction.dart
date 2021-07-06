// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:test_database_floor/models/transaction.dart';

@dao
abstract class TransactionDao {
  @Query('SELECT * FROM transaction')
  Future<List<Transaction>> findAllTransaction();

  @Query('SELECT * FROM transaction WHERE id = :id')
  Future<Transaction> findTransactionById(int id);

  @Query('SELECT * FROM transaction')
  Future<List<Transaction>> retrieveTransactions();

  @Query('DELETE FROM transaction WHERE id = :id')
  Future<Transaction> deleteTransaction(int id);

  @update
  Future<void> updateTransaction(Transaction transaction);

  @insert
  Future<void> insertTransaction(Transaction transaction);
}
