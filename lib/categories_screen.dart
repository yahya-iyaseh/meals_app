import 'package:flutter/material.dart';
import 'package:meals_app/category_item.dart';

import './dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YahyaMeals'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(15),
        children: [
          ...DUMMY_CATEGORIES.map((item) {
            return CategoryItem(title: item.title, color: item.color);
          })
        ],
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 3 / 2,
        ),
      ),
    );
  }
}
