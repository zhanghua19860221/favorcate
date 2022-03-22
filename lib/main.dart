import 'package:favorcate/core/router/router.dart';
import 'package:favorcate/core/viewmodel/meal_view_model.dart';
import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:favorcate/core/viewmodel/filter_view_model.dart';
import 'package:favorcate/ui/shared/app_theme.dart';
import 'package:favorcate/ui/shared/size_fit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx)=> HYFilterViewModel()),
        ChangeNotifierProxyProvider<HYFilterViewModel,HYMealViewModel>(
          create: (ctx) => HYMealViewModel(),
          update: (ctx, filterVM, mealVM) {
            mealVM.updateFilters(filterVM);
            return mealVM;
          },
        ),
        ChangeNotifierProxyProvider<HYFilterViewModel, HYFavorViewModel>(
          create: (ctx) => HYFavorViewModel(),
          update: (ctx, filterVM, favorVM) {
            favorVM.updateFilters(filterVM);
            return favorVM;
          },
        ),
      ],
      child: MyApp(),
    )
  );
}

// providers:[
// ChangeNotifierProvider(create: (ctx) => HYMealViewModel()),
// ChangeNotifierProvider(create: (ctx) => HYFavorViewModel()),
// ],
// child: MyApp()

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //初始化屏幕适配类
    HYSizeFit.initialize();
    return MaterialApp(
      //移除右上角debug标签
      debugShowCheckedModeBanner: false,
      title: "美食广场",
      theme: HYAppTheme.norTheme,
      //暗黑模式下的Theme
      darkTheme: HYAppTheme.darkTheme,
      //设置路由
      routes: HYRouter.routes,
      //设置主页 (替代 home)
      initialRoute: HYRouter.initialRoute,
      //错误/未知路由跳转页面设置
      onUnknownRoute: HYRouter.unknownRoute,
      //可以传参的，相比于命名路由，可以多做一些相关的拦截
      onGenerateRoute: HYRouter.generateRoute,
    );
  }
}
