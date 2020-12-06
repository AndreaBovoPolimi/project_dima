import 'package:flutter/material.dart';
import 'package:good_air/models/info_feed.dart';

class DailyForecast extends StatelessWidget {

  Daily daily;
  int index;
  O3Forecast day_o3;
  Pm102 day_pm10;
  Pm252 day_pm25;
  Uvi day_uvi;

  DailyForecast(Daily dailym, int index) {
      this.daily = daily;
      this.index = index;
      if(day_o3 != null)
        day_o3 = daily.o3[index];
      if(day_pm10 != null)
        day_pm10 = daily.pm10[index];
      if(day_pm25 != null)
        day_pm25 = daily.pm25[index];
      if(day_uvi != null)
        day_uvi = daily.uvi[index];
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
      child: Text(day_pm25.toString()),
  );
  }
}