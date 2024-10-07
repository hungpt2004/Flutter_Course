import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../model/course.dart';
import '../../model/video.dart';

class VideoDetails extends StatelessWidget {
  const VideoDetails({super.key, required this.course});

  final Course course;

  List<Video> getVideoOfCourse() {
    List<Video> videos = course.videos;
    return videos;
  }


  @override
  Widget build(BuildContext context) {
    final videos = getVideoOfCourse();
    var _isVideoSeleted = false;
    return ListView.builder(
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final video = videos[index];
        return GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(left: 2),
            child: ListTile(
              leading: const Icon(Icons.play_circle_fill,
                  color: primaryColor, size: 50),
              title: Text(video.title,
                  style: const TextStyle(fontSize: 16)),
              subtitle: Text('${video.duration} min 50 sec'),
            ),
          ),
        );
      },
    );
  }
}
