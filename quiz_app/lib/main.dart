import 'package:flutter/material.dart';

import './question_text.dart';
import './answer_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
    @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    var questions = ["Question 1", "Question 2"];

    void correctAnswer(){
      setState(() {
        if(questionIndex<1)
          questionIndex +=1;
      });
    }

    void wrongAnswer(){
      print("wrong");
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('Hello'),
          backgroundColor: Colors.red,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: QuestionText(questions[questionIndex])),
            RaisedButton(
              child: AnswerText('Answer 1'),
              onPressed: correctAnswer,
            ),
            RaisedButton(
              child: AnswerText('Answer 2'),
              onPressed: wrongAnswer,
            ),
            RaisedButton(
              child: AnswerText('Answer 3'),
              onPressed: wrongAnswer,
            ),
          ],
        ),
      ),
    );
  }
}
