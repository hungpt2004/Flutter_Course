import 'package:flutter/material.dart';
import 'package:travel_app_ui/home/home_screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: SafeArea(child: MyHomeScreen()),
    );
  }
}