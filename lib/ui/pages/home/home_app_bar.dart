import 'package:flutter/material.dart';

class HYHomeAppBar extends AppBar {
  HYHomeAppBar(BuildContext context) : super(
      title: Text("美食广场"),
      leading: Builder(
        builder: (ctx) {
          return IconButton(
            icon: Icon(Icons.build),
            onPressed: () {
              Scaffold.of(ctx).openDrawer();
            },
          );
        },
      ));
}
