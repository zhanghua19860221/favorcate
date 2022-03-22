import 'package:favorcate/core/model/meal_model.dart';
import 'package:flutter/material.dart';
import 'filter_view_model.dart';

class HYFavorViewModel extends ChangeNotifier {
  List<HYMealModel> _favorMeals = [];

  HYFilterViewModel _filterVM;

  void updateFilters(HYFilterViewModel filterVM) {
    _filterVM = filterVM;
  }

  List<HYMealModel> get favorMeals {
    return _favorMeals.where((meal) {
      print("${_filterVM.isGlutenFree}---${meal.isGlutenFree}");
      print("${_filterVM.isLactoseFree}---${meal.isLactoseFree}");
      print("${_filterVM.isVegetarian}---${meal.isVegetarian}");
      print("${_filterVM.isVegan}---${meal.isVegan}\n\n");
      if (_filterVM.isGlutenFree && meal.isGlutenFree) return false;
      if (_filterVM.isLactoseFree && meal.isLactoseFree) return false;
      if (_filterVM.isVegetarian && meal.isVegetarian) return false;
      if (_filterVM.isVegan && meal.isVegan) return false;
      return true;
    }).toList();
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