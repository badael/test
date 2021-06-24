import 'package:floor_test_2/database/database.dart';
import 'package:floor_test_2/models/currency.dart';
import 'package:floor_test_2/screens/cubit/currency_states.dart';
import 'package:floor_test_2/services/dao_currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyCubit extends Cubit<CurrencyStates> {
  CurrencyCubit() : super(CurrencyIntialState());

  static CurrencyCubit get(context) => BlocProvider.of(context);

  AppDatabase database;
  CurrencyDao dao;
  List<Currency> currency = [];

  void creatDataBase() async {
    $FloorAppDatabase.databaseBuilder('database.db').build().then((value) {
      database = value;
      dao = database.currencyDao;

      emit(CurrencyCreateDatabaseState());
      getCurrencyFromDatabase();
    });
  }

  void getCurrencyFromDatabase() {
    dao.findAll();
    emit(GetCurrencyFromDatabaseState());
  }

  void insertToDatabase({
    // int id;

    String name,
    // int walletId;
  }) {
    dao.insertCurrency(Currency(name: name)).then((value) {
      value = currency;
      emit(InsertCurrencyToDatabaseState());
      getCurrencyFromDatabase();
    });
  }

  // String getCurrencyOfWallet({@required String name, int walletId}) {
  //   for (int i = 0; i < currency.length; i++) {
  //     if (currency[i].id == walletId) {
  //       return currency[i].name;
  //     }
  //   }
  //   return 'no currency for this wallet';
  // }
}
