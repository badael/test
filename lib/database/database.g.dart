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

  CurrencyDao _baselDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `Wallet` (`id` INTEGER, `name_wallet` TEXT, `balance` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Currency` (`id` INTEGER, `name` TEXT, `image` TEXT, `owner_id` INTEGER, FOREIGN KEY (`owner_id`) REFERENCES `Wallet` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');

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
  CurrencyDao get baselDao {
    return _baselDaoInstance ??= _$CurrencyDao(database, changeListener);
  }
}

class _$WalletDao extends WalletDao {
  _$WalletDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _walletInsertionAdapter = InsertionAdapter(
            database,
            'Wallet',
            (Wallet item) => <String, dynamic>{
                  'id': item.id,
                  'name_wallet': item.name,
                  'balance': item.balance
                }),
        _walletUpdateAdapter = UpdateAdapter(
            database,
            'Wallet',
            ['id'],
            (Wallet item) => <String, dynamic>{
                  'id': item.id,
                  'name_wallet': item.name,
                  'balance': item.balance
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Wallet> _walletInsertionAdapter;

  final UpdateAdapter<Wallet> _walletUpdateAdapter;

  @override
  Future<Wallet> deletWallet(int id) async {
    return _queryAdapter.query('SELECT * FROM Wallet WHERE id = ?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => Wallet(row['id'] as int,
            row['name_wallet'] as String, row['balance'] as String));
  }

  @override
  Future<List<Wallet>> getAllwallet() async {
    return _queryAdapter.queryList('SELECT * FROM Wallet',
        mapper: (Map<String, dynamic> row) => Wallet(row['id'] as int,
            row['name_wallet'] as String, row['balance'] as String));
  }

  @override
  Future<void> insertWallet(Wallet wallet) async {
    await _walletInsertionAdapter.insert(wallet, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateWallet(List<Wallet> wallet) {
    return _walletUpdateAdapter.updateListAndReturnChangedRows(
        wallet, OnConflictStrategy.abort);
  }
}

class _$CurrencyDao extends CurrencyDao {
  _$CurrencyDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _currencyInsertionAdapter = InsertionAdapter(
            database,
            'Currency',
            (Currency item) => <String, dynamic>{
                  'id': item.id,
                  'name': item.name,
                  'image': item.image,
                  'owner_id': item.ownerId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Currency> _currencyInsertionAdapter;

  @override
  Future<Currency> updateCurrency(int id) async {
    return _queryAdapter.query('SELECT * FROM Currency WHERE id = ?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => Currency(
            row['id'] as int,
            row['name'] as String,
            row['owner_id'] as int,
            row['image'] as String));
  }

  @override
  Future<Currency> deleteCurrency(int id) async {
    return _queryAdapter.query('SELECT * FROM Currency WHERE id = ?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => Currency(
            row['id'] as int,
            row['name'] as String,
            row['owner_id'] as int,
            row['image'] as String));
  }

  @override
  Future<List<Currency>> getAllcurrency() async {
    return _queryAdapter.queryList('SELECT * FROM Currency',
        mapper: (Map<String, dynamic> row) => Currency(
            row['id'] as int,
            row['name'] as String,
            row['owner_id'] as int,
            row['image'] as String));
  }

  @override
  Future<void> insertCurrency(Currency currency) async {
    await _currencyInsertionAdapter.insert(currency, OnConflictStrategy.abort);
  }
}
