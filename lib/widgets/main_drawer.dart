import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  Widget buildListTile({IconData icon, String title, Function tapHandler}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).canvasColor,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            color: Theme.of(context).colorScheme.secondary,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(15),
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile(
              icon: Icons.restaurant,
              title: 'Meals',
              tapHandler: () {
                return Navigator.pushReplacementNamed(context, '/');
              }),
          buildListTile(
              icon: Icons.settings,
              title: 'Filters',
              tapHandler: () {
                return Navigator.pushReplacementNamed(
                    context, FiltersScreen.routeName);
              }),
        ],
      ),
    );
  }
}
