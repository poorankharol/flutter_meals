import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filter_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var textTheme = Theme.of(context).textTheme;
    final currentFilter = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: currentFilter[Filter.gluten]!,
            onChanged: (isChecked) {
              ref.read(filterProvider.notifier).setFilter(Filter.gluten, isChecked);
            },
            title: Text(
              "Gluten-free",
              style: textTheme.titleLarge!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Only include gluten-free meals",
              style: textTheme.titleSmall!.copyWith(color: Colors.black),
            ),
            activeColor: Colors.blue,
            inactiveThumbColor: Colors.black,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: currentFilter[Filter.lactose]!,
            onChanged: (isChecked) {
              ref.read(filterProvider.notifier).setFilter(Filter.lactose, isChecked);
            },
            title: Text(
              "Lactose-free",
              style: textTheme.titleLarge!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Only include lactose-free meals",
              style: textTheme.titleSmall!.copyWith(color: Colors.black),
            ),
            activeColor: Colors.blue,
            inactiveThumbColor: Colors.black,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: currentFilter[Filter.vegetarian]!,
            onChanged: (isChecked) {
              ref.read(filterProvider.notifier).setFilter(Filter.vegetarian, isChecked);
            },
            title: Text(
              "Vegetarian-free",
              style: textTheme.titleLarge!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Only include vegetarian meals",
              style: textTheme.titleSmall!.copyWith(color: Colors.black),
            ),
            activeColor: Colors.blue,
            inactiveThumbColor: Colors.black,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: currentFilter[Filter.vegan]!,
            onChanged: (isChecked) {
              ref.read(filterProvider.notifier).setFilter(Filter.vegan, isChecked);
            },
            title: Text(
              "Vegan-free",
              style: textTheme.titleLarge!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Only include vegan meals",
              style: textTheme.titleSmall!.copyWith(color: Colors.black),
            ),
            activeColor: Colors.blue,
            inactiveThumbColor: Colors.black,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          )
        ],
      ),
    );
  }
}
