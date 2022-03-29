import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/Meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  CategoryMealsScreen({Key? key}) : super(key: key);
  static String routeName = '/category-meals';

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List displaydMeals;
  var isInit = false;
  void _removeMeal(String mealId) {
    setState(() {
      displaydMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!isInit) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;

      categoryTitle = args['title'] as String;

      String id = args['id'] as String;

      displaydMeals = DUMMY_MEALS.where((item) {
        return item.categories.contains(id);
      }).toList();
    }
    isInit = true;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (ctx, index) {
            return Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              child: MealItem(
                id: displaydMeals[index].id,
                title: displaydMeals[index].title,
                imageUrl: displaydMeals[index].imageUrl,
                duration: displaydMeals[index].duration,
                complexity: displaydMeals[index].complexity,
                affordability: displaydMeals[index].affordability,
                removeItem: _removeMeal,
              ),
            );
          },
          itemCount: displaydMeals.length),
    );
  }
}
