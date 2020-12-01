import 'package:flutter/material.dart';
import 'package:good_air/models/news_model.dart';
import 'package:good_air/views/components/blog_tile.dart';

class NewsPage extends StatefulWidget {
  State<NewsPage> createState() {
    return NewsPageState();
  }
}

class NewsPageState extends State<NewsPage> {
  NewsModel news = NewsModel();
  
  @override
  void initState() {
    getNews();
  }

  void getNews() async{
    await news.populateNews();
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: news.news.length,
            itemBuilder: (context, index) {
              return Blogtile(
                imageUrl: news.news[index].urlToImage,
                title: news.news[index].title,
                description: news.news[index].description,
                url: news.news[index].url,
              );
            }
            ),
    ));
  }
}
