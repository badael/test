import 'package:floor_test_2/screens/cubit/currency_cubit.dart';
import 'package:floor_test_2/screens/cubit/currency_states.dart';
import 'package:floor_test_2/screens/cubit/states.dart';
import 'package:floor_test_2/screens/viewWallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/wallet_cubit.dart';

// ignore: must_be_immutable
class AddWallet extends StatefulWidget {
  @override
  _AddWalletState createState() => _AddWalletState();
}

class _AddWalletState extends State<AddWallet> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ammuntController = TextEditingController();
  TextEditingController courrencyController = TextEditingController();
  TextEditingController namedDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<WalletCubit>(
            create: (BuildContext context) => WalletCubit()..creatDataBase(),
          ),
          BlocProvider<CurrencyCubit>(
            create: (BuildContext context) => CurrencyCubit()..creatDataBase(),
          ),
        ],
        child: BlocConsumer<WalletCubit, WalletStates>(
            listener: (BuildContext context, WalletStates state) {
          if (state is InsertWalletsToDatabaseState) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => ViewWallet()));
          }
        }, builder: (BuildContext context, WalletStates states) {
          WalletCubit cubit = WalletCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('AddWallet'),
            ),
            body: ListView(
              children: [
                TextFormField(
                  controller: nameController,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: ammuntController,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: courrencyController,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(controller: namedDController),
                BlocConsumer<CurrencyCubit, CurrencyStates>(
                    listener: (context, CurrencyStates state) {},
                    builder: (context, CurrencyStates state) {
                      CurrencyCubit currencyCubit = CurrencyCubit.get(context);
                      return RaisedButton(onPressed: () {
                        cubit.insertToDatabase(
                            name: nameController.text,
                            ammunt: ammuntController.text);

                        // insert the currency in another table

                        currencyCubit.insertToDatabase(
                            name: namedDController.text);
                        print('oook');
                      });
                    })
              ],
            ),
          );
        }));
  }
}
