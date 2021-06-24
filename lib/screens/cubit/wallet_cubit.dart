import 'package:floor_test_2/database/database.dart';
import 'package:floor_test_2/models/wallet.dart';
import 'package:floor_test_2/screens/cubit/states.dart';
import 'package:floor_test_2/services/dao_wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletCubit extends Cubit<WalletStates> {
  WalletCubit() : super(WalletIntialState());

  static WalletCubit get(context) => BlocProvider.of(context);

  AppDatabase database;
  WalletDAO dao;

  List<Wallet> wallets = [];

  void creatDataBase() {
    $FloorAppDatabase.databaseBuilder('database.db').build().then((value) {
      database = value;
      dao = database.walletDAO;

      emit(WalletCreateDatabaseState());
      getWalletsFromDatabase();
    });
  }

  void getWalletsFromDatabase() {
    this.dao.findAllWallet();
    emit(GetWalletsFromDatabaseState());
  }

  void insertToDatabase({
    int id,
    @required String name,
    @required String ammunt,
  }) {
    dao.insertWallet(Wallet(ammunt: ammunt, id: id, name: name)).then((value) {
      value = wallets;
      emit(InsertWalletsToDatabaseState());
      getWalletsFromDatabase();
    });
  }
}
