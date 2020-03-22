import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {

  final day;
  final amount;
  final fractionOfTotal;

  ChartBar(this.day,this.amount,this.fractionOfTotal);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FittedBox(
              child: Text(amount.toString())),
          SizedBox(height: 6),
          Container(
            height: 80,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey[400],
                    ),
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: fractionOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 6),
          Text(day)
        ],
      ),
    );
  }
}