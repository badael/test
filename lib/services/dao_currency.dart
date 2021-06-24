import 'package:floor/floor.dart';
import 'package:floor_test_2/models/currency.dart';

@dao
abstract class CurrencyDao {
  @insert
  Future<void> insertCurrency(Currency currency);

  @Query('SELECT * FROM Currency ')
  Future<List<Currency>> findAll();
}
