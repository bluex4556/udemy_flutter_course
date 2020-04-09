import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {

  final categoryText;

  CategoryWidget(this.categoryText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.deepPurpleAccent,
        child: Center(child: Text(categoryText)),
      ),
    );
  }
}
