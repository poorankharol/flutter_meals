import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.meal, required this.onToggleFavourite});

  final Meal meal;

  final void Function(Meal meal) onToggleFavourite;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.star_border),
            onPressed: () {
              onToggleFavourite(meal);
            },
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: NetworkImage(meal.imageUrl),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              "Ingredients",
              style: textTheme.titleMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 24),
            ),
            const SizedBox(
              height: 10,
            ),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: textTheme.titleSmall
                    ?.copyWith(fontSize: 16, color: Colors.black),
              ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Steps",
              style: textTheme.titleMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 24),
            ),
            const SizedBox(
              height: 10,
            ),
            for (var i = 0; i < meal.steps.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Text(
                  "${i + 1}. ${meal.steps[i]}",
                  textAlign: TextAlign.center,
                  style: textTheme.titleSmall
                      ?.copyWith(fontSize: 16, color: Colors.black),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
