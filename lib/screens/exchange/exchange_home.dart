import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:test_database_floor/screens/exchange/add_exchange.dart';
import 'package:test_database_floor/screens/exchange/update_exchange.dart';
import 'package:test_database_floor/services/exchange_cubit/cubit.dart';
import 'package:test_database_floor/services/exchange_cubit/states.dart';

class ExchangeHome extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => ExchangeCubit()..createDatabase(),
        ),
      ],

      child: BlocConsumer<ExchangeCubit,ExchangeStates>(
        listener: (BuildContext context,ExchangeStates state){},
        builder: (BuildContext context, ExchangeStates state){

          ExchangeCubit cubit = ExchangeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
                title:
                Text('Exchange Category')
            ),
            body: ConditionalBuilder(
              condition: true,
              fallback: (context) => Center(child: CircularProgressIndicator(),),
              builder: (context) {

                return ListView.builder(
                  itemCount: cubit.exchanges.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(8.0),
                          title: Text(cubit.exchanges[index].name),
                          leading: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              cubit.deleteExchangeFromDatabase(id: cubit.exchanges[index].id);

                            },
                          ),
                          onTap: () => Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => UpdateExchange(exchangeId:cubit.exchanges[index].id ,exchangeName: cubit.exchanges[index].name,))),
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
                  MaterialPageRoute(builder: (context) => AddExchange())),
            ),
          );
        },
      ),
    );
  }
}
