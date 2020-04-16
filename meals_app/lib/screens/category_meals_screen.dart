import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/meal_widget.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = "/categories-meals";

  @override
  Widget build(BuildContext context) {
    final Map routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String categoryText = routeArgs['category'];
    final String categoryId = routeArgs['id'];

    final filteredMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryText),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealWidget(filteredMeals[index]);
        },
        itemCount: filteredMeals.length,
      ),
    );
  }
}
