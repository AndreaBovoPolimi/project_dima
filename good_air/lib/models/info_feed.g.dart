// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoFeed _$InfoFeedFromJson(Map<String, dynamic> json) {
  return InfoFeed()
    ..status = json['status'] as String
    ..data = json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$InfoFeedToJson(InfoFeed instance) => <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data()
    ..aqi = json['aqi'] as int
    ..idx = json['idx'] as int
    ..attributions = (json['attributions'] as List)
        ?.map((e) =>
            e == null ? null : Attribution.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..city = json['city'] == null
        ? null
        : City.fromJson(json['city'] as Map<String, dynamic>)
    ..dominentpol = json['dominentpol'] as String
    ..iaqi = json['iaqi'] == null
        ? null
        : Iaqi.fromJson(json['iaqi'] as Map<String, dynamic>)
    ..time = json['time'] == null
        ? null
        : Time.fromJson(json['time'] as Map<String, dynamic>)
    ..forecast = json['forecast'] == null
        ? null
        : Forecast.fromJson(json['forecast'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'aqi': instance.aqi,
      'idx': instance.idx,
      'attributions': instance.attributions,
      'city': instance.city,
      'dominentpol': instance.dominentpol,
      'iaqi': instance.iaqi,
      'time': instance.time,
      'forecast': instance.forecast,
    };

Attribution _$AttributionFromJson(Map<String, dynamic> json) {
  return Attribution()
    ..url = json['url'] as String
    ..name = json['name'] as String
    ..logo = json['logo'] as String;
}

Map<String, dynamic> _$AttributionToJson(Attribution instance) =>
    <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
      'logo': instance.logo,
    };

City _$CityFromJson(Map<String, dynamic> json) {
  return City()
    ..geo = (json['geo'] as List)?.map((e) => (e as num)?.toDouble())?.toList()
    ..name = json['name'] as String
    ..url = json['url'] as String;
}

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'geo': instance.geo,
      'name': instance.name,
      'url': instance.url,
    };

Co _$CoFromJson(Map<String, dynamic> json) {
  return Co()..v = (json['v'] as num)?.toDouble();
}

Map<String, dynamic> _$CoToJson(Co instance) => <String, dynamic>{
      'v': instance.v,
    };

H _$HFromJson(Map<String, dynamic> json) {
  return H()..v = (json['v'] as num)?.toDouble();
}

Map<String, dynamic> _$HToJson(H instance) => <String, dynamic>{
      'v': instance.v,
    };

No2 _$No2FromJson(Map<String, dynamic> json) {
  return No2()..v = (json['v'] as num)?.toDouble();
}

Map<String, dynamic> _$No2ToJson(No2 instance) => <String, dynamic>{
      'v': instance.v,
    };

P _$PFromJson(Map<String, dynamic> json) {
  return P()..v = (json['v'] as num)?.toDouble();
}

Map<String, dynamic> _$PToJson(P instance) => <String, dynamic>{
      'v': instance.v,
    };

Pm10 _$Pm10FromJson(Map<String, dynamic> json) {
  return Pm10()..v = json['v'] as int;
}

Map<String, dynamic> _$Pm10ToJson(Pm10 instance) => <String, dynamic>{
      'v': instance.v,
    };

Pm25 _$Pm25FromJson(Map<String, dynamic> json) {
  return Pm25()..v = json['v'] as int;
}

Map<String, dynamic> _$Pm25ToJson(Pm25 instance) => <String, dynamic>{
      'v': instance.v,
    };

T _$TFromJson(Map<String, dynamic> json) {
  return T()..v = (json['v'] as num)?.toDouble();
}

Map<String, dynamic> _$TToJson(T instance) => <String, dynamic>{
      'v': instance.v,
    };

Dew _$DewFromJson(Map<String, dynamic> json) {
  return Dew()..v = (json['v'] as num)?.toDouble();
}

Map<String, dynamic> _$DewToJson(Dew instance) => <String, dynamic>{
      'v': instance.v,
    };

O3 _$O3FromJson(Map<String, dynamic> json) {
  return O3()..v = (json['v'] as num)?.toDouble();
}

Map<String, dynamic> _$O3ToJson(O3 instance) => <String, dynamic>{
      'v': instance.v,
    };

SO2 _$SO2FromJson(Map<String, dynamic> json) {
  return SO2()..v = (json['v'] as num)?.toDouble();
}

Map<String, dynamic> _$SO2ToJson(SO2 instance) => <String, dynamic>{
      'v': instance.v,
    };

W _$WFromJson(Map<String, dynamic> json) {
  return W()..v = (json['v'] as num)?.toDouble();
}

Map<String, dynamic> _$WToJson(W instance) => <String, dynamic>{
      'v': instance.v,
    };

