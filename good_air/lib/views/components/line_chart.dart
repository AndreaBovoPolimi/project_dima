import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class LineChart extends StatelessWidget {
  
  String name;
  double value;
  double min;
  double max;
  double interval;
  Color color;
  
  LineChart({String name, double value, double min, double max, double interval, Color color}) {
      this.name = name;
      this.value = value;
      this.min = min;
      this.max = max;
      this.interval = interval;
      this.color = color;
  }
  @override
  Widget build(BuildContext context) {
    double font_size = 16;
    if(name == "NO2 ")
      font_size = 11;
    if(name == "Pm10")
      font_size = 9;
    if(name == "SO2 ")
      font_size = 11;

    return Container(
                child: Row( 
                  children: [
                    Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: font_size,),),
                    Flexible(child: 
                        SfSlider(
                            min: min,
                            max: max,
                            value: value,
                            interval: interval,
                            showTicks: true,
                            showLabels: true,
                            showTooltip: true,
                            minorTicksPerInterval: 1,              
                            onChanged: (dynamic value) => {},
                            activeColor: color,
                            inactiveColor: Colors.grey,
                          )
                        )
                    ])
              );
  }

}