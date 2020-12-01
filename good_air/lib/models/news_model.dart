import 'dart:convert';

import 'package:good_air/models/article_model.dart';
import 'package:http/http.dart' as http;

class NewsModel {
  List<ArticleModel> news = [];
  String query = "https://newsapi.org/v2/everything?q=pollution&apiKey=8f6d55fc3b2248b1b68d1bd0132ee201";

  Future<void> populateNews() async{
      var response = await http.get(query);
      var jsonData = jsonDecode(response.body);

      if(jsonData['status'] == "ok") {
        jsonData['articles'].forEach((element) {
            if(element['urlToImage'] != null && element['description'] != null) {
              ArticleModel newArticle = ArticleModel(
                title: element['title'],
                author: element['author'],
                description: element['description'],
                url: element['url'],
                urlToImage: element['urlToImage'],
                content: element['content']
              );
              news.add(newArticle);
            }
        });
      }
  }
}