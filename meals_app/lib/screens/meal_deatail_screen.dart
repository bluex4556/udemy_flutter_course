import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/meal_card_widget.dart';
import '../models/Meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail-screen";

  Widget buildSectionHeader(String header) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        header,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildListContainer(BuildContext ctx, List list) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      height: MediaQuery.of(ctx).size.height * 0.20,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(child: Text("# ${index+1}"),),
                title: Text(list[index]),
              ),
              Divider(color: Colors.black54,),
            ],
          );
        },
        itemCount: list.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            MealCardWidget(meal),
            buildSectionHeader("Ingredients"),
            buildListContainer(context, meal.ingredients),
            buildSectionHeader("Steps"),
            buildListContainer(context, meal.steps),
          ],
        ),
      ),
    );
  }
}
