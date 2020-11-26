import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'get_location.g.dart';

@JsonSerializable()
class GetLocation {
  List<Results> results;

  static GetLocation fromJsonString(String json) {
    var map = jsonDecode(json);
    return _$GetLocationFromJson(map);
  }

  static GetLocation fromJson(Map<String, dynamic> json) {
    return _$GetLocationFromJson(json);
  }

  //String toExtractMapInformation(){
  //  return
  //}
}

@JsonSerializable()
class Results {
  String id;
  String country;
  String city;
  List<String> cities;
  String location;
  List<String> locations;
  String sourceName;
  List<String> sourceNames;
  String sourceType;
  List<String> sourceTypes;
  Coordinates coordinates;
  String firstUpdated;
  String lastUpdated;
  List<String> parameters;
  List<CountsByMeasurement> countsByMeasurement;
  int count;

  static Results fromJson(Map<String, dynamic> json) {
    return _$ResultsFromJson(json);
  }
}

@JsonSerializable()
class Coordinates {
  double longitude;
  double latitude;

  static Coordinates fromJson(Map<String, dynamic> json) {
    return _$CoordinatesFromJson(json);
  }
}

@JsonSerializable()
class CountsByMeasurement {
  String parameter;
  int count;

  static CountsByMeasurement fromJson(Map<String, dynamic> json) {
    return _$CountsByMeasurementFromJson(json);
  }
}
