import 'package:flutter/material.dart';
import 'package:good_air/models/get_location.dart';

class AirInformation extends StatefulWidget {
  GetLocation getLocation;
  AirInformation(GetLocation getLocation) {
    this.getLocation = getLocation;
  }
  State<AirInformation> createState() {
    return AirInformationState(getLocation);
  }
}

class AirInformationState extends State<AirInformation> {
  GetLocation getLocation;
  AirInformationState(GetLocation getLocation) {
    this.getLocation = getLocation;
  }
  Widget build(BuildContext context) {
    if (getLocation.results.isEmpty) {
      return AlertDialog(
          title: Text('This place is not provided by our system, sorry!'));
    }
    return AlertDialog(
        title: Text(getLocation.results.first.city),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                'These are the air informations:',
              ),
              Text(''),
              for (var item in getLocation.results.first.countsByMeasurement)
                Text(item.parameter +
                    ' has a value as ' +
                    item.count.toString()),
            ],
          ),
        ));
  }
}
