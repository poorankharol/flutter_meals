import 'package:flutter/material.dart';

enum Filter { gluten, lactose, vegetarian, vegan }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilters});

  final Map<Filter,bool> currentFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFreeFilterSet = false;
  var _veganFreeFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.gluten]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactose]!;
    _vegetarianFreeFilterSet = widget.currentFilters[Filter.vegetarian]!;
    _veganFreeFilterSet = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (String identifier) {
      //     Navigator.pop(context);
      //     if (identifier == "meals") {
      //       Navigator.pushReplacement(context,
      //           MaterialPageRoute(builder: (ctx) => const TabsScreen()));
      //     }
      //   },
      // ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.gluten: _glutenFreeFilterSet,
            Filter.lactose: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFreeFilterSet,
            Filter.vegan: _veganFreeFilterSet,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
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
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
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
              value: _vegetarianFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFreeFilterSet = isChecked;
                });
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
              value: _veganFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFreeFilterSet = isChecked;
                });
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
      ),
    );
  }
}
