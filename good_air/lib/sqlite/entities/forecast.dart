/*
class SearchStory {
  int _id;
  String _address;
  double _lat;
  double _lng;

  SearchStory(String _address, String _date, double _lat, double _lng) {
    this._address = _address;
    this._date = _date;
  }

  SearchStory.withId(this._id, this._address, this._date);
  int get id => _id;
  String get address => _address;
  String get date => _date;

  set address(String newAddress) {
    if (newAddress.length <= 255) {
      _address = newAddress;
    }
  }

  set date(String newDate) {
    if (newDate.length <= 255) {
      _date = newDate;
    }
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["address"] = _address;
    map["date"] = _date;
    if (_id != null) {
      map["id"] = _id;
    }
    return map;
  }

  SearchStory.fromObject(dynamic o) {
    this._id = o["id"];
    this._address = o["address"];
    this._date = o["date"];
  }
}

*/
