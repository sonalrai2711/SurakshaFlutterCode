import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

import '../Model/SafetyIndexModel.dart';

class DbHelperSafetyIndex {
  static Database? _db;

  static const String DB_Name = 'test6.db';
  static const String Table_User = 'safetyIndex';
  static const int Version = 7;

  static const String C_Area = 'area';
  static const String C_SafetyIndex = 'safetyIndex';
  static const String C_Category = 'category';

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var db = await openDatabase(path, version: Version, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return db;
  }

  _onCreate(Database db, int intVersion) async {

    await db.execute("CREATE TABLE $Table_User ("
        " $C_Area TEXT, "
        " $C_SafetyIndex TEXT, "
        " $C_Category TEXT, "
        " PRIMARY KEY ($C_Area)"
        ")");

  }
  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if(newVersion > 1) {
      await db.execute("CREATE TABLE $Table_User ("
          " $C_Area TEXT, "
          " $C_SafetyIndex TEXT, "
          " $C_Category TEXT, "
          " PRIMARY KEY ($C_Area)"
          ")");
    }
  }

  Future<int> saveData(SafetyIndexModel safetyIndex) async {
    var dbClient = await db;
    var res = await dbClient!.insert(Table_User, safetyIndex.toMap());
    return res;
  }

  Future<SafetyIndexModel?> getCategory(String area) async {
    var dbClient = await db;
    var res = await dbClient!.rawQuery("SELECT * FROM $Table_User WHERE "
        "$C_Area = '$area'");

    if (res.length > 0) {
      return SafetyIndexModel.fromMap(res.first);
    }
    return null;

  }

  Future<int> updateUser(SafetyIndexModel safetyIndexModel) async {
    var dbClient = await db;
    var res = await dbClient!.update(Table_User, safetyIndexModel.toMap(),
        where: '$C_Area = ?', whereArgs: [safetyIndexModel.area]);
    return res;
  }

  Future<int> deleteUser(String area) async {
    var dbClient = await db;
    var res = await dbClient!
        .delete(Table_User, where: '$C_Area = ?', whereArgs: [area]);
    return res;
  }
}