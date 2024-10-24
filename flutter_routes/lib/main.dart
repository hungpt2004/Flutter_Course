import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_routes_demo/page1_screen.dart';
import 'package:flutter_routes_demo/page2_screen.dart';
import 'home_screen.dart';

void main(){
  FluroRouter();
  runApp(MyApp());
}

//USE ROUTES

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       routes: {
//         '/home':(context)=>HomeScreen(),
//         '/page1':(context)=>Page1Screen(),
//         '/page2':(context)=>Page2Screen()
//       },
//       initialRoute: '/home',
//     );
//   }
// }


//USER FLURO
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

    );
  }
}
