import 'package:huawei_contest/common/note.dart';
import 'package:huawei_contest/common/table_details.dart';
import 'package:huawei_contest/database/database_provuder.dart';
import 'package:sqflite/sqflite.dart';

// abstract class NoteDao {
// //Create
//   Future<dynamic> addNote(Note note);
// //Update
//   Future<dynamic> updateNote(Note note);
// //Read
//   Future<List<Map<String, dynamic>>>? fetchAllNote();
// //Delete certain note
//   Future<dynamic> deleteNote(Note note);
// //Delete All table

//   Future<dynamic> deleteEverything();

//   Future<int?> clearDb();
// }

final todoTABLE = 'Todo';

class NoteDaoImpl {
  final DatabaseProvider dbProvider = DatabaseProvider.dbProvider;

  NoteDaoImpl();

  //@override
  Future addNote(Note note) async {
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
  Future deleteNote(Note note) async {
    var db = await dbProvider.database;

    var result = db?.delete(
      todoTABLE,
      where: 'TableDetails.id = ?',
      whereArgs: [note.id],
    );

    print(result);
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
  Future updateNote(Note note) async {
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
