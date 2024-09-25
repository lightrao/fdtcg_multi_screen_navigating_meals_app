import 'package:fdtcg_multi_screen_navigating_meals_app/models/meal.dart';
import 'package:flutter/material.dart';

import 'package:fdtcg_multi_screen_navigating_meals_app/data/dummy_data.dart';
import 'package:fdtcg_multi_screen_navigating_meals_app/widgets/category_grid_item.dart';
import 'package:fdtcg_multi_screen_navigating_meals_app/screens/meals.dart';
import 'package:fdtcg_multi_screen_navigating_meals_app/models/category.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
      lowerBound: 0,
      upperBound: 1,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();

    // Navigator.push(context, route);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          tile: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2, // width / height
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      // children: availableCategories
      //     .map(
      //       (category) => CategoryGridItem(category: category) as Widget,
      //     )
      //     .toList(),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          ),
      ],
    );
  }
}
