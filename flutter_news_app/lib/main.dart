import 'package:flutter/material.dart';
import 'package:flutter_news_app/screen/home_screen.dart';
import 'package:flutter_news_app/screen/news_category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(child: Scaffold(appBar: AppBar(title: const Center(child: Text("Flutter News App", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),)),backgroundColor: Colors.white,),body: HomeScreen(),)), // Đặt ArticleScreen làm màn hình chính
    );
  }
}
