import 'package:floor_test_2/models/currency.dart';
import 'package:floor_test_2/models/wallet.dart';
import 'package:floor_test_2/screens/cubit/currency_cubit.dart';
import 'package:floor_test_2/screens/cubit/currency_states.dart';
import 'package:floor_test_2/screens/cubit/states.dart';
import 'package:floor_test_2/screens/cubit/wallet_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'AddWallet.dart';

class ViewWallet extends StatelessWidget {
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
        listener: (BuildContext context, WalletStates state) {},
        builder: (BuildContext context, WalletStates state) {
          WalletCubit cubit = WalletCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('WALLET'),
            ),
            body: BlocBuilder<WalletCubit, WalletStates>(
              bloc: cubit,
              builder: (context, state) {
                return ListView.builder(
                  itemCount: cubit.wallets.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(cubit.wallets[index].name),
                      subtitle: BlocConsumer<CurrencyCubit, CurrencyStates>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          return Text(
                              CurrencyCubit.get(context).currency[index].name);
                        },
                      ),
                    );
                  },
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AddWallet()),
              ),
            ),
          );
        },
      ),
    );
  }
}
