import 'package:floor/floor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_database_floor/screens/contact/contact_home.dart';
import 'package:test_database_floor/services/contact_cubit/cubit.dart';
import 'package:test_database_floor/services/contact_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_database_floor/widget/custom_widgets.dart';

class AddContact extends StatelessWidget {
  TextEditingController nameController = TextEditingController();

  int isID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          icon: Icon(Icons.contact_page), title: Text('add contact')),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => ContactCubit()..createDatabase(),
          ),
        ],
        child: BlocConsumer<ContactCubit, ContactStates>(
          listener: (context, ContactStates state) {
            if (state is InsertContactsToDatabaseState) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ContactHome()));
            }
          },
          builder: (context, state) {
            return ListView(children: [
              SizedBox(
                height: 20,
              ),
              customFormField(
                  label: 'name contact',
                  controller: nameController,
                  prefix: Icons.wallet_giftcard,
                  type: TextInputType.text,
                  isClickable: true,
                  onChange: (String value) {},
                  onSubmit: (String value) {},
                  onTap: () {}),
              // TextFormField(
              //   controller: nameController,
              //   decoration: const InputDecoration(
              //     icon: Icon(Icons.person),
              //     hintText: 'What do people call you?',
              //     labelText: 'Name Contact',
              //   ),
              // ),
              SizedBox(
                height: 50,
              ),
              FlatButton(
                  child: Text('save'),
                  onPressed: () {
                    ContactCubit.get(context).insertToDatabase(
                      isId: isID,
                      contactName: nameController.text,
                    );
                  })
            ]);
          },
        ),
      ),
    );
  }
}
