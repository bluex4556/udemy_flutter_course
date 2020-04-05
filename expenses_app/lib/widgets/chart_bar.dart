import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {

  final day;
  final amount;
  final fractionOfTotal;

  ChartBar(this.day,this.amount,this.fractionOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints){
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: constraints.maxHeight * 0.1,
                child: FittedBox(
                    child: Text(amount.toString())),
              ),
              SizedBox(height: constraints.maxHeight * 0.05),
              Container(
                height: constraints.maxHeight * 0.7,
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
                          borderRadius: BorderRadius.circular(5),
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.05),
              Container(
                  height: constraints.maxHeight * 0.1,
                  child: FittedBox(child: Text(day))),
            ],
          ),
        );
      },
    );
  }
}
