import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    Widget _buildListTile(IconData icon, String text, Function tapHandler) {
      return ListTile(
          onTap: tapHandler,
          leading: Icon(icon, size: 30, color: Theme.of(context).accentColor),
          title: Text(text,
              style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 24,
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold)));
    }

    return Drawer(
        child: Column(
      children: [
        Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.all(20),
            height: size.height * 0.20,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Text('FOODIE',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w900))),
        SizedBox(height: 20),
        _buildListTile(Icons.restaurant, 'Meals', () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        _buildListTile(Icons.settings, 'Filters', () {
          Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
        }),
      ],
    ));
  }
}
