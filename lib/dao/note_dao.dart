import '../common/table_details.dart';
import '../database/database_provuder.dart';
import '../models/note_model.dart';
import 'package:sqflite/sqflite.dart';

final todoTABLE = 'Todo';

class NoteDaoImpl {
  final DatabaseProvider dbProvider = DatabaseProvider.dbProvider;

  NoteDaoImpl();

  Future addNote(NoteModel note) async {
    var db = await dbProvider.database;

    await db?.insert(todoTABLE, note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future deleteEverything() async {
    var db = await dbProvider.database;
    await db?.delete(todoTABLE);
  }

  Future deleteNote(NoteModel note) async {
    var db = await dbProvider.database;

    await db!.delete(
      todoTABLE,
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<List<Map<String, dynamic>>>? fetchAllNote() async {
    var db = await dbProvider.database;
    var result = await db!.query(
      todoTABLE,
    );

    return result;
  }

  Future updateNote(NoteModel note) async {
    var db = await dbProvider.database;
    db?.update(todoTABLE, note.toMap(),
        where: '${TableDetails.id} = ?', whereArgs: [note.id]);
  }

  Future<int?> clearDb() async {
    var db = await dbProvider.database;
    int? result = await db?.delete(todoTABLE);

    return result;
  }

  Future dbAsses() async {
    var db = await dbProvider.database;

    db?.query(todoTABLE);
  }
}
