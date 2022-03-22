import 'package:flutter/material.dart';
import 'favor_content.dart';

class HYFavorScreen extends StatelessWidget {
  static const String routeName = "/favor";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的收藏"),
      ),
      body: HYFavorContent(),
    );
  }
}
