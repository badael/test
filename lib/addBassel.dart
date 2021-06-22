import 'package:flutter/material.dart';
import 'package:test_database_floor/myhomepage.dart';
import 'package:test_database_floor/servises/bassel_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'servises/bassel_cubit/cubit.dart';

class AddBassel extends StatelessWidget {


  TextEditingController nameController = TextEditingController();
  TextEditingController ownerIdController = TextEditingController();

  int isID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => BasselCubit()..createDatabase(),
        child: BlocConsumer<BasselCubit,BasselStates>(
          listener: (context,state){
            if(state is InsertBasselsToDatabaseState){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));
            }
          },
          builder: (context,state){
            return ListView(children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Name Bassel',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: ownerIdController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: Icon(Icons.confirmation_number),
                  hintText: 'What do people call you?',
                  labelText: 'Wallet Id',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              FlatButton(
                  child: Text('save'),
                  onPressed: () {
                    BasselCubit.get(context).insertToDatabase(
                      isId: isID,
                      basselName: nameController.text,
                      ownerId: int.parse(ownerIdController.text.toString()),
                    );
                  })
            ]);
          },
        ),
      ),
    );
  }
}

