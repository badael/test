import 'package:flutter/material.dart';
import 'package:test_database_floor/services/currency_cubit/cubit.dart';
import 'package:test_database_floor/services/currency_cubit/states.dart';
import 'package:test_database_floor/services/wallet_cubit/cubit.dart';
import 'package:test_database_floor/services/wallet_cubit/states.dart';
import 'package:test_database_floor/screens/wallet/updateWallet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder/conditional_builder.dart';

import 'addwallet.dart';

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

      child: BlocConsumer<WalletCubit,WalletStates>(
        listener: (BuildContext context,WalletStates state){},
        builder: (BuildContext context, WalletStates state){

          WalletCubit cubit = WalletCubit.get(context);
          CurrencyCubit currencyCubit =CurrencyCubit.get(context);
          return Scaffold(
            appBar: AppBar(
                title:
                Text('My Wallet')
            ),
            body: ConditionalBuilder(
              condition: true,
              fallback: (context) => Center(child: CircularProgressIndicator(),),
              builder: (context) {

                return ListView.builder(
                  itemCount: cubit.wallets.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(8.0),
                          title: Text(cubit.wallets[index].name),
                          leading: BlocConsumer<CurrencyCubit,CurrencyStates>(
                              listener:(context,state){},
                              builder:(context,state){
                                return IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    currencyCubit.deleteCurrencyFromDatabase(id:currencyCubit.getWalletId(id: cubit.wallets[index].id ));

                                    cubit.deleteWalletFromDatabase(id: cubit.wallets[index].id);

                                  },
                                );
                              }
                          ),
                          subtitle:BlocConsumer<CurrencyCubit,CurrencyStates>(
                              listener: (BuildContext context,CurrencyStates state){},
                              builder: (BuildContext context, CurrencyStates state){
                                return Text(currencyCubit.getCurrencyOfWallet(walletId: cubit.wallets[index].id));
                              }
                          ) ,
                          onTap: () => Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Updatewallet(walletId:cubit.wallets[index].id ,walletName: cubit.wallets[index].name,))),
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
                  MaterialPageRoute(builder: (context) => Addwallet())),
            ),
          );
        },
      ),
    );
  }
}
