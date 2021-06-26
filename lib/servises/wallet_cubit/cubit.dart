import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_database_floor/database/database.dart';
import 'package:test_database_floor/models/wallet.dart';
import 'package:test_database_floor/servises/wallet_cubit/states.dart';
import '../dao_wallet.dart';

class WalletCubit extends Cubit<WalletStates> {
  WalletCubit() : super(WalletIntialState());

  static WalletCubit get(context) => BlocProvider.of(context);

  AppDatabase database;
  WalletDao dao;
  List<Wallet> wallets = [];

  void createDatabase() {
    $FloorAppDatabase
        .databaseBuilder('database_wallet.db')
        .build()
        .then((value) {
      database = value;
      dao = database.walletDao;
      emit(WalletCreateDatabaseState());

      getWalletsFromDatabase();
    });
  }

  void getWalletsFromDatabase() {
    this.dao.getAllwallet().then((value) {
      wallets = value;
      emit(GetWalletsFromDatabaseState());
    });
  }

  void insertToDatabase({
    @required int isId,
    @required String walletName,
    @required String balance,
  }) {
    dao.insertWallet(Wallet(isId, walletName, balance)).then((value) {
      emit(InsertWalletsToDatabaseState());
      getWalletsFromDatabase();
    });
  }

  void deleteWalletFromDatabase({
    @required int id,
  }) {
    dao.deletWallet(id).then((value) {
      emit(DeleteWalletsFromDatabaseState());
      getWalletsFromDatabase();
    });
  }
}
