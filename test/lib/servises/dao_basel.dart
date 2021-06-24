// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:test_database_floor/models/basel.dart';

@dao
abstract class BaselDao {
  @Query('SELECT * FROM Basel')
  Future<List<Basel>> findAllPersons();

  @Query('SELECT * FROM Basel WHERE id = :id')
  Future<Basel> findPersonById(int id);

  @insert
  Future<void> insertPerson(Basel basel);
}
