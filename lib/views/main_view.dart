import 'package:flutter/material.dart';
import 'package:meals_app/views/categories_view.dart';
import 'package:meals_app/views/custom_drawer.dart';
import 'package:meals_app/views/favorites_view.dart';
import 'package:meals_app/views/filters_view.dart';

enum AppView { categories, favorites, filters }

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  AppView _selected = AppView.categories;

  Widget get _selectedView {
    switch (_selected) {
      case AppView.categories:
        return const CategoriesView();
      case AppView.favorites:
        return const FavoritesView();
      case AppView.filters:
        return const FiltersView();
    }
  }

  String get _title {
    switch (_selected) {
      case AppView.categories:
        return 'Categories';
      case AppView.favorites:
        return 'Favorites';
      case AppView.filters:
        return 'Filters';
    }
  }

  void _setView(AppView view) {
    setState(() {
      _selected = view;
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title)),
      body: _selectedView,
      drawer: CustomDrawer(onSetView: _setView),
    );
  }
}
