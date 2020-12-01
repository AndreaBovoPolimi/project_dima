import "package:flutter/material.dart";
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {

  String articleUrl;
  ArticleView(articleUrl) {
      this.articleUrl = articleUrl;
  }

  @override 
  State<ArticleView> createState() {
      return ArticleViewState();
  }
}


class ArticleViewState extends State<ArticleView> {
  @override 
  Widget build (BuildContext context) {
      return Container(
        child: WebView(
          initialUrl: widget.articleUrl,
        ),
      );
  }
}