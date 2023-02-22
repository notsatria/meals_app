import 'package:flutter/material.dart';

import '../widgets/meals_item.dart';
import '../models/meals.dart';

class MealsCategoryScreen extends StatefulWidget {
  // final String idCategory;
  // final String titleCategory;

  static const routeName = '/meals-category';

  final List<Meals> availableMeals;


  const MealsCategoryScreen({Key key, this.availableMeals}) : super(key: key);

  @override
  State<MealsCategoryScreen> createState() => _MealsCategoryScreenState();
}

class _MealsCategoryScreenState extends State<MealsCategoryScreen> {
  String categoryTitle;
  List<Meals> displayedMeal;

  @override
  void initState() {
    //
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final argsRoute =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = argsRoute['title'];
    final categoryId = argsRoute['id'];
    displayedMeal = widget.availableMeals
        .where(
          (item) => item.categoryIds.contains(categoryId),
        )
        .toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      // displayedMeal.removeWhere((item) => item.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealsItem(
              id: displayedMeal[index].id,
              title: displayedMeal[index].title,
              imageUrl: displayedMeal[index].imageUrl,
              duration: displayedMeal[index].duration,
              affordability: displayedMeal[index].affordability,
              complexity: displayedMeal[index].complexity,

            );
          },
          itemCount: displayedMeal.length,
        ));
  }
}
