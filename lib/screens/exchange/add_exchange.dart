import 'package:floor/floor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_database_floor/screens/exchange/exchange_home.dart';
import 'package:test_database_floor/services/exchange_cubit/cubit.dart';
import 'package:test_database_floor/services/exchange_cubit/states.dart';
import 'package:test_database_floor/widget/custom_appBar.dart';
import 'package:test_database_floor/widget/custom_textFormField.dart';

class AddExchange extends StatelessWidget {


  TextEditingController nameController = TextEditingController();

  int isID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          Icon(Icons.wallet_giftcard),
          'Add Exchange'),
      body:MultiBlocProvider(
        providers:[
          BlocProvider(
            create: (BuildContext context) => ExchangeCubit()..createDatabase(),
          ),
        ],


        child: BlocConsumer<ExchangeCubit,ExchangeStates>(
          listener: (context,ExchangeStates state){
            if(state is InsertExchangesToDatabaseState){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ExchangeHome()));
            }
          },
          builder: (context,state){
            return ListView(children: [

              SizedBox(height: 100,),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Exchange Name',
                          // labelText: 'Exchange Name'
                        ),
                      )
                  ),
                   SizedBox(
                     width: 30,
                   ),
                   CircleAvatar(),
                  SizedBox(
                    width: 30,
                  ),

                ],
              ),
              SizedBox(
                height: 200,
              ),
              Card(
                margin: EdgeInsets.all(100),
                child: TextButton(
                    child: Text('save'),
                    onPressed: () {
                      ExchangeCubit.get(context).insertToDatabase(
                        isId: isID,
                        exchangeName: nameController.text,
                      );


                    }),
              )
            ]);
          },
        ),
      ),
    );
  }
}

