import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/main_drawer.dart';

class SettingsPage extends StatelessWidget {

  static const routeName = "/settings";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings"),),
      drawer: MainDrawer(),
      body: Container(
        child: Text("Settings"),
      ),
    );
  }
}
