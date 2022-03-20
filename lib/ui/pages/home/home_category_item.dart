import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/int_extension.dart';
import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/ui/pages/meal/meal.dart';

class HYHomeCategoryItem extends StatelessWidget {
  
  final HYCategoryModel _category;
  HYHomeCategoryItem(this._category);
  
  @override
  Widget build(BuildContext context) {
    final bgColor = _category.cColor;

    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: _category.cColor,
            borderRadius: BorderRadius.circular(12.px),
            //颜色渐变
            gradient: LinearGradient(
                colors: [
                  bgColor.withOpacity(.5),
                  bgColor
                ]
            )
        ),
        alignment: Alignment.center,
        child: Text(
          "${_category.title}",
          style: Theme.of(context).textTheme.display2.copyWith(
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      onTap: (){
        Navigator.of(context).pushNamed(HYMealScreen.routeName,arguments: _category);
      },
    );
  }
}