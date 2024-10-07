import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({
    super.key,
  });

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
      ),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -10),
            blurRadius: 35,
            color: primaryColor.withOpacity(0.38),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.home,
                  size: 30,
                  color: primaryColor,
                ),
                onPressed: () {},
              ),
              const Text("Home",style: TextStyle(
                color: primaryColor
              ),)
            ],
          ),
          Column(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.newspaper,
                  size: 30,
                ),
                onPressed: () {},
              ),
              const Text("Courses")
            ],
          ),
          Column(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.heart_broken,
                  size: 30,
                ),
                onPressed: () {},
              ),
              const Text("Wishlist")
            ],
          ),
          Column(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.person,
                  size: 30,
                ),
                onPressed: () {},
              ),
              const Text("Accounts")
            ],
          ),
        ],
      ),
    );
  }
}
