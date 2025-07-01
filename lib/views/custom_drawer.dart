import 'package:flutter/material.dart';
import 'package:meals_app/views/main_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.onSetView});

  final void Function(AppView view) onSetView;

  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  theme.primaryContainer,
                  theme.primaryContainer.withValues(alpha: 0.7),
                ],
              ),
            ),
            padding: EdgeInsets.all(35),
            child: Row(
              children: [
                Icon(Icons.fastfood, size: 48, color: theme.primary),
                SizedBox(width: 20),
                Text(
                  'Cooking up!',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(color: theme.primary),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant, size: 28, color: theme.primary),
            title: Text(
              'Categories',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: theme.primary,
                fontSize: 20,
              ),
            ),
            onTap: () => onSetView(AppView.categories),
          ),
          ListTile(
            leading: Icon(Icons.favorite, size: 28, color: theme.primary),
            title: Text(
              'Favorites',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: theme.primary,
                fontSize: 20,
              ),
            ),
            onTap: () => onSetView(AppView.favorites),
          ),
          ListTile(
            leading: Icon(Icons.settings, size: 28, color: theme.primary),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: theme.primary,
                fontSize: 20,
              ),
            ),
            onTap: () => onSetView(AppView.filters),
          ),
        ],
      ),
    );
  }
}
