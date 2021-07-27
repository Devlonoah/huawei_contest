import 'package:huawei_contest/core/error/exceptions.dart';
import 'package:huawei_contest/dao/note_dao.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:sqflite/sqflite.dart';
import 'package:huawei_contest/models/note_model.dart';

abstract class LocalDataSource {
  Future<dynamic> addNote(NoteModel note);

  Future<void> updateNote(NoteModel note);

  Future<List<NoteModel>>? fetchAllNote();

  Future<dynamic> deleteNote(NoteModel note);

  Future<dynamic> deleteEverything();
}

class LocalDataSourceImpl extends LocalDataSource {
  final NoteDaoImpl noteDaoImpl;

  LocalDataSourceImpl(this.noteDaoImpl);

  @override
  Future<dynamic> addNote(NoteModel note) async {
    try {
      var result = await noteDaoImpl.addNote(note);
      print(result);
      return Future.value();
    } on DatabaseException {
      throw CustomDatabaseException();
    }
  }

  @override
  Future deleteEverything() async {
    try {
      var result = await noteDaoImpl.deleteEverything();
      print(result);
      return Future.value();
    } on DatabaseException {
      throw CustomDatabaseException();
    }
  }

  @override
  Future deleteNote(NoteModel note) async {
    try {
      var result = await noteDaoImpl.deleteNote(note);

      print(result);
    } catch (e) {
      throw CustomDatabaseException();
    }
  }

  @override
  Future<List<NoteModel>>? fetchAllNote() async {
    try {
      var result = await noteDaoImpl.fetchAllNote();
      print(result);
      List<NoteModel>? notes =
          result?.map((e) => NoteModel.fromMap(e)).toList() ?? [];

      return notes;
    } on DatabaseException {
      throw CustomDatabaseException();
    }
  }

  @override
  Future<void> updateNote(NoteModel note) {
    try {
      var result = noteDaoImpl.updateNote(note);
      print(result);
      return Future.value();
    } on DatabaseException {
      throw CustomDatabaseException();
    }
  }
}
