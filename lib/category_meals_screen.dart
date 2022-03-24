import 'package:flutter/material.dart';
import './dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  CategoryMealsScreen({Key? key}) : super(key: key);
  static String routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    String title = args['title'] as String;
    String id = args['id'] as String;
    final categoryMeals = DUMMY_MEALS.where((item) {
      return item.categories.contains(id);
    }).toList();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (ctx, index) {
            return Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              child: Text(
                categoryMeals[index].title as String,
                style: TextStyle(color: Colors.white, fontSize: 34),
              ),
            );
          },
          itemCount: categoryMeals.length),
    );
  }
}
