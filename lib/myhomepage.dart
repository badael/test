import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:test_database_floor/models/wallet.dart';
import 'package:test_database_floor/servises/dao_wallet.dart';
import 'package:test_database_floor/servises/wallet_cubit/cubit.dart';
import 'package:test_database_floor/servises/wallet_cubit/states.dart';
import 'addwallet.dart';
import 'database/database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:conditional_builder/conditional_builder.dart';

class MyHomePage extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WalletCubit()..createDatabase(),
      child: BlocConsumer<WalletCubit,WalletStates>(
        listener: (BuildContext context,WalletStates state){},
        builder: (BuildContext context, WalletStates){

          WalletCubit cubit = WalletCubit.get(context);
          return Scaffold(
            appBar: AppBar(title: Text('My Wallet')),
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
                                leading: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {

                                      cubit.deleteWalletFromDatabase(id: cubit.wallets[index].id);

                                  },
                                ),
                              ));
                        },
                      );
                    ;
              },
            ),

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
