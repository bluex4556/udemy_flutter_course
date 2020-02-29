import 'package:flutter/material.dart';

class CompleteQuiz extends StatelessWidget {

  final Function restartHandler;

  CompleteQuiz(this.restartHandler);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Center(
            child: Text(
              "You did it",
              style: TextStyle(
                fontSize: 48,
              ),
            ),
          ),
        ),
        RaisedButton(
          child: Text("Restart Quiz?", style: TextStyle(fontSize: 22),) ,
          onPressed: restartHandler,
        )
      ],
    );
  }
}
