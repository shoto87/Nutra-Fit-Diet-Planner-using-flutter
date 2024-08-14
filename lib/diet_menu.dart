import 'package:flutter/material.dart';
import 'menu.dart';

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
      home: DailyMenuScreen(),
    );
  }
}
