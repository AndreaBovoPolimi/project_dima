import 'package:flutter/material.dart';
import 'package:good_air/models/info_feed.dart';
import 'package:good_air/views/components/line_chart.dart';

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
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        title: Icon(
          Icons.poll,
          size: 50,
          color: Colors.blue,
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                infoFeed.data.city.name,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
              if (infoFeed.data.iaqi.co != null)
                LineChart(
                  value: infoFeed.data.iaqi.co.v,
                  min: 0,
                  max: 60,
                  interval: 10,
                  color: Colors.red,
                  name: "CO  ",
                ),
              if (infoFeed.data.iaqi.dew != null)
                LineChart(
                  value: infoFeed.data.iaqi.dew.v,
                  min: 0,
                  max: 30,
                  interval: 5,
                  color: Colors.yellow,
                  name: "DEW ",
                ),
              if (infoFeed.data.iaqi.h != null)
                LineChart(
                  value: infoFeed.data.iaqi.h.v,
                  min: 0,
                  max: 150,
                  interval: 30,
                  color: Colors.orange,
                  name: "H   ",
                ),
              if (infoFeed.data.iaqi.no2 != null)
                LineChart(
                  value: infoFeed.data.iaqi.no2.v,
                  min: 0,
                  max: 100,
                  interval: 20,
                  color: Colors.amber,
                  name: "NO2 ",
                ),
              if (infoFeed.data.iaqi.o3 != null)
                LineChart(
                  value: infoFeed.data.iaqi.o3.v,
                  min: 0,
                  max: 50,
                  interval: 10,
                  color: Colors.deepPurple,
                  name: "O3  ",
                ),
              if (infoFeed.data.iaqi.p != null)
                LineChart(
                  value: infoFeed.data.iaqi.p.v,
                  min: 0,
                  max: 2000,
                  interval: 500,
                  color: Colors.greenAccent,
                  name: "P   ",
                ),
              if (infoFeed.data.iaqi.pm10 != null)
                LineChart(
                  value: infoFeed.data.iaqi.pm10.v.toDouble(),
                  min: 0,
                  max: 500,
                  interval: 100,
                  color: Colors.limeAccent,
                  name: "Pm10",
                ),
              if (infoFeed.data.iaqi.so2 != null)
                LineChart(
                  value: infoFeed.data.iaqi.so2.v,
                  min: 0,
                  max: 30,
                  interval: 5,
                  color: Colors.pink,
                  name: "SO2 ",
                ),
              if (infoFeed.data.iaqi.t != null)
                LineChart(
                  value: infoFeed.data.iaqi.t.v,
                  min: 0,
                  max: 40,
                  interval: 5,
                  color: Colors.indigo,
                  name: "T   ",
                ),
              if (infoFeed.data.iaqi.w != null)
                LineChart(
                  value: infoFeed.data.iaqi.w.v,
                  min: 0,
                  max: 20,
                  interval: 5,
                  color: Colors.blueAccent,
                  name: "W   ",
                ),
            ],
          ),
        ));
  }
}
