import 'package:floor/floor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_database_floor/screens/transaction/transaction_home.dart';
import 'package:test_database_floor/services/contact_cubit/cubit.dart';
import 'package:test_database_floor/services/exchange_cubit/cubit.dart';
import 'package:test_database_floor/services/transaction_cubit/cubit.dart';
import 'package:test_database_floor/services/transaction_cubit/states.dart';
import 'package:test_database_floor/services/wallet_cubit/cubit.dart';

class AddTransaction extends StatelessWidget {


  TextEditingController totalController = TextEditingController();
  TextEditingController paidController = TextEditingController();
  TextEditingController restController = TextEditingController();
  TextEditingController transactionDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController exchangeIdController = TextEditingController();
  TextEditingController walletIdController = TextEditingController();
  TextEditingController contactIdController = TextEditingController();
  TextEditingController isIncomeController = TextEditingController();

  int isID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:MultiBlocProvider(
        providers:[
          BlocProvider(
            create: (BuildContext context) => WalletCubit()..createDatabase(),
          ),
          BlocProvider(
            create: (BuildContext context) => ExchangeCubit()..createDatabase(),
          ),
          BlocProvider(
            create: (BuildContext context) => ContactCubit()..createDatabase(),
          ),
          BlocProvider(
            create: (BuildContext context) => TransactionCubit()..createDatabase(),
          ),
        ],


        child: BlocConsumer<TransactionCubit,TransactionStates>(
          listener: (context,state){
            if(state is InsertTransactionsToDatabaseState){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => TransactionHome()));
            }
          },
          builder: (context,state){
            return ListView(children: [
              TextFormField(
                controller: totalController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'total transaction',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: paidController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'paid',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: restController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'rest',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: transactionDateController,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'transactionDate',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: descriptionController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'description',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: isIncomeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'isIncome',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: exchangeIdController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'exchangeId',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: contactIdController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'contactId',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: walletIdController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'walletId',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              FlatButton(
                  child: Text('save'),
                  onPressed: () {
                    TransactionCubit.get(context).insertToDatabase(
                        isId: isID,
                        contactId: int.parse(contactIdController.text),
                        description: descriptionController.text,
                        exchangeId: int.parse(exchangeIdController.text),
                        paid: paidController.text,
                        rest: restController.text,
                        total: totalController.text,
                        transactionDate: transactionDateController.text,
                        walletId: int.parse(walletIdController.text),
                    );


                  })
            ]);
          },
        ),
      ),
    );
  }
}

