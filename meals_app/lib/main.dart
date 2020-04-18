import 'package:flutter/material.dart';
import 'package:mealsapp/screens/category_meals_screen.dart';
import 'package:mealsapp/screens/meal_deatail_screen.dart';
import 'package:mealsapp/screens/settings_screen.dart';
import 'package:mealsapp/screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.blueAccent,
        canvasColor: Colors.white30,
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(color: Colors.black, fontSize: 18),
          body2: TextStyle(color: Colors.black, fontSize: 20),
        )
      ),
      home: TabsScreen(),
      routes: {
        CategoryMealsScreen.routeName: (_)=>CategoryMealsScreen(),
        MealDetailScreen.routeName: (_)=>MealDetailScreen(),
        SettingsPage.routeName: (_)=>SettingsPage(),
      },
    );
  }
}
