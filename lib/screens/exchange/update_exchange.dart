import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_database_floor/screens/exchange/exchange_home.dart';
import 'package:test_database_floor/services/exchange_cubit/cubit.dart';
import 'package:test_database_floor/services/exchange_cubit/states.dart';
import 'package:test_database_floor/widget/widgets.dart';

import 'category.dart';

class UpdateExchange extends StatelessWidget {
  final exchangeId;
  final exchangeName;

  TextEditingController nameController = TextEditingController();

  UpdateExchange({Key key, this.exchangeId, this.exchangeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => ExchangeHome()));
          },
        ),
        centerTitle: true,
        title: Text('Update Exchang Category'),
        backgroundColor: Colors.amber[400],
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => ExchangeCubit()..createDatabase(),
          ),
        ],
        child: BlocConsumer<ExchangeCubit, ExchangeStates>(
          listener: (context, state) {
            if (state is UpdateExchangesToDatabaseState) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ExchangeHome()));
            }
          },
          builder: (context, state) {
            return Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Category()));
                            },
                            child: CircleAvatar(),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: customFormField(
                                    label: 'Name Category',
                                    controller: nameController =
                                        TextEditingController(
                                            text: '$exchangeName'),
                                    prefix: Icons.category)),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          customRaisedButton(
                              onPressed: () {
                                ExchangeCubit.get(context)
                                    .updateExchangeDatabase(
                                  isId: exchangeId,
                                  exchangeName: nameController.text,
                                );
                              },
                              text: 'Update'),
                          customRaisedButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => ExchangeHome()));
                              },
                              text: 'Cansel'),
                        ],
                      ),
                    ]),
              ),
            );
          },
        ),
      ),
    );
  }
}


  // ExchangeCubit.get(context).updateExchangeDatabase(
  //                     isId: exchangeId,
  //                     exchangeName: nameController.text,
  //                   );
  // nameController = TextEditingController(text: '$exchangeName'),