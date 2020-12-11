// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'microsoft_fuzzy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MicrosoftFuzzy _$MicrosoftFuzzyFromJson(Map<String, dynamic> json) {
  return MicrosoftFuzzy()
    ..summary = json['summary'] == null
        ? null
        : Summary.fromJson(json['summary'] as Map<String, dynamic>)
    ..results = (json['results'] as List)
        ?.map((e) =>
            e == null ? null : Results.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$MicrosoftFuzzyToJson(MicrosoftFuzzy instance) =>
    <String, dynamic>{
      'summary': instance.summary,
      'results': instance.results,
    };

Summary _$SummaryFromJson(Map<String, dynamic> json) {
  return Summary()
    ..query = json['query'] as String
    ..queryType = json['queryType'] as String
    ..queryTime = json['queryTime'] as int
    ..numResults = json['numResults'] as int
    ..offset = json['offset'] as int
    ..totalResults = json['totalResults'] as int
    ..fuzzyLevel = json['fuzzyLevel'] as int;
}

Map<String, dynamic> _$SummaryToJson(Summary instance) => <String, dynamic>{
      'query': instance.query,
      'queryType': instance.queryType,
      'queryTime': instance.queryTime,
      'numResults': instance.numResults,
      'offset': instance.offset,
      'totalResults': instance.totalResults,
      'fuzzyLevel': instance.fuzzyLevel,
    };

Results _$ResultsFromJson(Map<String, dynamic> json) {
  return Results()
    ..type = json['type'] as String
    ..id = json['id'] as String
    ..score = (json['score'] as num)?.toDouble()
    ..address = json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>)
    ..position = json['position'] == null
        ? null
        : Position.fromJson(json['position'] as Map<String, dynamic>)
    ..viewport = json['viewport'] == null
        ? null
        : Viewport.fromJson(json['viewport'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'score': instance.score,
      'address': instance.address,
      'position': instance.position,
      'viewport': instance.viewport,
    };

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address()
    ..streetName = json['streetName'] as String
    ..municipality = json['municipality'] as String
    ..countrySecondarySubdivision =
        json['countrySecondarySubdivision'] as String
    ..countrySubdivision = json['countrySubdivision'] as String
    ..postalCode = json['postalCode'] as String
    ..countryCode = json['countryCode'] as String
    ..country = json['country'] as String
    ..countryCodeISO3 = json['countryCodeISO3'] as String
    ..freeformAddress = json['freeformAddress'] as String
    ..localName = json['localName'] as String;
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'streetName': instance.streetName,
      'municipality': instance.municipality,
      'countrySecondarySubdivision': instance.countrySecondarySubdivision,
      'countrySubdivision': instance.countrySubdivision,
      'postalCode': instance.postalCode,
      'countryCode': instance.countryCode,
      'country': instance.country,
      'countryCodeISO3': instance.countryCodeISO3,
      'freeformAddress': instance.freeformAddress,
      'localName': instance.localName,
    };

Position _$PositionFromJson(Map<String, dynamic> json) {
  return Position()
    ..lat = (json['lat'] as num)?.toDouble()
    ..lon = (json['lon'] as num)?.toDouble();
}

Map<String, dynamic> _$PositionToJson(Position instance) => <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };

Viewport _$ViewportFromJson(Map<String, dynamic> json) {
  return Viewport()
    ..topLeftPoint = json['topLeftPoint'] == null
        ? null
        : Position.fromJson(json['topLeftPoint'] as Map<String, dynamic>)
    ..btmRightPoint = json['btmRightPoint'] == null
        ? null
        : Position.fromJson(json['btmRightPoint'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ViewportToJson(Viewport instance) => <String, dynamic>{
      'topLeftPoint': instance.topLeftPoint,
      'btmRightPoint': instance.btmRightPoint,
    };
