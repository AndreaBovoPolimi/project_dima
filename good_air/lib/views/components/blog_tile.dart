import 'package:flutter/material.dart';
import 'package:good_air/views/sub_views/article_view.dart';

class Blogtile extends StatelessWidget {
  
  String imageUrl;
  String title;
  String description;
  String url;

  Blogtile({String imageUrl, String title, String description, String url}){
      this.imageUrl = imageUrl;
      this.title = title;
      this.description = description;
      this.url = url;
  }

  @override 
  Widget build(BuildContext context) {
      return GestureDetector (
        onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleView(url) ));
        },
        child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(child: Image.network(imageUrl), borderRadius: BorderRadius.circular(6),),
            Text(title, style: TextStyle(fontSize: 18,color: Colors.black87, fontWeight: FontWeight.w500),),
            Text(description, style: TextStyle(color: Colors.black54),)
          ],),
        )
      );
  } 

}