import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';

import '../screens/favorites_screen.dart';
import '../screens/tabs_screen.dart';
import '../screens/meal_details_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/category_meals_screen.dart';
import '../screens/filters_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoritesMeals = [];
  void _toggleFavorites(String mealId) {
    final existingIndex =
        _favoritesMeals.indexWhere((element) => element.id == mealId);
    setState(() {
      if (existingIndex != -1) {
        _favoritesMeals.removeWhere((element) => element.id == mealId);
      } else {
        _favoritesMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      }
    });
  }

  bool _isFavoriteMeal(String id) {
    return _favoritesMeals.any((element) => element.id == id);
  }

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] as bool && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] as bool && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] as bool && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] as bool && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YahyaMeals',

      theme: ThemeData(
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
        canvasColor: Color.fromARGB(255, 238, 232, 183),
        fontFamily: 'Raleway',
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Color.fromARGB(20, 51, 51, 1),
          ),
          bodyText2: TextStyle(
            color: Color.fromARGB(19, 0, 0, 0),
          ),
          headline6: TextStyle(
            fontSize: 24,
            fontFamily: 'RobotoCondensed',
            // fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // home: CategoriesScreen(),
      routes: {
        '/': (context) => TabsScreen(_favoritesMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_toggleFavorites, _isFavoriteMeal),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_setFilters, _filters),
        FavoritesScreen.routeName: (context) =>
            FavoritesScreen(_favoritesMeals),
      },
      onUnknownRoute: (settins) {
        return MaterialPageRoute(
            builder: (context) => CategoryMealsScreen(_availableMeals));
      },

      //  const MyHomePage(title: 'YahyaMeals'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('Naviation Time!'),
      ),
    );
  }
}
