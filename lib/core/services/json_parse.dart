//json.decode
import 'dart:convert';
//rootBundle
import 'package:flutter/services.dart';
import 'package:favorcate/core/model/category_model.dart';

class HYJsonParse{
  static Future <List<HYCategoryModel>> getCategoryData() async{
    //1、加载json 文件
    final jsonString = await rootBundle.loadString("assets/json/category.json");
    //2、将json转换为Map/List
    final result =  json.decode(jsonString);
    // 3.将Map中的内容转成一个个对象
    final resultList = result["category"];

    List<HYCategoryModel> categories = [];
    for (var json in resultList) {
      categories.add(HYCategoryModel.fromJson(json));
    }

    return categories;
  }

}