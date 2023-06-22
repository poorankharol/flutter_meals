import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/favourites_provider.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteMeals = ref.watch(favouriteMealProvider);
    final isFavourite = favouriteMeals.contains(meal);

    var textTheme = Theme.of(context).textTheme;
    void showInfoMessage(String message) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              var isAdded = ref
                  .read(favouriteMealProvider.notifier)
                  .toggleFavouriteStatus(meal);
              showInfoMessage(
                  isAdded ? "Meal added as favourite " : "Meal Removed");
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween(end: 0.5,begin: 1.0).animate(animation),
                  child: child,
                );
              },
              child: Icon(
                isFavourite ? Icons.star : Icons.star_border,
                key: ValueKey(isFavourite),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image(
                image: NetworkImage(meal.imageUrl),
              ),
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
