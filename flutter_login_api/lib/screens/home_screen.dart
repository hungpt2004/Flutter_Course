import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
      
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                )
                              ]
                            ),
                            child: ClipOval(child: Image.asset("assets/images/boi.jpg", fit: BoxFit.cover,)),
                          ),
                          SizedBox(width: 5,),
                          Text("HungPhamTrong", style: TextStyle(fontFamily: 'SFPro'),)
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.notification_add_sharp),
                  )
                ],
              ),
            )
      
          ],
        ),
      ),
    );
  }
}
