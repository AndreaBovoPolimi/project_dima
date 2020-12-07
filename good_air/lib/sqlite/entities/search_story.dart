class SearchStoryEntity {
  int _id;
  String _address;
  int _date;

  SearchStoryEntity(String _address, int _date) {
    this._address = _address;
    this._date = _date;
  }

  SearchStoryEntity.withId(this._id, this._address, this._date);
  int get id => _id;
  String get address => _address;
  int get date => _date;

  set address(String newAddress) {
    if (newAddress.length <= 255) {
      _address = newAddress;
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

  SearchStoryEntity.fromObject(dynamic o) {
    this._id = o["id"];
    this._address = o["address"];
    this._date = o["date"];
  }
}
