import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../widgets/meals_item.dart';

class FavoritesScreen extends StatefulWidget {
  List<Meals> favoriteMeal;

  FavoritesScreen({Key key, this.favoriteMeal}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeal.isEmpty) {
      return const Center(
        child: Text('You have no favorites yet! - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealsItem(
            id: widget.favoriteMeal[index].id,
            title: widget.favoriteMeal[index].title,
            imageUrl: widget.favoriteMeal[index].imageUrl,
            duration: widget.favoriteMeal[index].duration,
            affordability: widget.favoriteMeal[index].affordability,
            complexity: widget.favoriteMeal[index].complexity,
          );
        },
        itemCount: widget.favoriteMeal.length,
      );
    }
  }
}
