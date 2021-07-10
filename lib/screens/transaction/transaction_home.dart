import 'package:flutter/material.dart';
import 'package:test_database_floor/screens/transaction/add_transaction.dart';
import 'package:test_database_floor/screens/transaction/update_transaction.dart';
import 'package:test_database_floor/services/contact_cubit/cubit.dart';
import 'package:test_database_floor/services/currency_cubit/cubit.dart';
import 'package:test_database_floor/services/currency_cubit/states.dart';
import 'package:test_database_floor/services/exchange_cubit/cubit.dart';
import 'package:test_database_floor/services/transaction_cubit/cubit.dart';
import 'package:test_database_floor/services/transaction_cubit/states.dart';
import 'package:test_database_floor/services/wallet_cubit/cubit.dart';
import 'package:test_database_floor/services/wallet_cubit/states.dart';
import 'package:test_database_floor/screens/wallet/updateWallet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:test_database_floor/widget/custom_appBar.dart';

class TransactionHome extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => TransactionCubit()..createDatabase(),
        ),
        BlocProvider(
          create: (BuildContext context) => ExchangeCubit()..createDatabase(),
        ),
        BlocProvider(
          create: (BuildContext context) => ContactCubit()..createDatabase(),
        ),
        BlocProvider(
          create: (BuildContext context) => WalletCubit()..createDatabase(),
        ),
      ],

      child: BlocConsumer<TransactionCubit,TransactionStates>(
        listener: (BuildContext context,TransactionStates state){},
        builder: (BuildContext context, TransactionStates state){

          TransactionCubit transactionCubit = TransactionCubit.get(context);
          ContactCubit contactCubit = ContactCubit.get(context);
          ExchangeCubit exchangeCubit = ExchangeCubit.get(context);
          WalletCubit walletCubit = WalletCubit.get(context);
          return Scaffold(
            appBar: CustomAppBar(
                Icon(Icons.wallet_giftcard),
                'Transaction'),
            body: ConditionalBuilder(
              condition: true,
              fallback: (context) => Center(child: CircularProgressIndicator(),),
              builder: (context) {

                return ListView.builder(
                  itemCount: transactionCubit.transactions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(8.0),
                          title: Text(transactionCubit.transactions[index].total),
                          leading: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              // walletCubit.deleteWalletFromDatabase(id:currencyCubit.getWalletId(id: cubit.wallets[index].id ));

                              transactionCubit.deleteTransactionFromDatabase(id: transactionCubit.transactions[index].id);

                            },
                          ),
                          // subtitle:BlocConsumer<WalletCubit,WalletStates>(
                          //     listener: (BuildContext context,WalletStates state){},
                          //     builder: (BuildContext context, WalletStates state){
                          //       return Text(walletCubit.getCurrencyOfWallet(walletId: cubit.wallets[index].id));
                          //     }
                          // ) ,
                          onTap: () => Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => UpdateTransaction(transactionId:transactionCubit.transactions[index].id ))),
                        ));
                  },
                );
                ;
              },
            ),
            // Text(basselCubit.bassels[index].name)
            // FutureBuilder(
            //   future: cubit.dao.retrieveUsers(),
            //   builder: (BuildContext context, AsyncSnapshot<List<Wallet>> snapshot) {
            //     if (snapshot.hasData) {
            //       return ListView.builder(
            //         itemCount: snapshot.data?.length,
            //         itemBuilder: (BuildContext context, int index) {
            //           return Card(
            //               child: ListTile(
            //                 contentPadding: EdgeInsets.all(8.0),
            //                 title: Text(snapshot.data[index].name),
            //                 leading: IconButton(
            //                   icon: Icon(Icons.delete),
            //                   onPressed: () {
            //
            //                       cubit.dao.deleteUser(snapshot.data[index].id);
            //
            //                   },
            //                 ),
            //               ));
            //         },
            //       );
            //     } else {
            //       return Center(child: CircularProgressIndicator());
            //     }
            //   },
            // ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => AddTransaction())),
            ),
          );
        },
      ),
    );
  }
}
