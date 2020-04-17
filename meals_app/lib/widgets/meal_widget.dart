import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/screens/meal_deatail_screen.dart';
import 'package:mealsapp/widgets/meal_card_widget.dart';

import '../models/Meal.dart';

class MealWidget extends StatelessWidget {
  final Meal meal;

  selectedMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName,
    arguments: meal);
  }

  const MealWidget(this.meal);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectedMeal(context),
      child: MealCardWidget(meal),
    );
  }
}

