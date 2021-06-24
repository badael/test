// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  WalletDao _walletDaoInstance;

  BaselDao _baselDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `wallet` (`id` INTEGER, `name_wallet` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `basel` (`id` INTEGER, `name` TEXT, `owner_id` INTEGER, FOREIGN KEY (`owner_id`) REFERENCES `wallet` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  WalletDao get walletDao {
    return _walletDaoInstance ??= _$WalletDao(database, changeListener);
  }

  @override
  BaselDao get baselDao {
    return _baselDaoInstance ??= _$BaselDao(database, changeListener);
  }
}

class _$WalletDao extends WalletDao {
  _$WalletDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _walletInsertionAdapter = InsertionAdapter(
            database,
            'wallet',
            (Wallet item) =>
                <String, dynamic>{'id': item.id, 'name_wallet': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Wallet> _walletInsertionAdapter;

  @override
  Future<List<Wallet>> findAllPersons() async {
    return _queryAdapter.queryList('SELECT * FROM Wallet',
        mapper: (Map<String, dynamic> row) =>
            Wallet(row['id'] as int, row['name_wallet'] as String));
  }

  @override
  Future<Wallet> findPersonById(int id) async {
    return _queryAdapter.query('SELECT * FROM Wallet WHERE id = ?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) =>
            Wallet(row['id'] as int, row['name_wallet'] as String));
  }

  @override
  Future<List<Wallet>> retrieveUsers() async {
    return _queryAdapter.queryList('SELECT * FROM Wallet',
        mapper: (Map<String, dynamic> row) =>
            Wallet(row['id'] as int, row['name_wallet'] as String));
  }

  @override
  Future<Wallet> deleteUser(int id) async {
    return _queryAdapter.query('DELETE FROM Wallet WHERE id = ?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) =>
            Wallet(row['id'] as int, row['name_wallet'] as String));
  }

  @override
  Future<void> insertPerson(Wallet wallet) async {
    await _walletInsertionAdapter.insert(wallet, OnConflictStrategy.abort);
  }
}

class _$BaselDao extends BaselDao {
  _$BaselDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _baselInsertionAdapter = InsertionAdapter(
            database,
            'basel',
            (Basel item) => <String, dynamic>{
                  'id': item.id,
                  'name': item.name,
                  'owner_id': item.ownerId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Basel> _baselInsertionAdapter;

  @override
  Future<List<Basel>> findAllPersons() async {
    return _queryAdapter.queryList('SELECT * FROM Basel',
        mapper: (Map<String, dynamic> row) => Basel(
            row['id'] as int, row['name'] as String, row['owner_id'] as int));
  }

  @override
  Future<Basel> findPersonById(int id) async {
    return _queryAdapter.query('SELECT * FROM Basel WHERE id = ?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => Basel(
            row['id'] as int, row['name'] as String, row['owner_id'] as int));
  }

  @override
  Future<void> insertPerson(Basel basel) async {
    await _baselInsertionAdapter.insert(basel, OnConflictStrategy.abort);
  }
}
