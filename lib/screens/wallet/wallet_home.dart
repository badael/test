import 'package:flutter/material.dart';
import 'package:test_database_floor/screens/wallet/wallets_list.dart';
import 'package:test_database_floor/services/currency_cubit/cubit.dart';
import 'package:test_database_floor/services/currency_cubit/states.dart';
import 'package:test_database_floor/services/wallet_cubit/cubit.dart';
import 'package:test_database_floor/services/wallet_cubit/states.dart';
import 'package:test_database_floor/screens/wallet/updateWallet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:test_database_floor/widget/custom_appBar.dart';
import 'package:test_database_floor/widget/custom_widgets.dart'
    hide customFloatinActionButton;
import 'package:test_database_floor/widget/widgets.dart';

import 'addCashWallet.dart';

class WalletHome extends StatelessWidget {
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
        builder: (BuildContext context, WalletStates state) {
          WalletCubit cubit = WalletCubit.get(context);
          CurrencyCubit currencyCubit = CurrencyCubit.get(context);
          return Scaffold(
              appBar: CustomAppBar(Icon(Icons.wallet_giftcard), 'My Wallet'),
              body: ConditionalBuilder(
                condition: true,
                fallback: (context) => Center(
                  child: CircularProgressIndicator(),
                ),
                builder: (context) {
                  return ListView.builder(
                    itemCount: cubit.wallets.length,
                    itemBuilder: (BuildContext context, int index) {
                      return customContainerWallet(
                        title: cubit.wallets[index].name,
                        circleAvatar: Container(
                          width: 45.0,
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            image: DecorationImage(
                              // alignment: Alignment.center,
                              fit: BoxFit.contain,
                              scale: 0.5,

                              image: AssetImage(cubit.wallets[index].icon),
                              // fit: BoxFit.cover,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            // border: Border.all(
                            //   color: Colors.amber[400],
                            //   width: 2,
                            // ),
                          ),
                        ),
                        deletMethod: () {
                          showDialog(
                            context: context,
                            builder: (_) => customAlertDialog(
                              // title: 'Alart',
                              content:
                                  'This wallet will be deleted along with all transactions made on it \n and delete associated debt transactions',
                              cancelMethod: () {},
                              submitMethod: () {},
                            ),
                          );
                        },
                        TransactionMethod: () {},
                        balance: cubit.wallets[index].balance,
                      );
                    },
                  );
                },
              ),
              floatingActionButton: customFloatinActionButton(
                icon: Icon(Icons.add),
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => WalletsList())),
              ));
        },
      ),
    );
  }
}
