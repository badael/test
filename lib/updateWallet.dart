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

class Updatewallet extends StatelessWidget {
final walletId;
final walletName;

  TextEditingController nameController = TextEditingController();




   Updatewallet({Key key, this.walletId,this.walletName}) : super(key: key);


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
            if(state is UpdateWalletsToDatabaseState){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));
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
                        WalletCubit.get(context).updateWalletDatabase(
                          isId: walletId,
                          walletName: nameController.text,
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

