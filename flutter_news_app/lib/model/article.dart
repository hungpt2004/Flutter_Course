import 'package:flutter_news_app/model/source.dart';

class Article {
  final Source source;
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final String publishedAt;
  final String? content;

  Article(
      {required this.source,
      this.author,
      required this.title,
      this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      this.content});

  //Method map object
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        source: Source.fromJson(json['source']),
        author: json['author'],
        title: json['title'] ?? 'No Title',
        description: json['description'],
        url: json['url'] ?? '',
        urlToImage: json['urlToImage'],
        publishedAt: json['publishedAt'] ?? 'No Date',
        content: json['content']);
  }
}
