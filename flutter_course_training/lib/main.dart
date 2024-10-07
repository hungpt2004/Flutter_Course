import 'package:course_training_ui/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Split Color Screen',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomeScreen(),
    );
  }
}