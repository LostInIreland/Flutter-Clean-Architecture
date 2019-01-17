import 'dart:io';

import 'package:hacker_news/cache/db/Db.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

/// Standard DB class for configuring the Database and handling migrations during upgrades
class DbHelper {
  static const String DATABASE_NAME = "nownowwitch.db";
  static const int DATABASE_VERSION = 1;

  static final DbHelper _instance = new DbHelper.internal();
  factory DbHelper() => _instance;
  DbHelper.internal();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DATABASE_NAME);
    var db = await openDatabase(path, version: DATABASE_VERSION,
        onOpen: (db) {},
        onCreate: onCreate,
        onUpgrade: onUpgrade);
    return db;
  }

  Future<void> onCreate(Database db, int version) async{
    return await db.execute(ArticleTable.CREATE);
  }

  void onUpgrade(Database db, int oldVersion, int newVersion){

  }
}