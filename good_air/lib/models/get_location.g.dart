// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLocation _$GetLocationFromJson(Map<String, dynamic> json) {
  return GetLocation()
    ..results = (json['results'] as List)
        ?.map((e) =>
            e == null ? null : Results.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GetLocationToJson(GetLocation instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

Results _$ResultsFromJson(Map<String, dynamic> json) {
  return Results()
    ..id = json['id'] as String
    ..country = json['country'] as String
    ..city = json['city'] as String
    ..cities = (json['cities'] as List)?.map((e) => e as String)?.toList()
    ..location = json['location'] as String
    ..locations = (json['locations'] as List)?.map((e) => e as String)?.toList()
    ..sourceName = json['sourceName'] as String
    ..sourceNames =
        (json['sourceNames'] as List)?.map((e) => e as String)?.toList()
    ..sourceType = json['sourceType'] as String
    ..sourceTypes =
        (json['sourceTypes'] as List)?.map((e) => e as String)?.toList()
    ..coordinates = json['coordinates'] == null
        ? null
        : Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>)
    ..firstUpdated = json['firstUpdated'] as String
    ..lastUpdated = json['lastUpdated'] as String
    ..parameters =
        (json['parameters'] as List)?.map((e) => e as String)?.toList()
    ..countsByMeasurement = (json['countsByMeasurement'] as List)
        ?.map((e) => e == null
            ? null
            : CountsByMeasurement.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..count = json['count'] as int;
}

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'id': instance.id,
      'country': instance.country,
      'city': instance.city,
      'cities': instance.cities,
      'location': instance.location,
      'locations': instance.locations,
      'sourceName': instance.sourceName,
      'sourceNames': instance.sourceNames,
      'sourceType': instance.sourceType,
      'sourceTypes': instance.sourceTypes,
      'coordinates': instance.coordinates,
      'firstUpdated': instance.firstUpdated,
      'lastUpdated': instance.lastUpdated,
      'parameters': instance.parameters,
      'countsByMeasurement': instance.countsByMeasurement,
      'count': instance.count,
    };

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) {
  return Coordinates()
    ..longitude = (json['longitude'] as num)?.toDouble()
    ..latitude = (json['latitude'] as num)?.toDouble();
}

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };

CountsByMeasurement _$CountsByMeasurementFromJson(Map<String, dynamic> json) {
  return CountsByMeasurement()
    ..parameter = json['parameter'] as String
    ..count = json['count'] as int;
}

Map<String, dynamic> _$CountsByMeasurementToJson(
        CountsByMeasurement instance) =>
    <String, dynamic>{
      'parameter': instance.parameter,
      'count': instance.count,
    };
