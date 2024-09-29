import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/movie.dart';

class MovieCardWidget extends StatefulWidget {
  const MovieCardWidget({super.key, required this.movie});
  final Movie movie;

  @override
  State<MovieCardWidget> createState() => _MovieCardWidgetState();
}

class _MovieCardWidgetState extends State<MovieCardWidget> {
  @override
  Widget build(BuildContext context) {
    final movieIndex = widget.movie;
    return Stack(
      children: [
        //ClipRRect use for image
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            'https://image.tmdb.org/t/p/w500${movieIndex.backdropPath}',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.black.withOpacity(0),
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
    );
  }
}
