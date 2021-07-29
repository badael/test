import 'package:flutter/material.dart';
import 'package:test_database_floor/screens/wallet/addwallet.dart';
import 'package:test_database_floor/screens/wallet/wallet_home.dart';
import 'package:test_database_floor/widget/custom_widgets.dart';

class WalletsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: Text('wallets'),
        icon: customCircleAvatar(
          image: AssetImage('assets/wallet/Group2.png'),
        ),
        cancelMethod: () => Navigator.pop(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: ListView(
            children: [
              RaisedButton(
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Addwallet())),
                color: Colors.grey[300],
                child: ListTile(
                  leading: Container(
                    child: Image(
                      image: AssetImage('assets/wallet/dollar.png'),
                    ),
                  ),
                  title: Text('CASH'),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              RaisedButton(
                onPressed: () {},
                color: Colors.grey[300],
                child: ListTile(
                  leading: Container(
                    child: Image(
                      image: AssetImage('assets/wallet/Group3.png'),
                    ),
                  ),
                  title: Text('Bank Account'),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              RaisedButton(
                onPressed: () {},
                color: Colors.grey[300],
                child: ListTile(
                  leading: Container(
                    child: Image(
                      image: AssetImage('assets/wallet/Group1.png'),
                    ),
                  ),
                  title: Text('Credit Card'),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              RaisedButton(
                onPressed: () {},
                color: Colors.grey[300],
                child: ListTile(
                  leading: Container(
                    child: Image(
                      image: AssetImage('assets/wallet/credit-cards.png'),
                    ),
                  ),
                  title: Text('Prepaid Card'),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              RaisedButton(
                onPressed: () {},
                color: Colors.grey[300],
                child: ListTile(
                  leading: Container(
                    child: Image(
                      image: AssetImage('assets/wallet/revenue.png'),
                    ),
                  ),
                  title: Text('Planner Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
