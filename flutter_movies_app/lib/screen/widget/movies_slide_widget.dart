import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies_app/screen/widget/movies_card_widget.dart';
import 'package:flutter_movies_app/service/api_movies_service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../model/movie.dart';

class SlideMovieWidget extends StatefulWidget {
  const SlideMovieWidget({super.key});

  @override
  State<SlideMovieWidget> createState() => _SlideMovieWidgetState();
}

class _SlideMovieWidgetState extends State<SlideMovieWidget> {
  late Future<List<Movie>> movies;

  @override
  void initState() {
    super.initState();
    //fetch data now showing movie
    movies = ApiMoviesService().fetchNowShowingMovie();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: movies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Have error when fetching data"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No have data"));
          }
          final List<Movie> movie = snapshot.data!;
          return CarouselSlider.builder(
            itemCount: movie.length,
            itemBuilder: (context, index, realIndex) {
              final movieIndex = movie[index];
              return MovieCardWidget(
                  movie: movieIndex); // Sử dụng MovieCard từ file khác
            },
            options: CarouselOptions(
              autoPlay: true, // Tự động trượt
              enlargeCenterPage: true, // Phóng to ảnh đang ở trung tâm
              aspectRatio: 16 / 9, // Tỷ lệ khung hình
              viewportFraction: 0.8, // Kích thước của từng mục so với viewport
            ),
          );
        });
  }
}
