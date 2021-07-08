import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_database_floor/database/database.dart';
import 'package:test_database_floor/models/wallet.dart';
import 'package:test_database_floor/services/wallet_cubit/states.dart';

import '../dao/dao_wallet.dart';


class WalletCubit extends Cubit<WalletStates>{
  WalletCubit() : super(WalletIntialState());

  static WalletCubit get(context) => BlocProvider.of(context);

  AppDatabase database ;
  WalletDao dao  ;
  List<Wallet> wallets = [];
  int lastId ;

  void createDatabase(){
    $FloorAppDatabase.databaseBuilder('database_wallet.db').build().then((value) {
      database = value;
      dao = database.walletDao;
      emit(WalletCreateDatabaseState());

      getWalletsFromDatabase();
    });
  }

  void getWalletsFromDatabase(){
    this.dao.retrieveUsers().then((value) {
      wallets = value;
      if(value.length > 0){
        lastId = value[value.length -1].id;
      }else{
        lastId = 0;
      }

      emit(GetWalletsFromDatabaseState());


    });
  }



  Future<void> insertToDatabase({
    @required int isId,
    @required String walletName,
    @required String walletBalance,
    @required int currencyId
  }){
    dao.insertPerson(Wallet(isId, walletName, walletBalance , 1,'' ,1,currencyId)).then((value) {
      emit(InsertWalletsToDatabaseState());
      getWalletsFromDatabase();

    });
  }

  Future<void> updateWalletDatabase({
    @required int isId,
    @required String walletName,
    @required int currencyId
  }){
    dao.updateWallet(Wallet(isId, walletName,'' , 1,'' ,1,currencyId)).then((value) {
      emit(UpdateWalletsToDatabaseState());
      getWalletsFromDatabase();

    });
  }

  void deleteWalletFromDatabase({
  @required int id,
}){
    dao.deleteUser(id).then((value)  {
      emit(DeleteWalletsFromDatabaseState());
      getWalletsFromDatabase();
    });
  }






}