import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: SafeArea(child: Scaffold(appBar: AppBar(title: const Center(child: Text("Flutter Movies App", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),)),backgroundColor: Colors.white,),body: HomeScreen(),)),
    );
  }
}


void main() {
  runApp(MyApp());
}
