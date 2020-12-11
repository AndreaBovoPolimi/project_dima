import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'microsoft_fuzzy.g.dart';

@JsonSerializable()
class MicrosoftFuzzy {
  Summary summary;
  List<Results> results;

  static MicrosoftFuzzy fromJsonString(String json) {
    var map = jsonDecode(json);
    return _$MicrosoftFuzzyFromJson(map);
  }

  static MicrosoftFuzzy fromJson(Map<String, dynamic> json) {
    return _$MicrosoftFuzzyFromJson(json);
  }
}

@JsonSerializable()
class Summary {
  String query;
  String queryType;
  int queryTime;
  int numResults;
  int offset;
  int totalResults;
  int fuzzyLevel;

  static Summary fromJson(Map<String, dynamic> json) {
    return _$SummaryFromJson(json);
  }
}

@JsonSerializable()
class Results {
  String type;
  String id;
  double score;
  Address address;
  Position position;
  Viewport viewport;

  static Results fromJson(Map<String, dynamic> json) {
    return _$ResultsFromJson(json);
  }
}

@JsonSerializable()
class Address {
  String streetName;
  String municipality;
  String countrySecondarySubdivision;
  String countrySubdivision;
  String postalCode;
  String countryCode;
  String country;
  String countryCodeISO3;
  String freeformAddress;
  String localName;

  static Address fromJson(Map<String, dynamic> json) {
    return _$AddressFromJson(json);
  }
}

@JsonSerializable()
class Position {
  double lat;
  double lon;

  static Position fromJson(Map<String, dynamic> json) {
    return _$PositionFromJson(json);
  }
}

@JsonSerializable()
class Viewport {
  Position topLeftPoint;
  Position btmRightPoint;

  static Viewport fromJson(Map<String, dynamic> json) {
    return _$ViewportFromJson(json);
  }
}
