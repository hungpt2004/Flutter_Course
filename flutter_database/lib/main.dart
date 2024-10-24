import 'package:flutter/material.dart';

import 'database_test_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Database Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DatabaseTestPage(),
    );
  }
}
