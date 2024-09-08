import 'package:flutter/material.dart';

import 'package:fdtcg_multi_screen_navigating_meals_app/models/meal.dart';

class MealsScreen extends StatelessWidget {
  MealsScreen({
    super.key,
    required this.tile,
    required this.meals,
  });

  final String tile;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tile),
      ),
      body: Text('data'),
    );
  }
}
