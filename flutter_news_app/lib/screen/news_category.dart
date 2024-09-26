import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/service/slider_page_route.dart';

import '../model/article.dart';
import 'news_details.dart';

class NewsCardCategory extends StatefulWidget {
  const NewsCardCategory({super.key, required this.article});

  final Article article;

  @override
  State<NewsCardCategory> createState() => _NewsCardCategoryState();
}

class _NewsCardCategoryState extends State<NewsCardCategory> {
  @override
  Widget build(BuildContext context) {
    final Article news = widget.article;
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
      child: GestureDetector(
        onTap: () {
          setState(() {
            Navigator.push(context, SlidePageRoute(page: NewsDetails(article: news,), beginOffset: const Offset(1.0,0.0), endOffset: Offset.zero, duration: const Duration(milliseconds: 1000)));
          });
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 5, top: 20),
          width: MediaQuery.of(context).size.width,
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
            BoxShadow(
                color: Colors.white.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3)),
          ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  "${news.urlToImage}",
                  width: MediaQuery.of(context).size.width,
                  height: 270,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                news.title,
                style: const TextStyle(fontSize: 20),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1.5,
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
