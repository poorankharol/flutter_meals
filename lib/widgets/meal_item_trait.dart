import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Row(children: [
      Icon(
        icon,
        size: 16,
        color: Colors.white,
      ),
      const SizedBox(
        width: 5,
      ),
      Text(
        title,
        style: textTheme.titleSmall,
      )
    ]);
  }
}
