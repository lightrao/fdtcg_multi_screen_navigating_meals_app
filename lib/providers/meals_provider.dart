import 'package:fdtcg_multi_screen_navigating_meals_app/data/dummy_data.dart';
import 'package:fdtcg_multi_screen_navigating_meals_app/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealsProvider = Provider<List<Meal>>(
  (ref) {
    return dummyMeals;
  },
);
