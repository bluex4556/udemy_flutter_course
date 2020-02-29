import 'package:flutter/material.dart';

class AnswerText extends StatelessWidget {
  final String answerText;

  AnswerText(this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        answerText,
        style: TextStyle(
          fontSize: 22,
        ),
      ),
      margin: EdgeInsets.fromLTRB(1, 5, 10, 5),
    );
  }
}
