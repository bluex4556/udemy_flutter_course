import 'package:flutter/material.dart';
import 'package:mealsapp/screens/category_meals_screen.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryId;
  final String categoryText;
  final Color categoryColor;

  CategoryWidget({this.categoryText, this.categoryColor, this.categoryId});

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName, arguments: {'id': categoryId,'category': categoryText}
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).accentColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            categoryColor.withOpacity(0.6),
            categoryColor,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
            child: Text(categoryText,
                style: Theme.of(context).textTheme.body2.copyWith(
                    fontWeight: FontWeight.w800, letterSpacing: 1.3))),
      ),
    );
  }
}
