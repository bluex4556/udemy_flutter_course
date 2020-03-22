import 'package:flutter/material.dart';

import 'models/transactions.dart';
import 'widgets/transaction_list.dart';
import 'widgets/add_transaction.dart';
import 'widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepPurpleAccent,
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontSize: 20,
                ),
                button: TextStyle(
                  color: Colors.white,
                ),
              )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transactions> transactions = [
    Transactions(
        item: "Chips",
        amount: 10,
        purchaseDate: DateTime.now(),
        shopName: "Vmart"),
  ];

  void addTransaction(String name, String price, String shopName, DateTime chosenDate) {
    if(chosenDate == null)
        chosenDate = DateTime.now();
    setState(() {
      transactions.add(new Transactions(
        item: name,
        amount: int.parse(price),
        purchaseDate: chosenDate,
        shopName: shopName,
      ));
    });
  }

  List<Transactions> get lastWeekTransaction {
    return transactions.where((item) {
      return item.purchaseDate
          .isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return AddTransaction(addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses"),
      ),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Chart(lastWeekTransaction),
              Padding(padding: EdgeInsets.all(20)),
              TransactionList(transactions),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Theme.of(context).textTheme.button.color,
        ),
        onPressed: () => startAddNewTransaction(context),
      ),
    );
  }
}
