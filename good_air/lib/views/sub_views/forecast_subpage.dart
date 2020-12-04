import 'package:flutter/material.dart';
import 'package:good_air/helpers/color_aqi.dart';
import 'package:good_air/models/info_feed.dart';
import 'package:good_air/sqlite/entities/forecast.dart';
import 'package:good_air/views/components/forecast_background.dart';
import 'package:good_air/views/components/forecast_container.dart';
import 'package:good_air/views/components/rounded_container.dart';

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
    var textColor = Colors.white;
    if(color == Colors.yellow)
      textColor = Colors.black;
    return Scaffold(
        body: Stack(
          children: [
                ForecastBackground(color), //Colors.blue[300]
                Positioned(
                  top: size.height * 0.025,
                  left: size.width * 0.03,
                  child: Container( 
                     child: Row( children:[
                       Icon(Icons.location_on_outlined, color: textColor,),
                       Text(address, 
                       style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25, color: textColor, fontStyle: FontStyle.italic)
                     )]
                     )
                  )
                ),
                Positioned(
                  top: size.height * 0.025,
                  left: size.width * 0.75,
                  child: Container(
                      child: Text("AQI: " + aqi.toString(), 
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: textColor, fontStyle: FontStyle.normal)
                      )
                    ),
                 ),
                 Positioned(
                   child: RoundedContainer()
                 ),
                 Positioned(
                   child: ForecastContainer()
                 ),   
          ]),
    );
  }
}