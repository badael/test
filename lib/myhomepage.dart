import 'package:flutter/material.dart';
import 'package:test_database_floor/servises/wallet_cubit/cubit.dart';
import 'package:test_database_floor/servises/wallet_cubit/states.dart';
import 'addwallet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'servises/currency_cubit/currency.dart';
import 'servises/currency_cubit/states.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => WalletCubit()..createDatabase(),
        ),
        BlocProvider(
          create: (BuildContext context) => CurrencyCubit()..createDatabase(),
        )
      ],
      child: BlocConsumer<WalletCubit, WalletStates>(
        listener: (BuildContext context, WalletStates state) {},
        builder: (BuildContext context, walletStates) {
          WalletCubit cubit = WalletCubit.get(context);
          CurrencyCubit currencyCubit = CurrencyCubit.get(context);

          return Scaffold(
            appBar: AppBar(
                title: Row(
              children: [
                Text('My Wallet'),
              ],
            )),
            body: ConditionalBuilder(
              condition: true,
              fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ),
              builder: (context) {
                return ListView.builder(
                  itemCount: cubit.wallets.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        child: ListTile(
                            contentPadding: EdgeInsets.all(8.0),
                            title: Row(children: [
                              Text(cubit.wallets[index].name),
                              Text(cubit.wallets[index].balance)
                            ]),
                            leading: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                cubit.deleteWalletFromDatabase(
                                    id: cubit.wallets[index].id);
                                currencyCubit.deleteCurrencyFromDatabase(
                                    id: currencyCubit.currency[index].id);
                              },
                            ),
                            subtitle:
                                BlocConsumer<CurrencyCubit, CurrencyStates>(
                                    listener: (BuildContext context,
                                        CurrencyStates state) {},
                                    builder:
                                        (BuildContext context, currencyStates) {
                                      return Text(
                                          currencyCubit.currency[index].name);
                                    })));
                  },
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Addwallet())),
            ),
          );
        },
      ),
    );
  }
}
