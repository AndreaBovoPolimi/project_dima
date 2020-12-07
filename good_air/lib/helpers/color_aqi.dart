import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

double getColorAqiMarker(int valAqi) {
  if (valAqi >= 0 && valAqi <= 50) {
    return BitmapDescriptor.hueGreen;
  } else if (valAqi > 50 && valAqi <= 100) {
    return BitmapDescriptor.hueYellow;
  } else if (valAqi > 100 && valAqi <= 150) {
    return BitmapDescriptor.hueOrange;
  } else if (valAqi > 150 && valAqi <= 200) {
    return BitmapDescriptor.hueRed;
  } else if (valAqi > 200 && valAqi <= 300) {
    return BitmapDescriptor.hueMagenta;
  } else if (valAqi > 300) {
    return BitmapDescriptor.hueViolet;
  }
  return BitmapDescriptor.hueBlue;
}

MaterialColor getColorAqi(int valAqi) {
  if (valAqi >= 0 && valAqi <= 50) {
    return Colors.green;
  } else if (valAqi > 50 && valAqi <= 100) {
    return Colors.yellow;
  } else if (valAqi > 100 && valAqi <= 150) {
    return Colors.deepOrange;
  } else if (valAqi > 150 && valAqi <= 200) {
    return Colors.red;
  } else if (valAqi > 200 && valAqi <= 300) {
    return Colors.pink;
  } else if (valAqi > 300) {
    return Colors.deepPurple;
  }
  return Colors.blue;
}

int getColorAqiNumber(int valAqi) {
  if (valAqi >= 0 && valAqi <= 50) {
    return 0;
  } else if (valAqi > 50 && valAqi <= 100) {
    return 1;
  } else if (valAqi > 100 && valAqi <= 150) {
    return 2;
  } else if (valAqi > 150 && valAqi <= 200) {
    return 3;
  } else if (valAqi > 200 && valAqi <= 300) {
    return 4;
  } else if (valAqi > 300) {
    return 5;
  }
  return 0;
}
