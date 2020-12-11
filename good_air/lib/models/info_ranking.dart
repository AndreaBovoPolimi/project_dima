import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'info_ranking.g.dart';

@JsonSerializable()
class InfoRanking {
  List<Cities> cities;
  String time;
  int version;

  static InfoRanking fromJsonString(String json) {
    var map = jsonDecode(json);
    return _$InfoRankingFromJson(map);
  }

  static InfoRanking fromJson(Map<String, dynamic> json) {
    return _$InfoRankingFromJson(json);
  }
}

@JsonSerializable()
class Cities {
  String country;
  String city;
  StationRanking station;

  static Cities fromJson(Map<String, dynamic> json) {
    return _$CitiesFromJson(json);
  }
}

@JsonSerializable()
class StationRanking {
  List<double> g;
  String n;
  String u;
  String a;
  String t;
  String x;

  static StationRanking fromJson(Map<String, dynamic> json) {
    return _$StationRankingFromJson(json);
  }
}
