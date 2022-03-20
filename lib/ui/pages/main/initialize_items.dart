import 'package:flutter/material.dart';
import '../home/home.dart';
import '../favor/favor.dart';

final List<Widget> pages = [
  HYHomeScreen(),
  HYFavorScreen()
];


final List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
      icon:Icon(Icons.home),
      title: Text("首页"))
  ,
  BottomNavigationBarItem(
      icon:Icon(Icons.star),
      title: Text("收藏")
  ),
];