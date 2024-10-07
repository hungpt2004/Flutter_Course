import 'package:course_training_ui/components/details/course_detail.dart';
import 'package:course_training_ui/components/home/components/navbar_bottom.dart';
import 'package:course_training_ui/components/home/components/slider_page_route.dart';
import 'package:flutter/material.dart';

import '../../model/course.dart';
import '../../model/video.dart';

class MyCardCourse extends StatefulWidget {
  const MyCardCourse({super.key});

  @override
  State<MyCardCourse> createState() => _MyCardCourseState();
}

class _MyCardCourseState extends State<MyCardCourse> {

  List<Course> courses = [
    Course(
      title: "C# Complete Course",
      name: "C#",
      urlImage: "C#.png",
      videoOfAmount: 55,
      author: "John Doe",
      description: "Learn C# from scratch, mastering object-oriented programming.",
      videos: [
        Video(
          title: "Introduction to C#",
          url: "https://example.com/csharp_intro.mp4",
          duration: 20,
        ),
        Video(
          title: "C# OOP Concepts",
          url: "https://example.com/csharp_oop.mp4",
          duration: 20,
        ),
      ],
    ),
    Course(
      title: "Flutter Complete Code",
      name: "Flutter",
      urlImage: "Flutter.png",
      videoOfAmount: 55,
      author: "Jane Smith",
      description: "Build beautiful applications for mobile and web using Flutter.",
      videos: [
        Video(
          title: "Getting Started with Flutter",
          url: "https://example.com/flutter_intro.mp4",
          duration: 20,
        ),
      ],
    ),
    Course(
      title: "Python Complete Code",
      name: "Python",
      urlImage: "Python.png",
      videoOfAmount: 55,
      author: "Alex Johnson",
      description: "Get hands-on experience with Python for data analysis.",
      videos: [
        Video(
          title: "Python Basics",
          url: "https://example.com/python_basics.mp4",
          duration: 20,
        ),
      ],
    ),
    Course(
      title: "React Native Complete Code",
      name: "React Native",
      urlImage: "React Native.png",
      videoOfAmount: 55,
      author: "Emily Davis",
      description: "Develop cross-platform mobile apps using React Native.",
      videos: [
        Video(
          title: "Introduction to React Native",
          url: "https://example.com/react_native_intro.mp4",
          duration: 20,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.8, // Tỷ lệ chiều cao so với chiều rộng
            crossAxisCount: 2, // Số lượng container trong một hàng
            crossAxisSpacing: 10, // Khoảng cách ngang giữa các container
          ),
          itemBuilder: (context, index) {
            if (index >= courses.length) {
              return null;
            }
            final course = courses[index];
            return GestureDetector(
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 15, left: 5, right: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.indigo[50],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3), // Đổ bóng xuống
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/${course.urlImage}",
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(height: 10), // Khoảng cách giữa hình ảnh và tên khóa học
                      Text(
                        course.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25), // Chỉnh sửa kích thước chữ
                      ),
                      const SizedBox(height: 5), // Khoảng cách giữa tên và số lượng video
                      Text(
                        "${course.videoOfAmount} Videos",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 12), // Kích thước chữ cho số lượng video
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () => Navigator.push(
                  context,
                  SlidePageRoute(page: MyCourseDetails(course: courses[index]), beginOffset: const Offset(1.0, 0.0),  // Trượt từ trên
                      endOffset: Offset.zero, duration: Duration(milliseconds: 1000))
              ),
            );
          },
        ),
    );
  }
}
