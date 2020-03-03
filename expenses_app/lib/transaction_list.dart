import 'package:expensesapp/transactions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
        return Card(
          margin: EdgeInsets.all(5),
          elevation: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Text(
                  "₹ ${tx.amount}",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.redAccent,
                      fontStyle: FontStyle.italic),
                ),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                decoration: BoxDecoration(
                    border: Border.all(
                  width: 2,
                  color: Colors.blueGrey,
                )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${tx.item}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 3),
                  ),
                  Text(
                    "${tx.purchaseDate}",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border(left: BorderSide(width: 2,color: Colors.grey)),
                ),
                child: Column(
                  children: <Widget>[
                    Text("To"),
                    Text("${tx.shopName}", style: TextStyle(fontSize: 18),),
                  ],
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
