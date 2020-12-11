// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_ranking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoRanking _$InfoRankingFromJson(Map<String, dynamic> json) {
  return InfoRanking()
    ..cities = (json['cities'] as List)
        ?.map((e) =>
            e == null ? null : Cities.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..time = json['time'] as String
    ..version = json['version'] as int;
}

Map<String, dynamic> _$InfoRankingToJson(InfoRanking instance) =>
    <String, dynamic>{
      'cities': instance.cities,
      'time': instance.time,
      'version': instance.version,
    };

Cities _$CitiesFromJson(Map<String, dynamic> json) {
  return Cities()
    ..country = json['country'] as String
    ..city = json['city'] as String
    ..station = json['station'] == null
        ? null
        : StationRanking.fromJson(json['station'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CitiesToJson(Cities instance) => <String, dynamic>{
      'country': instance.country,
      'city': instance.city,
      'station': instance.station,
    };

StationRanking _$StationRankingFromJson(Map<String, dynamic> json) {
  return StationRanking()
    ..g = (json['g'] as List)?.map((e) => (e as num)?.toDouble())?.toList()
    ..n = json['n'] as String
    ..u = json['u'] as String
    ..a = json['a'] as String
    ..t = json['t'] as String
    ..x = json['x'] as String;
}

Map<String, dynamic> _$StationRankingToJson(StationRanking instance) =>
    <String, dynamic>{
      'g': instance.g,
      'n': instance.n,
      'u': instance.u,
      'a': instance.a,
      't': instance.t,
      'x': instance.x,
    };
