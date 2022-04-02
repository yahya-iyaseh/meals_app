import 'package:flutter/material.dart';

import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favoirteMeals;
   TabsScreen(this.favoirteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List title = ['Categoreis', 'Favorites'];
  int i = 0;
  void _changeAppBarTitle(int index) {
    setState(() {
      i = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // For Bottom Bar
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title[i]),
        ),
        drawer: MainDrawer(),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavoritesScreen(widget.favoirteMeals),
          ],
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).primaryColor,
          child: TabBar(
            onTap: _changeAppBarTitle,
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categoreis',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favorites',
              ),
            ],
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5),
          ),
        ),
      ),
    );
    // For Top Bar
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('YahyaMeals'),
    //       bottom: TabBar(
    //         tabs: [
    //           Tab(
    //               icon: Icon(
    //                 Icons.category,
    //               ),
    //               text: 'Categories'),
    //           Tab(
    //               icon: Icon(
    //                 Icons.favorite,
    //               ),
    //               text: 'Favorites'),
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(
    //       children: [
    //         CategoriesScreen(),
    //         FavoritesScreen(),
    //       ],
    //     ),
    //   ),
    // );
  }
}
