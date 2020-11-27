import 'package:good_air/sqlite/entities/search_story.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'dart:async';

class DbHelper {
  static final DbHelper _dbHelper = DbHelper._internal();
  String tblSearchStory = "todo";
  String colId = "id";
  String colAddress = "address";
  String colDate = "date";

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
    String path = p.join(databasesPath, 'good_air.db');

    var dbTodos = await openDatabase(path, version: 1, onCreate: _createDb);
    return dbTodos;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $tblSearchStory($colId INTEGER PRIMARY KEY, $colAddress TEXT UNIQUE, " +
            "$colDate DATETIME)");
  }

  Future<int> insertRecord(SearchStory todo) async {
    Database db = await this.db;
    var result = await db.insert(tblSearchStory, todo.toMap());
    return result;
  }

  Future<List> getRecords() async {
    Database db = await this.db;
    var result =
        await db.rawQuery("SELECT * FROM $tblSearchStory order by $colId DESC");
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.db;
    var result = Sqflite.firstIntValue(
        await db.rawQuery("select count (*) from $tblSearchStory"));
    return result;
  }

  Future<int> updateRecord(SearchStory todo) async {
    var db = await this.db;
    var result = await db.update(tblSearchStory, todo.toMap(),
        where: "$colId = ?", whereArgs: [todo.id]);
    return result;
  }

  Future<int> deleteRecord(int id) async {
    int result;
    var db = await this.db;
    result =
        await db.rawDelete('DELETE FROM $tblSearchStory WHERE $colId = $id');
    return result;
  }
}
