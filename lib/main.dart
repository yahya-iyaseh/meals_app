import 'package:flutter/material.dart';

import '../screens/tabs_screen.dart';
import '../screens/meal_details_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        canvasColor: Color.fromARGB(255, 255, 246, 166),
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
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // home: CategoriesScreen(),
      routes: {
        '/': (context) => TabsScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
      },
      onUnknownRoute: (settins) {
        return MaterialPageRoute(builder: (context) => CategoryMealsScreen());
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
