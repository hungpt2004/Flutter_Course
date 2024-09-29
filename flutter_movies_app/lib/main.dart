import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies_app/screen/home_screen.dart';
import 'package:flutter_movies_app/screen/widget/header_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Movie App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: HeaderWidget(),
            ),
        body: HomeScreen(),
      )),
    );
  }
}

void main() {
  runApp(MyApp());
}
