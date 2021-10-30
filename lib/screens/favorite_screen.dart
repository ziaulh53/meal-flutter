import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoutiteMeals;
  FavoritesScreen(this.favoutiteMeals);
  @override
  Widget build(BuildContext context) {
    print(favoutiteMeals);
    if (favoutiteMeals.isEmpty) {
      return Center(
        child: Text('This is favorite'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: favoutiteMeals[index].id,
              title: favoutiteMeals[index].title,
              imageUrl: favoutiteMeals[index].imageUrl,
              affordability: favoutiteMeals[index].affordability,
              complexity: favoutiteMeals[index].complexity,
              duration: favoutiteMeals[index].duration);
        },
        itemCount: favoutiteMeals.length,
      );
    }
  }
}
