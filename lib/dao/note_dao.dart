import 'package:huawei_contest/common/note.dart';
import 'package:huawei_contest/common/table_details.dart';
import 'package:huawei_contest/database/database.dart';
import 'package:sqflite/sqflite.dart';

abstract class NoteDao {
//Create
  Future<dynamic> addNote(Note note);
//Update
  Future<dynamic> updateNote(Note note);
//Read
  Future<List<Map<String, dynamic>>>? fetchAllNote();
//Delete certain note
  Future<dynamic> deleteNote(Note note);
//Delete All table

  Future<dynamic> deleteEverything();

  Future<int?> clearDb();
}

class NoteDaoImpl implements NoteDao {
  final DatabaseProvider dbProvider = DatabaseProvider.dbProvider;

  NoteDaoImpl();

  @override
  Future addNote(Note note) async {
    var db = await dbProvider.database;
    print("checking database status ${db != null}");
    var result = await db?.insert(TableDetails.tableName, note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print(result);
  }

  @override
  Future deleteEverything() async {
    var db = await dbProvider.database;
    var result = await db?.delete(TableDetails.tableName);
    print(result);
  }

  @override
  Future deleteNote(Note note) async {
    var db = await dbProvider.database;

    var result = db?.delete(
      TableDetails.tableName,
      where: 'TableDetails.id = ?',
      whereArgs: [note.id],
    );

    print(result);
  }

  @override
  Future<List<Map<String, dynamic>>>? fetchAllNote() async {
    var db = await dbProvider.database;
    var result = await db!.query(
      TableDetails.tableName,
    );

    return result;
  }

  @override
  Future updateNote(Note note) async {
    var db = await dbProvider.database;
    var result = db?.update(TableDetails.tableName, note.toMap(),
        where: '${TableDetails.id} = ?', whereArgs: [note.id]);
    print(result);
  }

  @override
  Future<int?> clearDb() async {
    var db = await dbProvider.database;
    int? result = await db?.delete(TableDetails.tableName);

    return result;
  }

  Future dbAsses() async {
    var db = await dbProvider.database;

    var result = await db?.query('Todo');
    print('result db access --$result');
  }
}
