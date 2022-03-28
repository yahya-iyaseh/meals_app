import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../screens/favorites_screen.dart';
import '../screens/category_meals_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);
  Widget buildListTile(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      onTap: tapHandler,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 140,
            width: double.infinity,
            padding: EdgeInsets.only(
              top: 20,
              right: 20,
              left: 20,
              bottom: 40,
            ),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          Divider(),
          buildListTile(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          // Divider(),
          // buildListTile('Favorites', Icons.favorite_rounded, () {
          //   Navigator.of(context).pushNamed(FavoritesScreen.routeName);
          // }),
          Divider(),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
