import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_api/screens/login_register_screen.dart';
import 'package:flutter_login_api/screens/start_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(child: StartScreen()),
    );
  }
}

void main(){
  runApp(MyApp());
}
