import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_database_floor/database/database.dart';
import 'package:test_database_floor/models/currency.dart';
import 'package:test_database_floor/servises/currency_cubit/states.dart';
import 'package:test_database_floor/servises/dao_currency.dart';
import '../dao_currency.dart';

class CurrencyCubit extends Cubit<CurrencyStates> {
  CurrencyCubit() : super(CurrencytIntialState());

  static CurrencyCubit get(context) => BlocProvider.of(context);

  AppDatabase database;
  CurrencyDao dao;
  List<Currency> currency = [];

  void createDatabase() {
    $FloorAppDatabase
        .databaseBuilder('database_wallet.db')
        .build()
        .then((value) {
      database = value;
      dao = database.baselDao;
      emit(CurrencyCreateDatabaseState());

      getCurrencyFromDatabase();
    });
  }

  void getCurrencyFromDatabase([int id]) {
    this.dao.getAllcurrency().then((value) {
      currency = value;
      emit(GetCurrencyFromDatabaseState());
    });
  }

  void insertToDatabase({
    int id,
    String name,
    String image,
    int ownerId,
  }) {
    dao.insertCurrency(Currency(id, name, ownerId, image)).then((value) {
      emit(InsertCurrencyToDatabaseState());
      getCurrencyFromDatabase();
    });
  }

  void deleteCurrencyFromDatabase({
    @required int id,
  }) {
    dao.deleteCurrency(id).then((value) {
      emit(DeleteCurrencyFromDatabaseState());
      getCurrencyFromDatabase();
    });
  }
}
