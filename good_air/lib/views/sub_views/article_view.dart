import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:share/share.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blueGrey),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Air', style: TextStyle(color: Colors.blueGrey)),
            Text(
              'News',
              style: TextStyle(color: Colors.blueAccent),
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      floatingActionButton: Positioned(
          bottom: 10,
          right: 10,
          child: FloatingActionButton(
            onPressed: () {
              Share.share('check out this news ${widget.articleUrl}');
            },
            child: Icon(Icons.share),
            backgroundColor: Colors.blue,
            heroTag: 'share',
          )),
      body: WebView(
        initialUrl: widget.articleUrl,
      ),
    );
  }
}
