import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies_app/service/api_movies_service.dart';

import '../model/movie.dart';

class PopularMovieScreen extends StatefulWidget {
  const PopularMovieScreen({super.key});


  @override
  State<PopularMovieScreen> createState() => _PopularMovieScreenState();
}

class _PopularMovieScreenState extends State<PopularMovieScreen> {
  late Future<List<Movie>> movies;
  late PageController pageController; // Step 2: Add PageController

  @override
  void initState() {
    super.initState();
    movies = ApiMoviesService().fetchPopularMovie();
    pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8, // Adjust this value for card width
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: movies,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("Can not fetch data from API"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No data available"));
        }
        final moviesList = snapshot.data!;

        return Stack(
          children: [
            SizedBox(
              height: 250,
              child: PageView.builder( // Step 1: Use PageView.builder instead of ListView.builder
                controller: pageController,
                scrollDirection: Axis.horizontal,
                itemCount: moviesList.length * 2, // Step 3: Use double the list length for infinite scrolling effect
                itemBuilder: (context, index) {
                  final movieIndex = moviesList[index % moviesList.length]; // Use modulo to loop through moviesList
                  final backdropPath = movieIndex.backdropPath ?? '';

                  return Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500$backdropPath',
                            fit: BoxFit.cover,
                            width: 200,
                            height: 250,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            color: Colors.black.withOpacity(0.5),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    movieIndex.title,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    pageController.dispose(); // Dispose the page controller when not needed
    super.dispose();
  }
}

