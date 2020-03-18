import 'package:flutter/material.dart';

import '../models/transactions.dart';
import './add_transaction.dart';
import './transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

  final List<Transactions> transactions = [
    Transactions(
        item: "Chips",
        amount: 10,
        purchaseDate: DateTime.now(),
        shopName: "Vmart"),
    Transactions(
        item: "Coke",
        amount: 30,
        purchaseDate: DateTime.now(),
        shopName: "Vmart"),
    Transactions(
        item: "Coke",
        amount: 30,
        purchaseDate: DateTime.now(),
        shopName: "Vmart")
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(transactions),
        Padding(padding: EdgeInsets.all(20),),
        AddTransaction(addTransaction),
      ],
    );
  }

  void addTransaction(String name, String price, String shopName){
    setState(() {
      transactions.add(new Transactions(
        item: name,
        amount:  int.parse(price),
        purchaseDate: DateTime.now(),
        shopName: shopName,
      ));
    });
  }
}
