import 'package:course_training_ui/components/home/components/slider_page_route.dart';
import 'package:course_training_ui/components/home/course_title.dart';
import 'package:course_training_ui/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyHomeScreen extends StatefulWidget {
  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Bottom part with white background
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Learning is Everything",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(
                      height: 100,
                      width: 250,
                      child: Text(
                        "Learning with Pleasure with Dear Programmer, Wherever you are.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            SlidePageRoute(
                                page: const MyCourseHome(),
                                beginOffset: const Offset(0.0, -1.0), // Trượt từ trên
                                endOffset: Offset.zero,
                                duration: Duration(milliseconds: 1000)));
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fixedSize: const Size(200, 50),
                          backgroundColor: primaryColor),
                      child: const Text(
                        "Get Start",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Top part with purple background and rounded edge
          Align(
            alignment: Alignment.topCenter,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(60),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                color: primaryColor, // Replace with your desired color
                child: Center(
                  child: Image.asset(
                    'assets/images/books.png', // Replace with your image path
                    height: 250,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
