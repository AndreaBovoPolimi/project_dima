import 'package:good_air/sqlite/entities/forecast.dart';
import 'package:good_air/sqlite/entities/info_feed_story.dart';
import 'package:good_air/sqlite/entities/search_story.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'dart:async';

class DbHelper {
  static final DbHelper _dbHelper = DbHelper._internal();
  String tblSearchStory = "searchstory";
  String tblForecast = "forecast";
  String tblInfoFeed = "infofeedstory";
  String colId = "id";
  String colAddress = "address";
  String colDate = "date";
  String colLat = "lat";
  String colLng = "lng";

  String colCo = "co";
  String colH = "h";
  String colNo2 = "no2";
  String colP = "p";
  String colPm10 = "pm10";
  String colPm25 = "pm25";
  String colT = "t";
  String colDew = "dew";
  String colO3 = "o3";
  String colSo2 = "so2";
  String colW = "w";
  String colAqi = "aqi";

  DbHelper._internal();

  factory DbHelper() {
    return _dbHelper;
  }

  static Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async {
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, 'GoodAirDb.db');

    var dbTodos = await openDatabase(path, version: 1, onCreate: _createDb);
    return dbTodos;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $tblSearchStory($colId INTEGER PRIMARY KEY, $colAddress TEXT, " +
            "$colDate INT)");
    await db.execute(
        "CREATE TABLE $tblForecast($colId INTEGER PRIMARY KEY, $colAddress TEXT, " +
            "$colLat double, $colLng double)");
    await db.execute(
        "CREATE TABLE $tblInfoFeed($colId INTEGER PRIMARY KEY, $colDate INT, " +
            "$colLat double, $colLng double," +
            "$colCo double, $colH double," +
            "$colNo2 double, $colP double," +
            "$colPm10 double, $colPm25 double," +
            "$colT double, $colDew double," +
            "$colO3 double, $colSo2 double," +
            "$colW double, $colAqi int)");
  }

//
//  search_story
//

  Future<int> insertSearchStory(SearchStoryEntity todo) async {
    Database db = await this.db;
    var result = await db.insert(tblSearchStory, todo.toMap());
    return result;
  }

  Future<List> getSearchStory() async {
    Database db = await this.db;
    var result =
        await db.rawQuery("SELECT * FROM $tblSearchStory order by $colId DESC");
    return result;
  }

  Future<int> getCountSearchStory() async {
    Database db = await this.db;
    var result = Sqflite.firstIntValue(
        await db.rawQuery("select count (*) from $tblSearchStory"));
    return result;
  }

  Future<int> updateSearchStory(SearchStoryEntity todo) async {
    var db = await this.db;
    var result = await db.update(tblSearchStory, todo.toMap(),
        where: "$colId = ?", whereArgs: [todo.id]);
    return result;
  }

  Future<int> deleteSearchStory(int id) async {
    int result;
    var db = await this.db;
    result =
        await db.rawDelete('DELETE FROM $tblSearchStory WHERE $colId = $id');
    return result;
  }

//
//  forecast
//
  Future<int> insertForecast(ForecastEntity todo) async {
    Database db = await this.db;
    var result = await db.insert(tblForecast, todo.toMap());
    return result;
  }

  Future<List> getForecast() async {
    Database db = await this.db;
    var result =
        await db.rawQuery("SELECT * FROM $tblForecast order by $colId ASC");
    return result;
  }

  Future<int> getCountForecast() async {
    Database db = await this.db;
    var result = Sqflite.firstIntValue(
        await db.rawQuery("select count (*) from $tblForecast"));
    return result;
  }

  Future<int> updateForecast(ForecastEntity todo) async {
    var db = await this.db;
    var result = await db.update(tblForecast, todo.toMap(),
        where: "$colId = ?", whereArgs: [todo.id]);
    return result;
  }

  Future<int> deleteForecast(int id) async {
    int result;
    var db = await this.db;
    result = await db.rawDelete('DELETE FROM $tblForecast WHERE $colId = $id');
    return result;
  }

//
//  info feed story
//
  Future<int> insertInfoFeedStory(InfoFeedStoryEntity todo) async {
    Database db = await this.db;
    var result = await db.insert(tblInfoFeed, todo.toMap());
    return result;
  }

  Future<List> getInfoFeedStory() async {
    Database db = await this.db;
    var result =
        await db.rawQuery("SELECT * FROM $tblInfoFeed order by $colDate DESC");
    return result;
  }

  Future<List> getLastInfoFeedStory() async {
    Database db = await this.db;
    var result = await db
        .rawQuery("SELECT * FROM $tblInfoFeed order by $colDate DESC LIMIT 1");
    return result;
  }

  Future<int> getCountInfoFeedStory() async {
    Database db = await this.db;
    var result = Sqflite.firstIntValue(
        await db.rawQuery("select count (*) from $tblInfoFeed"));
    return result;
  }

  Future<int> updateInfoFeedStory(InfoFeedStoryEntity todo) async {
    var db = await this.db;
    var result = await db.update(tblInfoFeed, todo.toMap(),
        where: "$colId = ?", whereArgs: [todo.id]);
    return result;
  }

  Future<int> deleteInfoFeedStory(int id) async {
    int result;
    var db = await this.db;
    result = await db.rawDelete('DELETE FROM $tblInfoFeed WHERE $colId = $id');
    return result;
  }
}
