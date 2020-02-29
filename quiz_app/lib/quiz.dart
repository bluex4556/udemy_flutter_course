import 'dart:ffi';

import 'package:flutter/material.dart';

import './question_text.dart';
import './answer_text.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function correctAnswerHandler;
  final Function incorrectAnswerHandler;
  final bool proceed;

  Quiz(
      {@required this.questions,
      @required this.questionIndex,
      @required this.correctAnswerHandler,
      @required this.incorrectAnswerHandler,
      @required this.proceed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: buildChildren(),
    );
  }

  List<Widget> buildChildren() {
    List<Widget> builder = [
      QuestionText(questions[questionIndex]["question"]),
    ];
    builder.addAll(
        (questions[questionIndex]["answers"] as List<Map<String, Object>>)
            .map((answer) {
      if (answer["correct"])
        return AnswerText(answer["text"], correctAnswerHandler);
      else
        return AnswerText(answer["text"], incorrectAnswerHandler);
    }).toList());
    if (!proceed)
      builder.add(Text(
        "Wrong",
        style: TextStyle(fontSize: 24, color: Colors.red[800]),
      ));
    else if(questionIndex!=0)
      builder.add(Text(
        "Correct",
        style: TextStyle(fontSize: 24, color: Colors.green[400]),
      ));
    return builder;
  }
}
