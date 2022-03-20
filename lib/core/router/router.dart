import 'package:flutter/material.dart';
import 'package:favorcate/ui/pages/main/main.dart';
import 'package:favorcate/ui/pages/meal/meal.dart';
import 'package:favorcate/ui/pages/detail/detail.dart';
class HYRouter {
  static final String initialRoute = HYMainScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    HYMainScreen.routeName: (ctx) => HYMainScreen(),
    HYMealScreen.routeName: (ctx) => HYMealScreen(),
    HYDetailScreen.routeName: (ctx) => HYDetailScreen()

  };

  // 自己扩展 可以传参的，相比于命名路由，可以多做一些相关的拦截
  static final RouteFactory generateRoute = (settings) {
    // String routeName = settings.name;
    // print("Open page: $routeName");
    // // Check permissions
    // switch (routeName) {
    //   case "/":
    //     return MaterialPageRoute(builder: (context) {
    //       return HomePage(title: "Home");
    //     });
    //   case "settings":
    //     return MaterialPageRoute(builder: (context) {
    //       return SettingsPage(settings.arguments);
    //     });
    //   default:
    //     return MaterialPageRoute(builder: (BuildContext context) {
    //       return Scaffold(
    //           body: Center(
    //             child: Text("Page not found"),
    //           ));
    //     });
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}