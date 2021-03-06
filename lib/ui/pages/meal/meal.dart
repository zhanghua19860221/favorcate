import 'package:flutter/material.dart';

import 'package:favorcate/core/model/category_model.dart';

import 'meal_content.dart';
class HYMealScreen  extends StatelessWidget {
  static const String routeName = "/meal";
  @override
  Widget build(BuildContext context) {
    // 获取参数
    final category = ModalRoute.of(context).settings.arguments as HYCategoryModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: HYMealContent(),
    );
  }

}
