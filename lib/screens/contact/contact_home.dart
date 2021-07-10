import 'package:flutter/material.dart';
import 'package:test_database_floor/screens/contact/add_contact.dart';
import 'package:test_database_floor/screens/contact/update_contact.dart';
import 'package:test_database_floor/services/contact_cubit/cubit.dart';
import 'package:test_database_floor/services/contact_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:test_database_floor/widget/custom_appBar.dart';

class ContactHome extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => ContactCubit()..createDatabase(),
        ),
      ],

      child: BlocConsumer<ContactCubit,ContactStates>(
        listener: (BuildContext context,ContactStates state){},
        builder: (BuildContext context, ContactStates state){

          ContactCubit cubit = ContactCubit.get(context);
          return Scaffold(
            appBar: CustomAppBar(
                Icon(Icons.wallet_giftcard),
                'My Contact'),
            body: ConditionalBuilder(
              condition: true,
              fallback: (context) => Center(child: CircularProgressIndicator(),),
              builder: (context) {

                return ListView.builder(
                  itemCount: cubit.contacts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(8.0),
                          title: Text(cubit.contacts[index].name),
                          leading: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              cubit.deleteContactFromDatabase(id: cubit.contacts[index].id);

                            },
                          ),
                          onTap: () => Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => UpdateContact(contactId:cubit.contacts[index].id ,contactName: cubit.contacts[index].name,))),
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
                  MaterialPageRoute(builder: (context) => AddContact())),
            ),
          );
        },
      ),
    );
  }
}
