import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/widgets/filter_tile.dart';
// import 'dart:developer' show log;

class FiltersView extends ConsumerWidget {
  const FiltersView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<Filter, bool> filters = ref.watch(filtersProvider);
    return Scaffold(
      body: Column(
        children: [
          FilterTile(
            title: 'Gluten-free',
            subtitle: 'Show only gluten-free meals',
            activeValue: filters[Filter.glutenFree]!,
            onChanged: (value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, value);
            },
          ),
          FilterTile(
            title: 'Lactose-free',
            subtitle: 'Show only lactose-free meals',
            activeValue: filters[Filter.lactoseFree]!,
            onChanged: (value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, value);
            },
          ),
          FilterTile(
            title: 'Vegetarian',
            subtitle: 'Show only vegetarian meals',
            activeValue: filters[Filter.vegetarian]!,
            onChanged: (value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, value);
            },
          ),
          FilterTile(
            title: 'Vegan',
            subtitle: 'Show only vegan meals',
            activeValue: filters[Filter.vegan]!,
            onChanged: (value) {
              ref.read(filtersProvider.notifier).setFilter(Filter.vegan, value);
            },
          ),
        ],
      ),
    );
  }
}
