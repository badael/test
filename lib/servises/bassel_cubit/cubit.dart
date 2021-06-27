import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_database_floor/database/database.dart';
import 'package:test_database_floor/models/basel.dart';
import 'package:test_database_floor/models/wallet.dart';
import 'package:test_database_floor/servises/bassel_cubit/states.dart';
import 'package:test_database_floor/servises/wallet_cubit/states.dart';

import '../dao_basel.dart';
import '../dao_wallet.dart';


class BasselCubit extends Cubit<BasselStates>{
  BasselCubit() : super(BasselIntialState());

  static BasselCubit get(context) => BlocProvider.of(context);

  AppDatabase database ;
  BaselDao dao  ;
  List<Basel> bassels = [];

  void createDatabase(){
    $FloorAppDatabase.databaseBuilder('database_wallet.db').build().then((value) {
      database = value;
      dao = database.baselDao;
      emit(BasselCreateDatabaseState());

      getBasselsFromDatabase();
    });
  }

  void getBasselsFromDatabase(){
    this.dao.findAllPersons().then((value) {
      bassels = value;
      emit(GetBasselsFromDatabaseState());


    });
  }

  void insertToDatabase({
    @required int isId,
    @required String basselName,
    @required int ownerId,
  }){

    print(ownerId);
    dao.insertPerson(Basel(isId, basselName,ownerId)).then((value) {
      emit(InsertBasselsToDatabaseState());
      getBasselsFromDatabase();

    });
  }

  String getBasselOfWallet({
  @required int walletId,
}){
    for(int i = 0 ; i <bassels.length;i++){
      if(bassels[i].ownerId == walletId){
        return bassels[i].name;
      }
    }
    return 'no bassel for this wallet';
  }

  void deleteWalletFromDatabase({
    @required int id,
  }){
    dao.deleteUser(id).then((value)  {
      emit(DeleteBasselsFromDatabaseState());
      getBasselsFromDatabase();
    });
  }
int getWalletId({
  @required int id,
}){
  for(int i = 0 ; i <bassels.length;i++){
    if(bassels[i].ownerId == id){
      return bassels[i].id;
    }
  }
  return 0;
}



}