import 'package:flutter/material.dart';
import 'package:good_air/helpers/color_aqi.dart';
import 'package:good_air/models/info_feed.dart';
import 'package:good_air/sqlite/entities/forecast.dart';
import 'package:good_air/views/components/forecast_background.dart';

class ForecastSubPage extends StatelessWidget {

  Color color;
  String address;
  int aqi;
  InfoFeed infoFeedPosition;
  ForecastEntity forecastEntity;

  ForecastSubPage(InfoFeed infoFeePosition, {ForecastEntity forecastEntity}) {
      this.infoFeedPosition = infoFeePosition;
      this.forecastEntity = forecastEntity;
      color = getColorAqi(infoFeedPosition.data.aqi);
      address = infoFeedPosition.data.city.name;
      aqi = infoFeedPosition.data.aqi;
      if(forecastEntity != null)
        address = forecastEntity.address;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    int index = address.indexOf(',');
    if(index != -1)
      address = address.substring(0,index);
    return Scaffold(
        body: Stack(
          children: [
                ForecastBackground(this.color),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [  
                  Container( 
                     margin: EdgeInsets.only(top:50),
                     child: Text(address.toUpperCase(), 
                     //maxLines: 1,
                     style: TextStyle(fontWeight: FontWeight.w600, fontSize: 40, color: Colors.black87, fontStyle: FontStyle.italic)
                     )
                  )],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Container(
                      margin: EdgeInsets.only(top: 130),
                      child: Text("AQI: " + aqi.toString(), 
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black87, fontStyle: FontStyle.italic)
                      )
                  ),
                ])
          ]),
    );
  }
}