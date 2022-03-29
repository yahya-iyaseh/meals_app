import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/meal-detail';

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildSectionContent(BuildContext context, Widget child) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      height: 200,
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(width: 1, color: Colors.grey),
        ),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context)?.settings.arguments as String;
    final mealDetails = DUMMY_MEALS.firstWhere((item) => item.id == mealId);

    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(mealDetails.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              margin: EdgeInsets.only(
                bottom: 20,
              ),
              child: Image.network(
                mealDetails.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildSectionContent(
              context,
              ListView.builder(
                itemCount: mealDetails.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      mealDetails.ingredients[index],
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildSectionContent(
              context,
              ListView.builder(
                itemCount: mealDetails.steps.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        horizontalTitleGap: 20,
                        leading: CircleAvatar(
                          child: Text('# ${(index + 1)}'),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            mealDetails.steps[index],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, mealId);
        },
        child: Icon(
          Icons.delete,
          color: Theme.of(context).errorColor,
        ),
      ),
    );
  }
}
