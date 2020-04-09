import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/category_widget.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: <Widget>[
          CategoryWidget("test"),
          CategoryWidget("test"),
          CategoryWidget("test"),
          CategoryWidget("test"),
        ],
      ),
    );
  }
}
