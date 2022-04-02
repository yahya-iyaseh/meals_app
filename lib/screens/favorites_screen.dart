import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../screens/meal_details_screen.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);
  static const routeName = '/favorites';
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.length == 0) {
      return Center(
        child: Text(
          'You have no favorites yet - start adding some!',
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (ctx, index) {
            return Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              child: MealItem(
                id: favoriteMeals[index].id,
                title: favoriteMeals[index].title,
                imageUrl: favoriteMeals[index].imageUrl,
                duration: favoriteMeals[index].duration,
                complexity: favoriteMeals[index].complexity,
                affordability: favoriteMeals[index].affordability,
                removeItem: () {},
              ),
            );
          },
          itemCount: favoriteMeals.length);
    }
  }
}
