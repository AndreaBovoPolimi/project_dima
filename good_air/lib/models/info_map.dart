import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'info_map.g.dart';

@JsonSerializable()
class InfoMap {
  String status;
  List<Datum> data;

  static InfoMap fromJsonString(String json) {
    var map = jsonDecode(json);
    return _$InfoMapFromJson(map);
  }

  static InfoMap fromJson(Map<String, dynamic> json) {
    return _$InfoMapFromJson(json);
  }
}

@JsonSerializable()
class Datum {
  double lat;
  double lon;
  int uid;
  String aqi;
  Station station;

  static Datum fromJson(Map<String, dynamic> json) {
    return _$DatumFromJson(json);
  }
}

@JsonSerializable()
class Station {
  String name;
  DateTime time;

  static Station fromJson(Map<String, dynamic> json) {
    return _$StationFromJson(json);
  }
}
