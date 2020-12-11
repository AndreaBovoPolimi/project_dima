class InfoFeedStoryEntity {
  int _id;
  double _lat;
  double _lng;
  double _co;
  double _h;
  double _no2;
  double _p;
  double _pm10;
  double _pm25;
  double _t;
  double _dew;
  double _o3;
  double _so2;
  double _w;
  int _aqi;
  int _date;

  InfoFeedStoryEntity(
      double _lat,
      double _lng,
      double _co,
      double _h,
      double _no2,
      double _p,
      double _pm10,
      double _pm25,
      double _t,
      double _dew,
      double _o3,
      double _so2,
      double _w,
      int _aqi,
      int _date) {
    this._lat = _lat;
    this._lng = _lng;
    this._co = _co;
    this._h = _h;
    this._no2 = _no2;
    this._p = _p;
    this._pm10 = _pm10;
    this._pm25 = _pm25;
    this._t = _t;
    this._dew = _dew;
    this._o3 = _o3;
    this._so2 = _so2;
    this._w = _w;
    this._aqi = _aqi;
    this._date = _date;
  }

  InfoFeedStoryEntity.withId(
      this._id,
      this._lat,
      this._lng,
      this._co,
      this._h,
      this._no2,
      this._p,
      this._pm10,
      this._pm25,
      this._t,
      this._dew,
      this._o3,
      this._so2,
      this._w,
      this._aqi,
      this._date);
  int get id => _id;
  double get lat => _lat;
  double get lng => _lng;
  double get co => _co;
  double get h => _h;
  double get no2 => _no2;
  double get p => _p;
  double get pm10 => _pm10;
  double get pm25 => _pm25;
  double get t => _t;
  double get dew => _dew;
  double get o3 => _o3;
  double get so2 => _so2;
  double get w => _w;
  int get aqi => _aqi;
  int get date => _date;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["lat"] = _lat;
    map["lng"] = _lng;
    map["co"] = _co;
    map["h"] = _h;
    map["no2"] = _no2;
    map["p"] = _p;
    map["pm10"] = _pm10;
    map["pm25"] = _pm25;
    map["t"] = _t;
    map["dew"] = _dew;
    map["o3"] = _o3;
    map["so2"] = _so2;
    map["w"] = _w;
    map["aqi"] = _aqi;
    map["date"] = _date;
    if (_id != null) {
      map["id"] = _id;
    }
    return map;
  }

  InfoFeedStoryEntity.fromObject(dynamic o) {
    this._id = o["id"];
    this._lat = o["lat"];
    this._lng = o["lng"];
    this._co = o["co"];
    this._h = o["h"];
    this._no2 = o["no2"];
    this._p = o["p"];
    this._pm10 = o["pm10"];
    this._pm25 = o["pm25"];
    this._t = o["t"];
    this._dew = o["dew"];
    this._o3 = o["o3"];
    this._so2 = o["so2"];
    this._w = o["w"];
    this._aqi = o["aqi"];
    this._date = o["date"];
  }
}
