import 'package:flutter/material.dart';

import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/extension/int_extension.dart';

class HYDetailContent extends StatelessWidget{

  final  HYMealModel _meal;
  HYDetailContent(this._meal);

  @override
  Widget build(BuildContext context) {
    //SingleChildScrollView  可以解决列表高度 不确定问题
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          buildBannerImage(context),
          buildMakeTitle(context, "制作材料"),
          buildMakeMaterial(context),
          buildMakeTitle(context, "制作步骤"),
          buildMakeSteps(context)

        ],
      )
    );
  }
  // 1.横幅图片
  Widget buildBannerImage(BuildContext context){
    return Container(
      //double.infinity 可以避免 开始不能完全在页面展示 ，会有一个跳动问题
      width: double.infinity,
      child: Image.network(_meal.imageUrl),
    );
  }

  // 2.制作材料
  Widget buildMakeMaterial(BuildContext context){
    return buildMakeContent(
      context: context,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        //使ListView的高度依照内容的实际高度 展示
        shrinkWrap: true,
        //禁止ListView滚动
        physics: NeverScrollableScrollPhysics(),
        itemCount: _meal.ingredients.length,
        itemBuilder: (ctx,index){
          return Card(
            color: Theme.of(context).accentColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              child: Text(_meal.ingredients[index]),
            ),
          );
        },
      )
    );
  }

  // 3.制作步骤
  Widget buildMakeSteps(BuildContext context){
    return buildMakeContent(
      context: context,
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: _meal.steps.length,
        itemBuilder: (ctx,index){
          return ListTile(
            leading: CircleAvatar(
              child: Text("#${index+1}"),
            ),
            title: Text(_meal.steps[index]),
          );
        },
        separatorBuilder: (ctx,index){
          return Divider();
        },
      )
    );

  }

  // 公共方法
  Widget buildMakeTitle(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.px),
      child: Text(title, style: Theme.of(context).textTheme.display3.copyWith(fontWeight: FontWeight.bold),),
    );
  }


  //方法封装
  Widget buildMakeContent({BuildContext context,Widget child}){
    return Container(
      padding: EdgeInsets.all(8.px),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.px)
      ),
      width: MediaQuery.of(context).size.width - 30.px,
      child: child,
    );

  }

}
