import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/home/components/navbar_bottom.dart';
import '../../components/home/course_banner.dart';
import '../../components/home/course_list.dart';
import '../../constants/colors.dart';

class MyCourseHome extends StatefulWidget {
  const MyCourseHome({super.key});

  @override
  State<MyCourseHome> createState() => _MyCourseHomeState();
}

class _MyCourseHomeState extends State<MyCourseHome> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          // Top part with purple background and rounded edge
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.25,
              color: primaryColor, // Replace with your desired color
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.dashboard_sharp, color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications, color: Colors.white),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      "Hi, Programmer",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 7, bottom: 16),
                        width: MediaQuery.of(context).size.width * 0.95,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          onTap: () {},
                          controller: _searchController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintText: 'Search here...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Course Banner
          Flexible(
            flex: 2,
            child: MyCourseBanner(), // The banner widget
          ),
          // Course List
          Expanded(
            flex: 3,
            child: MyCourseList(), // The course list widget
          ),
        ],
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: MyBottomNavBar(), // Thêm Navbar ở đây
    );
  }
}
