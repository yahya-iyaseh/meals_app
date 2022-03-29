import 'package:flutter/material.dart';

import '../screens/meal_details_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;
  const MealItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.removeItem,
  }) : super(key: key);
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      default:
        return "Unkown";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      default:
        return "Unkown";
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.pushNamed(context, MealDetailScreen.routeName, arguments: id)
        .then((value) => {
              if (value != null) {removeItem(value)}
            });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    width: 260,
                    height: 40,
                    padding: EdgeInsets.all(10),
                    color: Color.fromARGB(136, 0, 0, 1),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(children: [
                    Icon(
                      Icons.schedule,
                      size: 20,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      '$duration min',
                      style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontSize: 18,
                      ),
                    )
                  ]),
                  Row(children: [
                    Icon(
                      Icons.work,
                      size: 20,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      '$complexityText',
                      style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontSize: 18,
                      ),
                    )
                  ]),
                  Row(children: [
                    Icon(
                      Icons.attach_money,
                      size: 20,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      '$affordabilityText',
                      style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontSize: 18,
                      ),
                    )
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
