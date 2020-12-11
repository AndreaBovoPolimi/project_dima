import 'dart:io';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:good_air/helpers/google_ads.dart';
import 'package:good_air/models/news_model.dart';
import 'package:good_air/views/components/blog_tile.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key key}) : super(key: key);
  State<NewsPage> createState() {
    return NewsPageState();
  }
}

class NewsPageState extends State<NewsPage> {
  NewsModel news = NewsModel();

  final _nativeAdController = NativeAdmobController();

  @override
  void initState() {
    getNews();
  }

  @override
  void dispose() {
    //_nativeAd?.dispose();
    super.dispose();
  }

  void getNews() async {
    await news.populateNews();
    setState(() {});
  }

  Widget adsContainer() {
    return Container(
      height: 150,
      child: NativeAdmob(
        adUnitID: NativeAd.testAdUnitId,
        controller: _nativeAdController,
        type: NativeAdmobType.banner,
        error: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: news.news.length * 2,
          itemBuilder: (context, index) {
            if ((index + (index == 0 ? 1 : 0)) % 3 == 0) {
              return adsContainer();
            }
            int i = index - (index ~/ 3);
            if (i >= news.news.length) return null;
            return Blogtile(
              imageUrl: news.news[i].urlToImage,
              title: news.news[i].title,
              description: news.news[i].description,
              url: news.news[i].url,
            );
          }),
    ));
  }
}
