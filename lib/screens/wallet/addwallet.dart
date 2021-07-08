import 'package:floor/floor.dart';
import 'package:flutter/cupertino.dart';
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

class Addwallet extends StatelessWidget {


  TextEditingController nameController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  TextEditingController currencyController = TextEditingController();

  int isID;

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
            if(state is InsertWalletsToDatabaseState){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));
            }
          },
          builder: (context,state){
            return ListView(children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Name Wallet',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: balanceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'balance',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: currencyController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'currency',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              BlocConsumer<CurrencyCubit,CurrencyStates>(
                listener: (context,state){
                  if(state is InsertCurrenciesToDatabaseState){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => WalletHome()));
                  }
                },
                builder: (context,state){
                  return FlatButton(
                      child: Text('save'),
                      onPressed: () {
                        WalletCubit.get(context).insertToDatabase(
                          isId: isID,
                          walletName: nameController.text,
                          walletBalance: balanceController.text,
                          currencyId: int.parse(currencyController.text)
                        );
                        // CurrencyCubit.get(context).insertToDatabase(
                        //     isId: isID,
                        //     basselName: currencyController.text,
                        //     ownerId:WalletCubit.get(context).lastId != null?  WalletCubit.get(context).lastId + 1 : 1);


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

