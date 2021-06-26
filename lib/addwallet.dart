import 'package:flutter/material.dart';
import 'package:test_database_floor/myhomepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'servises/currency_cubit/currency.dart';
import 'servises/currency_cubit/states.dart';
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
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => WalletCubit()..createDatabase(),
          ),
          BlocProvider(
            create: (BuildContext context) => CurrencyCubit()..createDatabase(),
          )
        ],
        child: BlocConsumer<WalletCubit, WalletStates>(
          listener: (context, state) {
            if (state is InsertWalletsToDatabaseState) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));
            }
          },
          builder: (context, state) {
            return ListView(children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter name Wallet?',
                  labelText: 'Name Wallet',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: balanceController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter Balance?',
                  labelText: 'Balance',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              BlocConsumer<CurrencyCubit, CurrencyStates>(
                  listener: (BuildContext context, CurrencyStates state) {},
                  builder: (BuildContext context, currencyStates) {
                    return TextFormField(
                      controller: currencyController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Enter Currency?',
                        labelText: 'Currency',
                      ),
                    );
                  }),
              SizedBox(
                height: 50,
              ),
              FlatButton(
                  child: Text('save'),
                  onPressed: () {
                    WalletCubit.get(context).insertToDatabase(
                      isId: isID,
                      walletName: nameController.text,
                      balance: balanceController.text,
                    );
                    CurrencyCubit.get(context).insertToDatabase(
                      id: isID,
                      name: currencyController.text,
                    );
                    Navigator.pop(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  }),
            ]);
          },
        ),
      ),
    );
  }
}
