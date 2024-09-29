import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_news_app/screen/button_category.dart';
import 'package:flutter_news_app/screen/news_category.dart';
import 'package:flutter_news_app/service/news_service.dart';

import '../model/article.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Article>> articles;

  @override
  void initState() {
    super.initState();
    articles = NewsApiService().fetchData();
  }

  void fetchDataByCategory(String category) {
    setState(() {
      // print(category);
      articles = NewsApiService().fetchDataCategory(category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
        future: articles,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
              return const Center(child: Text("Can not fetch data from API"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("No have data"));
          }
          final List<Article> news = snapshot.data!;
          return Column(
            children: [
              ButtonCategory(onSelected: fetchDataByCategory),
              Expanded(
                child: ListView.builder(
                  itemCount: news.length,
                  itemBuilder: (context, index) {
                    final Article article = news[index];
                    if(article.urlToImage == null) {
                      article.urlToImage == '';
                    }
                    if(snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      return NewsCardCategory(article: article);
                    }
                  },
                ),
              ),
            ],
          );
        }
    );
  }
}
