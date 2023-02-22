import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../screens/meal_detail_screen.dart';

class MealsItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;

  const MealsItem({
    Key key,
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.complexity,
    @required this.affordability,
    @required this.duration,
  }) : super(key: key);

  String get complexityText {
    switch (complexity) {
      case (Complexity.Simple):
        return 'Simple';
        break;
      case (Complexity.Challenging):
        return 'Challenging';
        break;
      case (Complexity.Hard):
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case (Affordability.Affordable):
        return 'Affordable';
        break;
      case (Affordability.Pricey):
        return 'Pricey';
        break;
      case (Affordability.Luxurious):
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.pushNamed(
      context,
      MealDetailScreen.routeName,
      arguments: id,
    ).then(
      (result) {
        if (result != null) {
          // removeItem(result);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 5,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  color: Colors.black45,
                  width: 300,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.fade,
                    softWrap: true,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(Icons.schedule),
                    const SizedBox(width: 6),
                    Text('$duration min'),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.work),
                    const SizedBox(width: 6),
                    Text(complexityText),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.attach_money),
                    const SizedBox(width: 6),
                    Text(affordabilityText),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
