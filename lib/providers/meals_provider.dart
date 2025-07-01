import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/meals.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/filters_provider.dart';

final filteredMealsProvider = Provider((ref) {
  final Map<Filter, bool> filters = ref.watch(filtersProvider);
  return meals.where((meal) {
    if (filters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (filters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (filters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (filters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});

final filteredMealsByCategoryProvider = Provider.family<List<Meal>, Category>((
  ref,
  category,
) {
  final List<Meal> filteredMeals = ref.watch(filteredMealsProvider);
  return filteredMeals
      .where((meal) => meal.categories.contains(category.id))
      .toList();
});
