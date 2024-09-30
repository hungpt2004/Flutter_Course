import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies_app/screen/popular_movies_screen.dart';
import 'package:flutter_movies_app/screen/upcoming_movies_screen.dart';
import 'package:flutter_movies_app/screen/widget/header_widget.dart';
import 'package:flutter_movies_app/screen/widget/movies_slide_widget.dart';
import 'package:flutter_movies_app/service/api_movies_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [

          //NOW SHOWING
          Padding(
            padding: EdgeInsets.only(left: 26, bottom: 10, top: 12),
            child: Text("Now Showing",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black)),
          ),
          SlideMovieWidget(),

          //UP COMING
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.only(left: 26, bottom: 10, top: 12),
            child: Text("Up Coming Movies",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
          ),
          UpcomingMovieScreen(),

          //POPULAR
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.only(left: 26, bottom: 10, top: 12),
            child: Text("Popular Movies", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
          ),
          PopularMovieScreen(),

          //BOTTOM
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
