// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:test_database_floor/models/currency.dart';

@dao
abstract class CurrencyDao {
  @insert
  Future<void> insertCurrency(Currency currency);

  @Query('SELECT * FROM Currency WHERE id = :id')
  Future<Currency> updateCurrency(int id);

  @Query('SELECT * FROM Currency WHERE id = :id')
  Future<Currency> deleteCurrency(int id);

  @Query('SELECT * FROM Currency')
  Future<List<Currency>> getAllcurrency();
}
