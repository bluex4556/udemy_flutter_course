import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  final String questionText;

  QuestionText(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        questionText,
        style: TextStyle(
          fontSize: 22,
        ),
      ),
      margin: EdgeInsets.all(20),
    );
  }
}
