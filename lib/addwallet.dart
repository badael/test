import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:test_database_floor/database/database.dart';
import 'package:test_database_floor/models/wallet.dart';
import 'package:test_database_floor/myhomepage.dart';
import 'package:test_database_floor/servises/bassel_cubit/cubit.dart';
import 'package:test_database_floor/servises/bassel_cubit/states.dart';
import 'package:test_database_floor/servises/dao_wallet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'servises/wallet_cubit/states.dart';
import 'servises/wallet_cubit/cubit.dart';

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
              create: (BuildContext context) => BasselCubit()..createDatabase(),
            ),
          ],


        child: BlocConsumer<WalletCubit,WalletStates>(
          listener: (context,state){
            // if(state is InsertWalletsToDatabaseState){
            //   Navigator.pushReplacement(context,
            //       MaterialPageRoute(builder: (context) => MyHomePage()));
            // }
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
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'currency',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              BlocConsumer<BasselCubit,BasselStates>(
                listener: (context,state){
                  if(state is InsertBasselsToDatabaseState){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  }
                },
                builder: (context,state){
                  return FlatButton(
                      child: Text('save'),
                      onPressed: () {
                        WalletCubit.get(context).insertToDatabase(
                          isId: isID,
                          walletName: nameController.text,
                        );
                        BasselCubit.get(context).insertToDatabase(
                            isId: isID,
                            basselName: currencyController.text,
                            ownerId:WalletCubit.get(context).lastId != null?  WalletCubit.get(context).lastId + 1 : 1);


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

