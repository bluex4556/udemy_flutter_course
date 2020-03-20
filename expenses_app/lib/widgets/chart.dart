import 'package:expensesapp/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

// ignore: must_be_immutable
class Chart extends StatelessWidget{

  final List<Transactions> transactions;
  int totalAmount;
  Chart(this.transactions){
    totalAmount = transactions.fold(0, (prev,tx){
      return prev + tx.amount;
    });
  }

  List<Map<String,Object>> get weekTransaction{

    return List.generate(7, (index){
      final weekDay = DateTime.now().subtract(Duration(days: index));
      int sum = 0;
      for(Transactions tx in  transactions)
        {
          if(tx.purchaseDate.day == weekDay.day)
            sum+= tx.amount;
        }

      return {
        "day": DateFormat.E().format(weekDay),
        "amount": sum,
      };

    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:
            weekTransaction.reversed.map(
                  (tx){
                    double fractionOfTotal = (totalAmount == 0)? 0.0 : (tx["amount"] as int) / totalAmount;
              return ChartBar(tx["day"], tx["amount"] , fractionOfTotal);
            }).toList(),

        ),
      ),
    );
  }
  
}