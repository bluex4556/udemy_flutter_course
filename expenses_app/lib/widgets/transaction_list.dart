import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;
  final deleteHandler;
  TransactionList(this.transactions, this.deleteHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Image.asset("assets/images/shopping_cart.png"),
                Text(
                  "No recent purchases",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: FittedBox(
                          child: Text(transactions[index].amount.toString())),
                    ),
                    title: Text(transactions[index].item),
                    subtitle: Text(DateFormat.yMMMd()
                        .format(transactions[index].purchaseDate)),
                    trailing: Container(
                      width: 120,
                      margin: EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                  left: BorderSide(
                                      color: Colors.grey, width: 0.3),
                                )),
                              ),
                              Padding(padding: EdgeInsets.only(right: 10),),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "To",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                  Text(
                                    transactions[index].shopName,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(Icons.delete_outline,),
                            color: Colors.redAccent,
                            onPressed: () => deleteHandler(index),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
