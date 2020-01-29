import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'models.dart';

class DatabaseProvider {
  Database _database;
  static const String TABLENAME = "koca1";

  static const COLPID = "pid";
  static const COLPNAME = "pname";
  static const COLPPrice = "pprice";
  static const COLVID = 'vid';
  static const COLVNAME = 'vname';
  static const COLVCONTACT = 'vcontact';
  static const COLVEMAIL = 'vemail';

  Future<Database> get database async {
    //print('Checking Database exist or not');
    if (_database == null) {
      //print('Now needed to create Database');
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
   // print('Came to initializeDatabase ');
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'koca.db';
    // this callback onCreate will create database if it dont exist.
    //print('Got the directory path the path is :$path');
    var kocaDatabase = openDatabase(path, version: 1, onCreate: _createDB);
    return kocaDatabase;
  }

  void _createDB(Database db, int newVersion) async {
    //print('I have no database I am going to create one');
    await db.execute(
        "CREATE TABLE $TABLENAME($COLPID TEXT,$COLPNAME TEXT,$COLPPrice TEXT,$COLVID TEXT,$COLVNAME TEXT,$COLVCONTACT TEXT,$COLVEMAIL TEXT)");
  }

  Future<LocalData> getLocalData() async {
   // print('Getting database instance to fetch Data');
    Database db = await this.database;
    //print('Got Database now fetching all data in list');
    List<Map<String, dynamic>> maplist =
        await db.rawQuery('SELECT * FROM $TABLENAME');
    //print('Data collected from database now its time to transform');
    List<LocalData> list = List<LocalData>();
    list.add(LocalData.fromMapObject(maplist[0]));
   // print('I got the localdata in list form the 1st element value is ${list[0].vid}');
    LocalData localData = list[0];
    return localData;
  }

  Future<int> insertLocalData(LocalData localData) async {
    //print('Getting Database instance to insert Data');
    Database db = await this.database;
    //print('Got a Database Instance now going to insert a row');
    var result = await db.insert(TABLENAME, localData.toMap());
    //print('Row Inserted result is :$result');
    return result;
  }

  Future<void> deleteTableAndDatabase() async {
    //print('Getting dataase instance to delete');
    Database db = await this.database;
    //print('Got Database Instance to delete now processing to delete table');
    db.execute('DROP TABLE $TABLENAME');
    //print('Table Deletd successfully');
    db.close();
    //print('Database closed successfully');
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'koca.db';
    await databaseFactory.deleteDatabase(path);
    //print('Database Deleted Successfully');
  }
}
