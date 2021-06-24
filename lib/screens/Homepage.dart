import 'package:floor_test_2/screens/cubit/wallet_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'AddWallet.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WalletCubit()..creatDataBase(),
      child: Scaffold(
        body: null,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddWallet())),
        ),
      ),
    );
  }
}
