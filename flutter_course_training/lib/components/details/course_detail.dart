import 'package:course_training_ui/components/details/components/video_details.dart';
import 'package:course_training_ui/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../model/course.dart';
import '../model/video.dart';
import 'components/description_details.dart';

class MyCourseDetails extends StatefulWidget {
  const MyCourseDetails({super.key, required this.course});

  final Course course;

  @override
  State<MyCourseDetails> createState() => _MyCourseDetailsState();
}

class _MyCourseDetailsState extends State<MyCourseDetails> {
  List<Video> getVideoOfCourse() {
    List<Video> videos = widget.course.videos;
    return videos;
  }

  bool isVideoSelected = true;
  List<bool> _hoverStates = [];
  List<bool> _selectedStates = [];

  @override
  void initState() {
    super.initState();
    final videos = getVideoOfCourse();
    _hoverStates = List<bool>.filled(videos.length, false);
    _selectedStates = List<bool>.filled(
        videos.length, false); // Khởi tạo trạng thái hover cho từng video
  }

  @override
  Widget build(BuildContext context) {
    final List<Video> videos = getVideoOfCourse();
    final course = widget.course;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 100),
              child: Text(
                widget.course.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications, color: primaryColor),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.indigo[50],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/${widget.course.urlImage}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    child: IconButton(
                      iconSize: 40,
                      icon: const Icon(
                        Icons.play_circle_fill_outlined,
                        size: 50,
                        color: Colors.white,
                      ),
                      color: primaryColor,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              course.title,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Created by Dear Programmer',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            Text(
              '${course.videoOfAmount} ' + "Videos",
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 5),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.indigo[50],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.width * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: isVideoSelected ? primaryColor : primaryColor.withOpacity(0.5), // Đổi màu tùy theo trạng thái
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isVideoSelected = true; // Đặt trạng thái khi button được nhấn
                        });
                      },
                      child: Text(
                        "Videos",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.width * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: isVideoSelected ? primaryColor.withOpacity(0.5) : primaryColor, // Đổi màu tùy theo trạng thái
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isVideoSelected = false; // Đặt trạng thái khi button được nhấn
                        });
                      },
                      child: Text(
                        "Description",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: isVideoSelected
                  ? VideoDetails(course: course)
                  : DescriptionDetails(course: course)
            ),
          ],
        ),
      ),
    );
  }
}


