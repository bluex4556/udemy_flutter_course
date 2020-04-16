import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final String categoryText = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text(categoryText),),
      body: Center(child: Text("Recepies")),
    );
  }
}
