// import 'dart:async';
// import 'dart:io';
//
// import 'package:huawei_contest/common/table_details.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
//
// ///The purpose of database.dart is to manage creating the database schema
// /// and expose the database instance Asynchronously for TodoDao to call. --Opeyemi
//
// class DatabaseProvider {
//   // static final DatabaseProvider _instance = DatabaseProvider._internal();
//   // DatabaseProvider._internal();
//   // factory DatabaseProvider() => _instance;
//   static final DatabaseProvider dbProvider = DatabaseProvider();
//
//   final int version = 1;
//   Database? _db;
//
//   // static final DatabaseProvider dbProvider = DatabaseProvider(this._database);
//
//   // DatabaseProvider(this._database);
//
//   Future<Database?> get database async {
//     if (_db != null) {
//       print('db is not null');
//       return _db;
//     } else {
//       print('trying to get database');
//       _db = await createDatabase();
//       return _db;
//     }
//   }
//
//   createDatabase() async {
//     Directory directory = await getApplicationDocumentsDirectory();
//     String path = join(directory.path, "Notes.db");
//
//     var noteDb =
//         await openDatabase(path, onCreate: await createDb(_db, version));
//     return noteDb;
//   }
//
//   FutureOr<dynamic> createDb(Database? database, int version) async {
//     print('trying to get database');
//
//     await database?.execute("""
//     CREATE TABLE $TableDetails.tableName (
//       ${TableDetails.dateCreated} TEXT,
//       ${TableDetails.id}  INTEGER PRIMARY KEY AUTOINCREMENT,
//       ${TableDetails.label} TEXT,
//       ${TableDetails.note} TEXT,
//       ${TableDetails.title} TEXT
//     );
//     """);
//   }
//
//   // final String noteTable = """
//   //   CREATE TABLE $TableDetails.tableName (
//   //     ${TableDetails.dateCreated} TEXT,
//   //     ${TableDetails.id}  INTEGER PRIMARY KEY AUTOINCREMENT,
//   //     ${TableDetails.label} TEXT,
//   //     ${TableDetails.note} TEXT,
//   //     ${TableDetails.title} TEXT
//   //   );
//   //   """;
// }
//
import 'dart:async';
import 'dart:io';

import 'package:huawei_contest/common/note.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final todoTABLE = 'Todo';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();
  Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await createDatabase();
    return _database!;
  }

  createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    //"ReactiveTodo.db is our database instance name
    String path = join(documentsDirectory.path, "note_app.db");
    var database = await openDatabase(path,
        version: 1, onCreate: initDB, onUpgrade: onUpgrade);
    return database;
  }

  //This is optional, and only used for changing DB schema migrations
  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }

  void initDB(Database database, int version) async {
    await database.execute(
        'CREATE TABLE $todoTABLE(id INTEGER PRIMARY KEY, dateCreated TEXT, label TEXT, note TEXT, title TEXT)');

    var result = await database.insert(todoTABLE, mappedNote);
    print(result);
  }

  Map<String, dynamic> mappedNote = Note(
          title: 'Title',
          id: 2,
          note: 'every is gonna be alright',
          label: 'labelling is nice',
          dateCreated: '2020-12-232')
      .toMap();
}
