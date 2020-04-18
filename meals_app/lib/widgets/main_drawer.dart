import 'package:flutter/material.dart';
import 'package:mealsapp/screens/settings_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildDrawerTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: 150,
            color: Colors.blueGrey,
            alignment: Alignment.centerLeft,
            child: Text(
              "Happy Meals",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          buildDrawerTile("Meals", Icons.category, () {
            Navigator.of(context).pushReplacementNamed("/");
          }),
          buildDrawerTile("Settings", Icons.settings, (){
            Navigator.of(context).pushReplacementNamed(SettingsPage.routeName);
          }),
        ],
      ),
    );
  }
}
