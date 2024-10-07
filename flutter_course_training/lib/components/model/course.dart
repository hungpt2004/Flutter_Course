import 'package:course_training_ui/components/model/video.dart';

class Course {
  final String title;
  final String name;
  final String urlImage;
  final int videoOfAmount;
  final String author;
  final String description;
  final List<Video> videos;

  Course({
    required this.title,
    required this.name,
    required this.urlImage,
    required this.videoOfAmount,
    required this.author,
    required this.description,
    required this.videos,
  });
}
