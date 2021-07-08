import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:test_database_floor/database/database.dart';
import 'package:test_database_floor/models/wallet.dart';
import 'package:test_database_floor/screens/myhomepage.dart';
import 'package:test_database_floor/screens/wallet/wallet_home.dart';
import 'package:test_database_floor/services/currency_cubit/cubit.dart';
import 'package:test_database_floor/services/currency_cubit/states.dart';
import 'package:test_database_floor/services/dao/dao_wallet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/wallet_cubit/states.dart';
import '../../services/wallet_cubit/cubit.dart';

class Updatewallet extends StatelessWidget {
final walletId;
final walletName;
final walletCurrencyId;

  TextEditingController nameController = TextEditingController();




   Updatewallet({Key key, this.walletId,this.walletName,this.walletCurrencyId}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:MultiBlocProvider(
        providers:[
          BlocProvider(
            create: (BuildContext context) => WalletCubit()..createDatabase(),
          ),
          BlocProvider(
            create: (BuildContext context) => CurrencyCubit()..createDatabase(),
          ),
        ],


        child: BlocConsumer<WalletCubit,WalletStates>(
          listener: (context,state){
            if(state is UpdateWalletsToDatabaseState){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => WalletHome()));
            }
          },
          builder: (context,state){
            return ListView(children: [
              TextFormField(
                controller: nameController,
                // initialValue: walletName,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Name Wallet',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              BlocConsumer<CurrencyCubit,CurrencyStates>(
                listener: (context,state){
                  if(state is InsertCurrenciesToDatabaseState){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  }
                },
                builder: (context,state){
                  return TextButton(
                      child: Text('save'),
                      onPressed: () {
                        WalletCubit.get(context).updateWalletDatabase(
                          isId: walletId,
                          walletName: nameController.text,
                          currencyId: walletCurrencyId
                        );


                      });
                },
              )
            ]);
          },
        ),
      ),
    );
  }
}

