import 'package:floor/floor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_database_floor/models/contact.dart';
import 'package:test_database_floor/models/exchange_category.dart';
import 'package:test_database_floor/models/wallet.dart';
import 'package:test_database_floor/screens/report/transactions_by_contact.dart';
import 'package:test_database_floor/screens/transaction/transaction_home.dart';
import 'package:test_database_floor/services/contact_cubit/cubit.dart';
import 'package:test_database_floor/services/contact_cubit/states.dart';
import 'package:test_database_floor/services/exchange_cubit/cubit.dart';
import 'package:test_database_floor/services/exchange_cubit/states.dart';
import 'package:test_database_floor/services/transaction_cubit/cubit.dart';
import 'package:test_database_floor/services/transaction_cubit/states.dart';
import 'package:test_database_floor/services/wallet_cubit/cubit.dart';
import 'package:test_database_floor/services/wallet_cubit/states.dart';
import 'package:test_database_floor/widget/custom_appBar.dart';
import 'package:test_database_floor/widget/custom_textFormField.dart';

// ignore: must_be_immutable
class TransactionByContact extends StatelessWidget {

  TextEditingController contactIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(
          Icon(Icons.wallet_giftcard),
          'Transaction By Contact') ,
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
              SizedBox(
                height: 50,
              ),
              BlocConsumer<ContactCubit,ContactStates>(
                listener: (context,ContactStates state){},
                builder:(context,ContactStates state){
                  var x = ContactCubit.get(context);
                  // ignore: unrelated_type_equality_checks
                  return TextField(
                    // onSubmitted: (value) => _childInfo(context),
                    textAlign: TextAlign.right,
                    readOnly: true,
                    controller: contactIdController,
                    style: TextStyle(fontSize: 18.0 , color: Colors.amberAccent,),cursorColor: Colors.amberAccent,
                    decoration: InputDecoration(
                      labelStyle: new TextStyle(
                        color: Colors.amberAccent,

                      ),
                      focusedBorder:UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.amberAccent, width: 1.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.amberAccent),
                      ),
                      prefixIcon: new DropdownButton<String>(
                        underline: Container(
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.transparent))
                          ),
                        ),
                        icon: new Icon(Icons.keyboard_arrow_down),
                        items: x.contacts.map((Contact value) {
                          return new DropdownMenuItem<String>(
                            value: value.name,
                            child: Text(value.name) ,
                          );
                        }).toList(),
                        onChanged: (String value){
                          contactIdController.text =value;
                        },
                      ),
                      hintText: 'chose a Contact',
                      hintStyle: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),
                      hoverColor: Colors.amberAccent,
                      focusColor: Colors.amberAccent,
                    ),
//                        onSubmitted: (value) =>  Navigator.push(
//                            context,
//                            MaterialPageRoute(builder: (context) => ChildInfo(children[0]))) ,
                  );
                } ,
              ),
              SizedBox(
                height: 20,
              ),
              BlocConsumer<ContactCubit,ContactStates>(
                listener:(context,ContactStates states){} ,
                builder: (context,ContactStates states){

                  return FlatButton(
                      child: Text('save'),
                      onPressed: () {
                        TransactionCubit.get(context).getTransactionByContactFromDatabase(
                            contactId: ContactCubit.get(context).getContactId(contactName: contactIdController.text
                            ));
                        int x = ContactCubit.get(context).getContactId(contactName: contactIdController.text);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => TransactionsByContact(contactId: x )));
                      });
                },
              )
            ]);
          },
        ),
      ),
    );
  }
}

