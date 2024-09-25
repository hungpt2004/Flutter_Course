import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_ui/home/components/body_screens.dart';

import '../constant/constant_value.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu_outlined, size: sizeIcon),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search, size: sizeIcon),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Discover", // Chỉnh sửa từ "Descover" thành "Discover"
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40, fontFamily: textFamily),
                ),
              ],
            ),
          ),
          const Expanded(child: MyBodyScreens()), // Bọc MyBodyScreens trong Expanded
        ],
      ),
    );
  }
}
