import 'package:flutter/material.dart';

class AnswerText extends StatelessWidget {
  final String answerText;
  final Function clickHandler;

  AnswerText(this.answerText, this.clickHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(
          answerText,
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        onPressed: clickHandler,
      ),
      margin: EdgeInsets.all(5),
    );
  }
}