Iaqi _$IaqiFromJson(Map<String, dynamic> json) {
  return Iaqi()
    ..co = json['co'] == null
        ? null
        : Co.fromJson(json['co'] as Map<String, dynamic>)
    ..h =
        json['h'] == null ? null : H.fromJson(json['h'] as Map<String, dynamic>)
    ..no2 = json['no2'] == null
        ? null
        : No2.fromJson(json['no2'] as Map<String, dynamic>)
    ..p =
        json['p'] == null ? null : P.fromJson(json['p'] as Map<String, dynamic>)
    ..pm10 = json['pm10'] == null
        ? null
        : Pm10.fromJson(json['pm10'] as Map<String, dynamic>)
    ..pm25 = json['pm25'] == null
        ? null
        : Pm25.fromJson(json['pm25'] as Map<String, dynamic>)
    ..t =
        json['t'] == null ? null : T.fromJson(json['t'] as Map<String, dynamic>)
    ..dew = json['dew'] == null
        ? null
        : Dew.fromJson(json['dew'] as Map<String, dynamic>)
    ..o3 = json['o3'] == null
        ? null
        : O3.fromJson(json['o3'] as Map<String, dynamic>)
    ..so2 = json['so2'] == null
        ? null
        : SO2.fromJson(json['so2'] as Map<String, dynamic>)
    ..w = json['w'] == null
        ? null
        : W.fromJson(json['w'] as Map<String, dynamic>);
}

Map<String, dynamic> _$IaqiToJson(Iaqi instance) => <String, dynamic>{
      'co': instance.co,
      'h': instance.h,
      'no2': instance.no2,
      'p': instance.p,
      'pm10': instance.pm10,
      'pm25': instance.pm25,
      't': instance.t,
      'dew': instance.dew,
      'o3': instance.o3,
      'so2': instance.so2,
      'w': instance.w,
    };

Time _$TimeFromJson(Map<String, dynamic> json) {
  return Time()
    ..s = json['s'] as String
    ..tz = json['tz'] as String
    ..v = json['v'] as int
    ..iso = json['iso'] as String;
}

Map<String, dynamic> _$TimeToJson(Time instance) => <String, dynamic>{
      's': instance.s,
      'tz': instance.tz,
      'v': instance.v,
      'iso': instance.iso,
    };

O3Forecast _$O3ForecastFromJson(Map<String, dynamic> json) {
  return O3Forecast()
    ..avg = json['avg'] as int
    ..day = json['day'] as String
    ..max = json['max'] as int
    ..min = json['min'] as int;
}

Map<String, dynamic> _$O3ForecastToJson(O3Forecast instance) =>
    <String, dynamic>{
      'avg': instance.avg,
      'day': instance.day,
      'max': instance.max,
      'min': instance.min,
    };

Pm102 _$Pm102FromJson(Map<String, dynamic> json) {
  return Pm102()
    ..avg = json['avg'] as int
    ..day = json['day'] as String
    ..max = json['max'] as int
    ..min = json['min'] as int;
}

Map<String, dynamic> _$Pm102ToJson(Pm102 instance) => <String, dynamic>{
      'avg': instance.avg,
      'day': instance.day,
      'max': instance.max,
      'min': instance.min,
    };

Pm252 _$Pm252FromJson(Map<String, dynamic> json) {
  return Pm252()
    ..avg = json['avg'] as int
    ..day = json['day'] as String
    ..max = json['max'] as int
    ..min = json['min'] as int;
}

Map<String, dynamic> _$Pm252ToJson(Pm252 instance) => <String, dynamic>{
      'avg': instance.avg,
      'day': instance.day,
      'max': instance.max,
      'min': instance.min,
    };

Uvi _$UviFromJson(Map<String, dynamic> json) {
  return Uvi()
    ..avg = json['avg'] as int
    ..day = json['day'] as String
    ..max = json['max'] as int
    ..min = json['min'] as int;
}

Map<String, dynamic> _$UviToJson(Uvi instance) => <String, dynamic>{
      'avg': instance.avg,
      'day': instance.day,
      'max': instance.max,
      'min': instance.min,
    };

Daily _$DailyFromJson(Map<String, dynamic> json) {
  return Daily()
    ..o3 = (json['o3'] as List)
        ?.map((e) =>
            e == null ? null : O3Forecast.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..pm10 = (json['pm10'] as List)
        ?.map(
            (e) => e == null ? null : Pm102.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..pm25 = (json['pm25'] as List)
        ?.map(
            (e) => e == null ? null : Pm252.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..uvi = (json['uvi'] as List)
        ?.map((e) => e == null ? null : Uvi.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$DailyToJson(Daily instance) => <String, dynamic>{
      'o3': instance.o3,
      'pm10': instance.pm10,
      'pm25': instance.pm25,
      'uvi': instance.uvi,
    };

Forecast _$ForecastFromJson(Map<String, dynamic> json) {
  return Forecast()
    ..daily = json['daily'] == null
        ? null
        : Daily.fromJson(json['daily'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'daily': instance.daily,
    };
