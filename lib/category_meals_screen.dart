import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  late String title;
  CategoryMealsScreen({Key? key, this.title = "This is the title"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
