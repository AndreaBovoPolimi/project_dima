import 'package:flutter/material.dart';
import 'package:good_air/views/components/forecast_background.dart';

class ForecastSubPage extends StatelessWidget {

  Color color;

  ForecastSubPage(Color color) {
      this.color = color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ForecastBackground(this.color)
      );
  }
}