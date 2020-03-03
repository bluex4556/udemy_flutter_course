import 'package:flutter/material.dart';

import './transactions.dart';
import './transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
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
        shopName: "Vmart")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: Text("hello"),
          ),
          TransactionList(transactions),
        ],
      ),
    );
  }
}
