import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/services/meal_request.dart';
import 'package:flutter/material.dart';

class HYMealViewModel extends ChangeNotifier {
  List<HYMealModel> _meals = [];

  List<HYMealModel> get meals {
    return _meals;
  }

  HYMealViewModel() {
    HYMealRequest.getMealData().then((res) {
      _meals = res;
      notifyListeners();
    });
  }
}