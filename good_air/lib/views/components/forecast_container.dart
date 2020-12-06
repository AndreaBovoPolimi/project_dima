import 'package:flutter/material.dart';
import 'package:good_air/models/info_feed.dart';
import 'package:good_air/views/components/daily_forcast.dart';

class ForecastContainer extends StatelessWidget {

  InfoFeed infoFeed;
  
  ForecastContainer(InfoFeed infoFeed) {
      this.infoFeed = infoFeed;
  }
  @override
  Widget build(BuildContext context) {
     List<DailyForecast> widgetList = new List<DailyForecast>();
     for(int i=0; i<this.infoFeed.data.forecast.daily.pm10.length; i++)
        widgetList.add(DailyForecast(infoFeed.data.forecast.daily,i));
     return PageView(
       controller: PageController(initialPage: 0),
       children: widgetList,
     );
  }
}