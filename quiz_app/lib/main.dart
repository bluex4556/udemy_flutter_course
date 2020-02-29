import 'package:flutter/material.dart';

import './quiz.dart';
import 'complete.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;
  var proceed = true;
  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        "question": "Question 1",
        "answers": [
          {"text":"correct" , "correct" : true},
          {"text":"incorrect" , "correct" : false},
        ]
      },
      {
        "question": "Question 2",
        "answers": [
          {"text":"true" , "correct" : true},
          {"text":"false" , "correct" : false},
        ]
      },
    ];

    void correctAnswer() {
      setState(() {
        proceed = true;
        questionIndex += 1;
      });
    }

    void wrongAnswer() {
      setState(() {
        proceed = false;
      });
    }

    void restartQuiz(){
      setState(() {
        questionIndex = 0;
      });
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          title: Center(child: Text('Quiz App')),
          backgroundColor: Colors.red,
        ),
        body: questionIndex < questions.length
            ? Quiz(
                correctAnswerHandler: correctAnswer,
                incorrectAnswerHandler: wrongAnswer,
                questionIndex: questionIndex,
                questions: questions,
                proceed: proceed,
              )
            : CompleteQuiz(restartQuiz),
      ),
    );
  }
}
