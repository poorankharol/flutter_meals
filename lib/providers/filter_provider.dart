import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';

enum Filter { gluten, lactose, vegetarian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.lactose: false,
          Filter.gluten: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }
}

var filterProvider = StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
    (ref) => FiltersNotifier());

final filteredMealProvider = Provider((ref) {
  var meals = ref.watch(mealsProvider);
  var selectedFilters = ref.watch(filterProvider);
  return meals.where((meal) {
    if (selectedFilters[Filter.gluten]! && !meal.isGlutenFree) {
      return false;
    }
    if (selectedFilters[Filter.lactose]! && !meal.isLactoseFree) {
      return false;
    }
    if (selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (selectedFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
