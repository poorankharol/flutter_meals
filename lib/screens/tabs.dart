import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';

const kInitialFilters = {
  Filter.lactose: false,
  Filter.gluten: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favouriteMeals = [];

  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _toggleMealFavouriteStatus(Meal meal) {
    final isExits = _favouriteMeals.contains(meal);
    if (isExits) {
      setState(() {
        _favouriteMeals.remove(meal);
      });
      _showInfoMessage('Meal is no longer a favourite');
    } else {
      setState(() {
        _favouriteMeals.add(meal);
      });
      _showInfoMessage('Marked as favourite');
    }
  }

  void _setScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == "filters") {
      var result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FilterScreen(currentFilters: _selectedFilters,),
        ),
      );

      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.gluten]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactose]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      onToggleFavourite: _toggleMealFavouriteStatus,
      availableMeals: availableMeals,
    );

    var activePageTitle = "Categories";

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
          meals: _favouriteMeals,
          onToggleFavourite: _toggleMealFavouriteStatus);
      activePageTitle = "Your Favorites";
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(activePageTitle),
        ),
        body: activePage,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.set_meal),
              label: 'Categories',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
              backgroundColor: Colors.blue,
            ),
          ],
          currentIndex: _selectedPageIndex,
        ),
        drawer: MainDrawer(
          onSelectScreen: _setScreen,
        ));
  }
}
