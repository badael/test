import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:test_database_floor/screens/contact/contact_home.dart';
import 'package:test_database_floor/screens/currency/currency_home.dart';
import 'package:test_database_floor/screens/exchange/exchange_home.dart';
import 'package:test_database_floor/screens/transaction/transaction_home.dart';
import 'package:test_database_floor/screens/wallet/wallet_home.dart';
import 'package:test_database_floor/services/currency_cubit/cubit.dart';
import 'package:test_database_floor/services/wallet_cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_database_floor/widget/custom_widgets.dart';

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
        child: Scaffold(
          appBar:
              customAppBar(icon: Icon(Icons.money), title: Text('Task Bee')),
          body: Center(
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  color: Colors.black12,
                  child: TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WalletHome())),
                      child: Text('Wallet')),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  color: Colors.black12,
                  child: TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactHome())),
                      child: Text('Contact')),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  color: Colors.black12,
                  child: TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExchangeHome())),
                      child: Text('Exchange')),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  color: Colors.black12,
                  child: TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CurrencyHome())),
                      child: Text('Currency')),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  color: Colors.black12,
                  child: TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TransactionHome())),
                      child: Text('Transaction')),
                ),
              ],
            )),
          ),
        )

        // BlocConsumer<WalletCubit,WalletStates>(
        //   listener: (BuildContext context,WalletStates state){},
        //   builder: (BuildContext context, WalletStates state){
        //
        //     WalletCubit cubit = WalletCubit.get(context);
        //     CurrencyCubit basselCubit =CurrencyCubit.get(context);
        //     return Scaffold(
        //       appBar: AppBar(
        //           title:
        //           Text('My Wallet')
        //       ),
        //       body: ConditionalBuilder(
        //         condition: true,
        //         fallback: (context) => Center(child: CircularProgressIndicator(),),
        //         builder: (context) {
        //
        //                 return ListView.builder(
        //                   itemCount: cubit.wallets.length,
        //                   itemBuilder: (BuildContext context, int index) {
        //                     return Card(
        //                         child: ListTile(
        //                           contentPadding: EdgeInsets.all(8.0),
        //                           title: Text(cubit.wallets[index].name),
        //                           leading: BlocConsumer<CurrencyCubit,BasselStates>(
        //                             listener:(context,state){},
        //                               builder:(context,state){
        //                               return IconButton(
        //                                 icon: Icon(Icons.delete),
        //                                 onPressed: () {
        //                                   basselCubit.deleteCurrencyFromDatabase(id:basselCubit.getWalletId(id: cubit.wallets[index].id ));
        //
        //                                   cubit.deleteWalletFromDatabase(id: cubit.wallets[index].id);
        //
        //                                 },
        //                               );
        //                               }
        //                           ),
        //                           subtitle:BlocConsumer<CurrencyCubit,BasselStates>(
        //                             listener: (BuildContext context,BasselStates state){},
        //                             builder: (BuildContext context, BasselStates state){
        //                               return Text(basselCubit.getCurrencyOfWallet(walletId: cubit.wallets[index].id));
        //                             }
        //                           ) ,
        //                           onTap: () => Navigator.pushReplacement(context,
        //                               MaterialPageRoute(builder: (context) => Updatewallet(walletId:cubit.wallets[index].id ,walletName: cubit.wallets[index].name,))),
        //                         ));
        //                   },
        //                 );
        //               ;
        //         },
        //       ),
        //         // Text(basselCubit.bassels[index].name)
        //       // FutureBuilder(
        //       //   future: cubit.dao.retrieveUsers(),
        //       //   builder: (BuildContext context, AsyncSnapshot<List<Wallet>> snapshot) {
        //       //     if (snapshot.hasData) {
        //       //       return ListView.builder(
        //       //         itemCount: snapshot.data?.length,
        //       //         itemBuilder: (BuildContext context, int index) {
        //       //           return Card(
        //       //               child: ListTile(
        //       //                 contentPadding: EdgeInsets.all(8.0),
        //       //                 title: Text(snapshot.data[index].name),
        //       //                 leading: IconButton(
        //       //                   icon: Icon(Icons.delete),
        //       //                   onPressed: () {
        //       //
        //       //                       cubit.dao.deleteUser(snapshot.data[index].id);
        //       //
        //       //                   },
        //       //                 ),
        //       //               ));
        //       //         },
        //       //       );
        //       //     } else {
        //       //       return Center(child: CircularProgressIndicator());
        //       //     }
        //       //   },
        //       // ),
        //       floatingActionButton: FloatingActionButton(
        //         child: Icon(Icons.add),
        //         onPressed: () => Navigator.pushReplacement(context,
        //             MaterialPageRoute(builder: (context) => Addwallet())),
        //       ),
        //     );
        //   },
        // ),
        );
  }
}
