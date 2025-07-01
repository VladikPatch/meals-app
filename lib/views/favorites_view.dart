import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorite_meals_provider.dart';
import 'package:meals_app/views/meal_detailes_view.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoritesView extends ConsumerWidget {
  const FavoritesView({super.key});

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MealsDetailesView(meal: meal)),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'No meals here...',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 15),
          Text(
            'Try another category',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );

    List<Meal> favoriteMeals = ref.watch(favoriteMealsProvider);

    if (favoriteMeals.isNotEmpty) {
      content = ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (context, index) {
          return MealItem(
            meal: favoriteMeals[index],
            onSelectMeal: (meal) => _selectMeal(context, meal),
          );
        },
      );
    }

    return Scaffold(body: content);
  }
}
