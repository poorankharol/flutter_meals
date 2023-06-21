import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsList extends StatelessWidget {
  const MealsList({super.key, required this.mealList, required this.onToggleFavourite});

  final List<Meal> mealList;
  final void Function(Meal meal) onToggleFavourite;

  void _selectMeal(BuildContext context,Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailScreen(
          meal: meal, onToggleFavourite:  onToggleFavourite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mealList.length,
      itemBuilder: (ctx, index) => MealItem(
        meal: mealList[index],
        onSelectMeal: (Meal meal) {
          _selectMeal(context,meal);
        },
      ),
    );
  }
}
