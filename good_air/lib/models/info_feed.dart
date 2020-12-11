import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'info_feed.g.dart';

@JsonSerializable()
class InfoFeed {
  String status;
  Data data;

  static InfoFeed fromJsonString(String json) {
    var map = jsonDecode(json);
    return _$InfoFeedFromJson(map);
  }

  static InfoFeed fromJson(Map<String, dynamic> json) {
    return _$InfoFeedFromJson(json);
  }
}

@JsonSerializable()
class Data {
  int aqi;
  int idx;
  List<Attribution> attributions;
  City city;
  String dominentpol;
  Iaqi iaqi;
  Time time;
  Forecast forecast;

  static Data fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }
}

@JsonSerializable()
class Attribution {
  String url;
  String name;
  String logo;

  static Attribution fromJson(Map<String, dynamic> json) {
    return _$AttributionFromJson(json);
  }
}

@JsonSerializable()
class City {
  List<double> geo;
  String name;
  String url;

  static City fromJson(Map<String, dynamic> json) {
    return _$CityFromJson(json);
  }
}

@JsonSerializable()
class Co {
  double v;

  static Co fromJson(Map<String, dynamic> json) {
    return _$CoFromJson(json);
  }
}

@JsonSerializable()
class H {
  double v;

  static H fromJson(Map<String, dynamic> json) {
    return _$HFromJson(json);
  }
}

@JsonSerializable()
class No2 {
  double v;

  static No2 fromJson(Map<String, dynamic> json) {
    return _$No2FromJson(json);
  }
}

@JsonSerializable()
class P {
  double v;

  static P fromJson(Map<String, dynamic> json) {
    return _$PFromJson(json);
  }
}

@JsonSerializable()
class Pm10 {
  int v;

  static Pm10 fromJson(Map<String, dynamic> json) {
    return _$Pm10FromJson(json);
  }
}

@JsonSerializable()
class Pm25 {
  int v;

  static Pm25 fromJson(Map<String, dynamic> json) {
    return _$Pm25FromJson(json);
  }
}

@JsonSerializable()
class T {
  double v;

  static T fromJson(Map<String, dynamic> json) {
    return _$TFromJson(json);
  }
}

@JsonSerializable()
class Dew {
  double v;

  static Dew fromJson(Map<String, dynamic> json) {
    return _$DewFromJson(json);
  }
}

@JsonSerializable()
class O3 {
  double v;

  static O3 fromJson(Map<String, dynamic> json) {
    return _$O3FromJson(json);
  }
}

@JsonSerializable()
class SO2 {
  double v;

  static SO2 fromJson(Map<String, dynamic> json) {
    return _$SO2FromJson(json);
  }
}

@JsonSerializable()
class W {
  double v;

  static W fromJson(Map<String, dynamic> json) {
    return _$WFromJson(json);
  }
}

@JsonSerializable()
class Iaqi {
  Co co;
  H h;
  No2 no2;
  P p;
  Pm10 pm10;
  Pm25 pm25;
  T t;
  Dew dew;
  O3 o3;
  SO2 so2;
  W w;

  static Iaqi fromJson(Map<String, dynamic> json) {
    return _$IaqiFromJson(json);
  }
}

@JsonSerializable()
class Time {
  String s;
  String tz;
  int v;
  String iso;

  static Time fromJson(Map<String, dynamic> json) {
    return _$TimeFromJson(json);
  }
}

@JsonSerializable()
class O3Forecast {
  int avg;
  String day;
  int max;
  int min;

  static O3Forecast fromJson(Map<String, dynamic> json) {
    return _$O3ForecastFromJson(json);
  }
}

@JsonSerializable()
class Pm102 {
  int avg;
  String day;
  int max;
  int min;

  static Pm102 fromJson(Map<String, dynamic> json) {
    return _$Pm102FromJson(json);
  }
}

@JsonSerializable()
class Pm252 {
  int avg;
  String day;
  int max;
  int min;

  static Pm252 fromJson(Map<String, dynamic> json) {
    return _$Pm252FromJson(json);
  }
}

@JsonSerializable()
class Uvi {
  int avg;
  String day;
  int max;
  int min;

  static Uvi fromJson(Map<String, dynamic> json) {
    return _$UviFromJson(json);
  }
}

@JsonSerializable()
class Daily {
  List<O3> o3;
  List<Pm102> pm10;
  List<Pm252> pm25;
  List<Uvi> uvi;

  static Daily fromJson(Map<String, dynamic> json) {
    return _$DailyFromJson(json);
  }
}

@JsonSerializable()
class Forecast {
  Daily daily;

  static Forecast fromJson(Map<String, dynamic> json) {
    return _$ForecastFromJson(json);
  }
}
