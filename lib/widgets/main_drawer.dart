import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier ) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Colors.white,
                ),
                const SizedBox(width: 18,),
                Text(
                  "Cooking Up!",
                  style: textTheme.titleLarge!.copyWith(color: Colors.white),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.restaurant,
            ),
            title: Text('Meals',style: textTheme.titleLarge),
            onTap: () {
              onSelectScreen("meals");
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
            ),
            title: Text('Filters',style: textTheme.titleLarge),
            onTap: () {
              onSelectScreen("filters");
            },
          ),
        ],
      ),
    );
  }
}
