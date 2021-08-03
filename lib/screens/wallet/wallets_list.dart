import 'package:flutter/material.dart';

import 'package:test_database_floor/widget/custom_widgets.dart';

import 'add_bank_account.dart';
import 'add_cash_wallet.dart';
import 'add_credit_card.dart';
import 'add_planer_save.dart';
import 'add_priberd_card.dart';

class WalletsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: Text('wallets'),
        icon: Icon(Icons.ac_unit),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RaisedButton(
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => AddCashWallet())),
                color: Colors.grey[100],
                child: ListTile(
                  horizontalTitleGap: 50,
                  leading: Container(
                    height: 35,
                    width: 35,
                    child: Image(
                      image: AssetImage('assets/wallet/dollar.png'),
                    ),
                  ),
                  title: Text(
                    'CASH',
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              RaisedButton(
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => AddBankAccount())),
                color: Colors.grey[100],
                child: ListTile(
                  horizontalTitleGap: 50,
                  leading: Container(
                    height: 35,
                    width: 35,
                    child: Image(
                      image: AssetImage('assets/wallet/account.png'),
                    ),
                  ),
                  title: Text(
                    'Bank Account',
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              RaisedButton(
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => AddCreditCard())),
                color: Colors.grey[100],
                child: ListTile(
                  horizontalTitleGap: 50,
                  leading: Container(
                    height: 35,
                    width: 35,
                    child: Image(
                      image: AssetImage('assets/wallet/card.png'),
                    ),
                  ),
                  title: Text(
                    'Credit Card',
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              RaisedButton(
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => AddPrepaidCard())),
                color: Colors.grey[100],
                child: ListTile(
                  horizontalTitleGap: 50,
                  leading: Container(
                    height: 35,
                    width: 35,
                    child: Image(
                      image: AssetImage('assets/wallet/credit-cards.png'),
                    ),
                  ),
                  title: Text(
                    'Prepaid Card',
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              RaisedButton(
                color: Colors.grey[100],
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => AddPlannerSave())),
                child: ListTile(
                  horizontalTitleGap: 50,
                  leading: Container(
                    height: 35,
                    width: 35,
                    child: Image(
                      image: AssetImage('assets/wallet/revenue.png'),
                    ),
                  ),
                  title: Text(
                    'Planner Save',
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
