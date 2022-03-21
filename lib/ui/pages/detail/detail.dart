import 'package:favorcate/core/model/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/ui/pages/detail/detail_content.dart';

class HYDetailScreen extends StatelessWidget {
  static const String routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as HYMealModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),

      body: HYDetailContent(meal),
      // floatingActionButton: HYDetailFloatingButton(meal),

    );
  }


}
