import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_api/screens/login_register_screen.dart';
import 'package:flutter_login_api/widget/slide_page_route.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  bool _isHovering = false; // To track hover state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(0),
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/travel.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.1,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(80.0),
                    child: MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          _isHovering = true;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          _isHovering = false;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _isHovering ? Colors.black : Colors.white,
                          border: Border.all(color: Colors.black, width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextButton(
                          style: ButtonStyle(),
                          onPressed: () {
                            setState(() {
                              Navigator.push(context, SlidePageRoute(page: LoginSreen(), beginOffset: Offset(1.0,0.0), endOffset: Offset.zero, duration: Duration(milliseconds: 1000)));
                            });
                          },
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                              color: _isHovering ? Colors.white : Colors.black,
                              fontFamily: 'SFPro',
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
