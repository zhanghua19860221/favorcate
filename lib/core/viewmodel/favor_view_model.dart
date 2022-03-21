import 'package:favorcate/core/model/meal_model.dart';
import 'package:flutter/material.dart';

class HYFavorViewModel extends ChangeNotifier {
  List<HYMealModel> _favorMeals = [];

  List<HYMealModel> get favorMeals {
    return _favorMeals;
  }

  void addMeal(HYMealModel meal) {
    _favorMeals.add(meal);
    notifyListeners();
  }

  void removeMeal(HYMealModel meal) {
    _favorMeals.remove(meal);
    notifyListeners();
  }

  void handleMeal(HYMealModel meal) {
    if (isFavor(meal)) {
      removeMeal(meal);
    } else {
      addMeal(meal);
    }
  }

  bool isFavor(HYMealModel meal) {
    return _favorMeals.contains(meal);
  }
}