import 'package:favorcate/core/router/router.dart';
import 'package:favorcate/ui/shared/app_theme.dart';
import 'package:favorcate/ui/shared/size_fit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:favorcate/core/viewmodel/providers_view_model.dart';

main(){
  runApp(
    MultiProvider(
      providers: providers,
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
      //设置命名路由
      routes: HYRouter.routes,
      //钩子函数 可传参路由，相比于命名路由，可以多做一些相关的拦截 （当路由无法在routes 中查找到后 ，就会在onGenerateRoute 查找路由是否存在）
      onGenerateRoute: HYRouter.generateRoute,
      //设置主页 (替代 home)
      initialRoute: HYRouter.initialRoute,
      //错误/未知路由跳转页面设置
      onUnknownRoute: HYRouter.unknownRoute,

    );
  }
}
