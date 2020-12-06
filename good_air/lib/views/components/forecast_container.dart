import 'package:flutter/material.dart';
import 'package:good_air/models/info_feed.dart';

class ForecastContainer extends StatelessWidget {

  InfoFeed infoFeed;
  ForecastContainer(InfoFeed infoFeed) {
      this.infoFeed = infoFeed;
      for (var v in infoFeed.data.forecast.daily.o3)
        print(v.day);
        
  }
  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
     return Container(
      margin: EdgeInsets.only(left: size.width*0.03, top: size.height*0.1, right: size.width*0.03, bottom: size.height*0.02),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
  );
  }
}