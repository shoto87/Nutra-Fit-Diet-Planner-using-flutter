// this is a dashboard of main app screen

import 'package:flutter/material.dart';
import 'healthy-diet_screen.dart';
import 'form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'nutrafit',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HealthyDietScreen(),
    );
  }
}
