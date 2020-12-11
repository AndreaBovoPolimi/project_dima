import 'package:firebase_admob/firebase_admob.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:good_air/helpers/google_ads.dart';
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
  BannerAd _bannerAd;

  void _loadBannerAd() {
    _bannerAd
      ..load()
      ..show(anchorType: AnchorType.bottom);
  }

  @override
  void initState() {
    super.initState();
    _bannerAd = BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.banner,
    );
    _loadBannerAd();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.blueGrey),
            onPressed: () => {dispose(), Navigator.pop(context)}),
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
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.blueGrey),
            onPressed: () =>
                {Share.share('check out this news ${widget.articleUrl}')},
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: WebView(
        initialUrl: widget.articleUrl,
      ),
    );
  }
}
