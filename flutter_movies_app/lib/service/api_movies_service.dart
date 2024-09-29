import 'dart:convert';
import 'package:flutter/material.dart';
import '../model/movie.dart';
import 'package:http/http.dart' as http;

class ApiMoviesService {
  final String apiKey = "f95a6d45558dee5ab593965b75e80dfd";
  final String baseUrl = "https://api.themoviedb.org/3/movie";

  //NOW SHOWING
  Future<List<Movie>> fetchNowShowingMovie() async {
    String url = '$baseUrl/now_playing?api_key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final List<dynamic> movieData = jsonData['results'];
        return movieData.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load now showing movie");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //UP COMING
  Future<List<Movie>> fetchUpComingMovie() async {
    String url = '$baseUrl/upcoming?api_key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final List<dynamic> movieData = jsonData['results'];

        return movieData.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load up coming movie");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //POPULAR
  Future<List<Movie>> fetchPopularMovie() async {
    String url = '$baseUrl/popular?api_key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final List<dynamic> movieData = jsonData['results'];

        return movieData.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load popular movie");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
