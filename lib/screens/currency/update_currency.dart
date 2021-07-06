import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_database_floor/screens/currency/currency_home.dart';
import 'package:test_database_floor/services/currency_cubit/cubit.dart';
import 'package:test_database_floor/services/currency_cubit/states.dart';

class UpdateCurrency extends StatelessWidget {
  final currencyId;
  final currencyName;
  final walletId;

  TextEditingController nameController = TextEditingController();




  UpdateCurrency({Key key, this.currencyId,this.currencyName, this.walletId}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:MultiBlocProvider(
        providers:[
          BlocProvider(
            create: (BuildContext context) => CurrencyCubit()..createDatabase(),
          ),
        ],


        child: BlocConsumer<CurrencyCubit,CurrencyStates>(
          listener: (context,state){
            if(state is UpdateCurrencyToDatabaseState){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => CurrencyHome()));
            }
          },
          builder: (context,state){
            return ListView(children: [
              TextFormField(
                controller: nameController,
                // initialValue: walletName,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Name Currency',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextButton(
                  child: Text('save'),
                  onPressed: () {
                    CurrencyCubit.get(context).updateCurrencyDatabase(
                      isId: currencyId,
                      currencyName:  nameController.text,
                      ownerId: walletId
                    );


                  })
            ]);
          },
        ),
      ),
    );
  }
}

