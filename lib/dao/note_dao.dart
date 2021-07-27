import 'package:huawei_contest/common/table_details.dart';
import 'package:huawei_contest/database/database_provuder.dart';
import 'package:huawei_contest/models/note_model.dart';
import 'package:sqflite/sqflite.dart';

final todoTABLE = 'Todo';

class NoteDaoImpl {
  final DatabaseProvider dbProvider = DatabaseProvider.dbProvider;

  NoteDaoImpl();

  //@override
  Future addNote(NoteModel note) async {
    var db = await dbProvider.database;
    print("checking database status ${db != null}");
    var result = await db?.insert(todoTABLE, note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print(result);
  }

  //@override
  Future deleteEverything() async {
    var db = await dbProvider.database;
    var result = await db?.delete(todoTABLE);
    print(result);
  }

  //@override
  Future deleteNote(NoteModel note) async {
    var db = await dbProvider.database;

    var result = await db!.delete(
      todoTABLE,
      where: 'id = ?',
      whereArgs: [note.id],
    );

    print("Delete result is $result");
  }

  //@override
  Future<List<Map<String, dynamic>>>? fetchAllNote() async {
    var db = await dbProvider.database;
    var result = await db!.query(
      todoTABLE,
    );

    return result;
  }

  //@override
  Future updateNote(NoteModel note) async {
    var db = await dbProvider.database;
    var result = db?.update(todoTABLE, note.toMap(),
        where: '${TableDetails.id} = ?', whereArgs: [note.id]);
    print(result);
  }

  //@override
  Future<int?> clearDb() async {
    var db = await dbProvider.database;
    int? result = await db?.delete(todoTABLE);

    return result;
  }

  Future dbAsses() async {
    var db = await dbProvider.database;

    var result = await db?.query(todoTABLE);
    print('result db access --$result');
  }
}
