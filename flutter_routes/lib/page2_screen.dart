import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page2Screen extends StatefulWidget {
  const Page2Screen({super.key});

  @override
  State<Page2Screen> createState() => _Page1ScreenState();
}

class _Page1ScreenState extends State<Page2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.pushNamed(context, '/home');
        }, child: Text("Go to home")),
      ),
    );
  }
}
