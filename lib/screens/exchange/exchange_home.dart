import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:test_database_floor/screens/exchange/add_exchange.dart';
import 'package:test_database_floor/screens/exchange/update_exchange.dart';
import 'package:test_database_floor/services/exchange_cubit/cubit.dart';
import 'package:test_database_floor/services/exchange_cubit/states.dart';
import 'package:test_database_floor/widget/custom_appBar.dart';
import 'package:test_database_floor/widget/widgets.dart';

class ExchangeHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => ExchangeCubit()..createDatabase(),
        ),
      ],
      child: BlocConsumer<ExchangeCubit, ExchangeStates>(
        listener: (BuildContext context, ExchangeStates state) {},
        builder: (BuildContext context, ExchangeStates state) {
          ExchangeCubit cubit = ExchangeCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                title: Text('Exchang Category'),
                centerTitle: true,
                backgroundColor: Colors.amber[400],
              ),
              body: ConditionalBuilder(
                condition: true,
                fallback: (context) => Center(
                  child: CircularProgressIndicator(),
                ),
                builder: (context) {
                  return ListView.builder(
                    itemCount: cubit.exchanges.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          color: Colors.white,
                          child: ListTile(
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                cubit.deleteExchangeFromDatabase(
                                    id: cubit.exchanges[index].id);
                              },
                            ),
                            contentPadding: EdgeInsets.all(8.0),
                            title: Row(
                              children: [
                                Image.asset(
                                  'assets/category/image03.png',
                                  width: 40,
                                  height: 40,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(cubit.exchanges[index].name),
                              ],
                            ),
                            onTap: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpdateExchange(
                                          exchangeId: cubit.exchanges[index].id,
                                          exchangeName:
                                              cubit.exchanges[index].name,
                                        ))),
                          )
                          // Column(children: [
                          //   Row(
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       Row(
                          //         children: [
                          //           Image.asset(
                          //             'assets/image/user.png',
                          //             width: 40,
                          //             height: 40,
                          //           ),
                          //           SizedBox(
                          //             width: 15,
                          //           ),
                          //           Text(cubit.exchanges[index].name),
                          //         ],
                          //       ),
                          //       Row(
                          //         children: [
                          //           IconButton(
                          //             onPressed: () {},
                          //             icon: Icon(
                          //               Icons.analytics_outlined,
                          //               size: 20,
                          //             ),
                          //           ),
                          //           IconButton(
                          //             onPressed: () => Navigator.pushReplacement(
                          //                 context,
                          //                 MaterialPageRoute(
                          //                     builder: (context) =>
                          //                         UpdateExchange(
                          //                           exchangeId:
                          //                               cubit.exchanges[index].id,
                          //                           exchangeName: cubit
                          //                               .exchanges[index].name,
                          //                         ))),
                          //             icon: Icon(
                          //               Icons.edit,
                          //               size: 20,
                          //             ),
                          //           ),
                          //           IconButton(
                          //             onPressed: () {
                          //               cubit.deleteExchangeFromDatabase(
                          //                   id: cubit.exchanges[index].id);
                          //             },
                          //             icon: Icon(
                          //               Icons.delete,
                          //               size: 20,
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // ]),
                          );
                    },
                  );
                },
              ),
              floatingActionButton: customFloatinActionButton(
                icon: Icon(Icons.add),
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => AddExchange())),
              ));
        },
      ),
    );
  }
}
