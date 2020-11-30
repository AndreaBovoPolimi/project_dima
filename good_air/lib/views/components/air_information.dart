import 'package:flutter/material.dart';
import 'package:good_air/models/info_feed.dart';

class AirInformation extends StatefulWidget {
  InfoFeed infoFeed;
  AirInformation(InfoFeed infoFeed) {
    this.infoFeed = infoFeed;
  }
  State<AirInformation> createState() {
    return AirInformationState(infoFeed);
  }
}

class AirInformationState extends State<AirInformation> {
  InfoFeed infoFeed;
  AirInformationState(InfoFeed infoFeed) {
    this.infoFeed = infoFeed;
  }
  Widget build(BuildContext context) {
    if (infoFeed.status != 'ok') {
      return AlertDialog(
          title: Text('This place is not provided by our system, sorry!'));
    }
    return AlertDialog(
        title: Text(infoFeed.data.city.name),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                'These are the air informations:',
              ),
              Text(''),
              if (infoFeed.data.iaqi.co != null)
                Text('CO is ' + infoFeed.data.iaqi.co.v.toString()),
              if (infoFeed.data.iaqi.dew != null)
                Text('DEW is ' + infoFeed.data.iaqi.dew.v.toString()),
              if (infoFeed.data.iaqi.h != null)
                Text('H is ' + infoFeed.data.iaqi.h.v.toString()),
              if (infoFeed.data.iaqi.no2 != null)
                Text('NO2 is ' + infoFeed.data.iaqi.no2.v.toString()),
              if (infoFeed.data.iaqi.o3 != null)
                Text('O3 is ' + infoFeed.data.iaqi.o3.v.toString()),
              if (infoFeed.data.iaqi.p != null)
                Text('P is ' + infoFeed.data.iaqi.p.v.toString()),
              if (infoFeed.data.iaqi.pm10 != null)
                Text('Pm10 is ' + infoFeed.data.iaqi.pm10.v.toString()),
              if (infoFeed.data.iaqi.so2 != null)
                Text('SO2 is ' + infoFeed.data.iaqi.so2.v.toString()),
              if (infoFeed.data.iaqi.t != null)
                Text('T is ' + infoFeed.data.iaqi.t.v.toString()),
              if (infoFeed.data.iaqi.w != null)
                Text('W is ' + infoFeed.data.iaqi.w.v.toString()),
            ],
          ),
        ));
  }
}
