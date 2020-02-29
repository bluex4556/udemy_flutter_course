import 'package:flutter/material.dart';

class CompleteQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "You did it",
          style: TextStyle(
            fontSize: 48,
          ),
        ),
      ),
    );
  }
}
