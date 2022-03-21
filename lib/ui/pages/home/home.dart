import 'package:flutter/material.dart';

import 'home_content.dart';
import 'home_drawer.dart';
import 'home_app_bar.dart';

class HYHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HYHomeAppBar(context),
      body: HYHomeContent(),
      drawer: HYHomeDrawer(),
    );
  }
}
