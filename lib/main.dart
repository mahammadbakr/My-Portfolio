import 'package:flutter/material.dart';

import 'Constants.dart';
import 'UI/Screens/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mohammed Bakr',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: AppColors.mainColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}
