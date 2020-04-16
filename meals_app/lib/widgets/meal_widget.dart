import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Meal.dart';

class MealWidget extends StatelessWidget {
  final Meal meal;

  selectedMeal() {}

  const MealWidget(this.meal);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectedMeal(),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    meal.imageUrl,
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  child: Container(
                    width: 300,
                    padding: const EdgeInsets.all(5),
                    color: Colors.black54,
                    child: Text(
                      meal.title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  bottom: 10,
                  left: 10,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  MealDescriptors(icon: Icons.access_time, text: "${meal.duration} mins"),
                  MealDescriptors(icon: Icons.settings,text:meal.getComplexityText()),
                  MealDescriptors(icon: Icons.attach_money,text: meal.getAffordabilityText()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MealDescriptors extends StatelessWidget {

  final IconData icon;
  final String text;

  const MealDescriptors({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(icon),
        SizedBox(width: 4,),
        Text(text)
      ],
    );
  }
}
