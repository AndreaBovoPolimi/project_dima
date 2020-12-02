class ForecastEntity {
  int _id;
  String _address;
  double _lat;
  double _lng;

  ForecastEntity(String _address, double _lat, double _lng) {
    this._address = _address;
    this._lat = _lat;
    this._lng = _lng;
  }

  ForecastEntity.withId(this._id, this._address, this._lat, this._lng);
  int get id => _id;
  String get address => _address;
  double get lat => _lat;
  double get lng => _lng;

  set address(String newAddress) {
    if (newAddress.length <= 255) {
      _address = newAddress;
    }
  }

  set lat(double newLat) {
    _lat = newLat;
  }

  set lng(double newLng) {
    _lng = newLng;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["address"] = _address;
    map["lat"] = _lat;
    map["lng"] = _lng;
    if (_id != null) {
      map["id"] = _id;
    }
    return map;
  }

  ForecastEntity.fromObject(dynamic o) {
    this._id = o["id"];
    this._address = o["address"];
    this._lat = o["lat"];
    this._lng = o["lng"];
  }
}
