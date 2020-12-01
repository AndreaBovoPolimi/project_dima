import 'package:flutter/material.dart';

class Blogtile extends StatelessWidget {
  
  String imageUrl;
  String title;
  String description;

  Blogtile({String imageUrl, String title, String description}){
      this.imageUrl = imageUrl;
      this.title = title;
      this.description = description;
  }

  @override 
  Widget build(BuildContext context) {
      return Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(child: Image.network(imageUrl), borderRadius: BorderRadius.circular(6),),
            Text(title, style: TextStyle(fontSize: 18,color: Colors.black87, fontWeight: FontWeight.w500),),
            Text(description, style: TextStyle(color: Colors.black54),)
          ],),
      );
  } 

}