import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_news_app/model/article.dart';

class NewsApiService {
   final String apiKey = '313e712139fc486796d895c700aef894';
   final String baseUrl = 'https://newsapi.org/v2';

   Future<List<Article>> fetchData() async {

      String url = '$baseUrl/top-headlines?country=us&apiKey=$apiKey';

      try {

         final response = await http.get(Uri.parse(url));

         if (response.statusCode == 200) {

            final Map<String, dynamic> jsonData = json.decode(response.body);
            final List<dynamic> articlesJson = jsonData['articles'];

            return articlesJson.map((json) => Article.fromJson(json)).toList();
         } else {
            throw Exception('Failed to load top headlines');
         }

      } catch (e) {
         throw Exception('Error fetching articles: $e');
      }

   }

   Future<List<Article>> fetchDataCategory(String category) async {

      final url = '$baseUrl/top-headlines?country=us&category=$category&apiKey=$apiKey';

      try {

         final response = await http.get(Uri.parse(url));

         if (response.statusCode == 200) {
            final data = json.decode(response.body);
            final articles = data['articles'] as List;
            return articles.map((article) => Article.fromJson(article)).toList();
         } else {
            throw Exception('Failed to load articles: ${response.reasonPhrase}');
         }

      } catch (e) {
         throw Exception('Error fetching articles: $e');
      }
   }
}
