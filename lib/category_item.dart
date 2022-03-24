import 'package:flutter/material.dart';
import 'package:meals_app/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem(
      {Key? key, required this.id, required this.title, required this.color})
      : super(key: key);
  void _selectCategory(ctx, title) {
    Navigator.pushNamed(ctx, CategoryMealsScreen.routeName,
        arguments: {'id': id, 'title': title as String});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      
      onTap: () => _selectCategory(context, title),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
