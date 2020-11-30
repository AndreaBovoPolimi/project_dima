// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_map.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoMap _$InfoMapFromJson(Map<String, dynamic> json) {
  return InfoMap()
    ..status = json['status'] as String
    ..data = (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Datum.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$InfoMapToJson(InfoMap instance) => <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) {
  return Datum()
    ..lat = (json['lat'] as num)?.toDouble()
    ..lon = (json['lon'] as num)?.toDouble()
    ..uid = json['uid'] as int
    ..aqi = json['aqi'] as String
    ..station = json['station'] == null
        ? null
        : Station.fromJson(json['station'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'uid': instance.uid,
      'aqi': instance.aqi,
      'station': instance.station,
    };

Station _$StationFromJson(Map<String, dynamic> json) {
  return Station()
    ..name = json['name'] as String
    ..time =
        json['time'] == null ? null : DateTime.parse(json['time'] as String);
}

Map<String, dynamic> _$StationToJson(Station instance) => <String, dynamic>{
      'name': instance.name,
      'time': instance.time?.toIso8601String(),
    };
