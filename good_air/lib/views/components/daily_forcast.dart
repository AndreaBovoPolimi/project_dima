import 'package:flutter/material.dart';
import 'package:good_air/models/info_feed.dart';

class DailyForecast extends StatelessWidget {

  Daily daily;
  int index;
  O3Forecast day_o3;
  Pm102 day_pm10;
  Pm252 day_pm25;
  Uvi day_uvi;

  DailyForecast(Daily daily, int index) {
      this.daily = daily;
      this.index = index;
      if(daily.o3[index]!= null)
        day_o3 = daily.o3[index];
      if(daily.pm10[index] != null)
        day_pm10 = daily.pm10[index];
      if(daily.pm25[index] != null)
        day_pm25 = daily.pm25[index];
      if(daily.uvi[index] != null)
        day_uvi = daily.uvi[index];
  }
  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
     var color_left = Colors.black;
     var color_right = Colors.black;
     var iconSwipeLeft;
     var iconSwipeRight;
     if(this.index == 0)
       color_left = Colors.white;
     if(this.index == daily.o3.length - 1)
       color_right = Colors.white;
     iconSwipeLeft = Icon(Icons.arrow_left, color: color_left,);
     iconSwipeRight = Icon(Icons.arrow_right, color: color_right); 
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
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center,children: [iconSwipeLeft,Text(day_pm25.day),iconSwipeRight]),
          Text("O3: " + "min: " + day_o3.min.toString() + " max: " + day_o3.max.toString() + " avg: " + day_o3.avg.toString()),
          Text("Pm10: " + "min: " + day_pm10.min.toString() + " max: " + day_pm10.max.toString() + " avg: " + day_pm10.avg.toString()),
          Text("Pm25: " + "min: " + day_pm25.min.toString() + " max: " + day_pm25.max.toString() + " avg: " + day_pm25.avg.toString()),
          Text("UVI: " + "min: " + day_uvi.min.toString() + " max: " + day_uvi.max.toString() + " avg: " + day_uvi.avg.toString())
        ]),
  );
  }
}