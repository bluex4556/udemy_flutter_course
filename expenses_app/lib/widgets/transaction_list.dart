import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class TransactionList extends StatelessWidget {

  final List<Transactions> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      child: transactions.isEmpty? Column(
        children: <Widget>[
          Image.asset("assets/images/shopping_cart.png"),
          Text(
            "No recent purchases",
            style: TextStyle(
              fontSize: 20,
            ),
          )
        ],
      ):ListView.builder(
        itemBuilder: (ctx,index){
          return Card(
            margin: EdgeInsets.all(5),
            elevation: 5,
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    "₹ ${transactions[index].amount}",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.redAccent,
                        fontStyle: FontStyle.italic),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
                      "${transactions[index].item}",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                    ),
                    Text(
                      DateFormat.yMMMd().format(transactions[index].purchaseDate),
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 0,horizontal: 50),),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  decoration: BoxDecoration(
                    border: Border(left: BorderSide(width: 2,color: Colors.grey)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("To"),
                      Text("${transactions[index].shopName}", style: TextStyle(fontSize: 18),),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
