import 'package:flutter/material.dart';

import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

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
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavoritesScreen(),
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
