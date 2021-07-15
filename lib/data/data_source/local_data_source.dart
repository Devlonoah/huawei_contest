import 'package:huawei_contest/common/note.dart';
import 'package:huawei_contest/core/error/exceptions.dart';
import 'package:huawei_contest/dao/note_dao.dart';
import 'package:huawei_contest/data/models/note_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class LocalDataSource {
  Future<dynamic> addNote(Note note);

  Future<void> updateNote(Note note);

  Future<List<NoteModel>>? fetchAllNote();

  Future<dynamic> deleteNote(Note note);

  Future<dynamic> deleteEverything();
}

class LocalDataSourceImpl implements LocalDataSource {
  final NoteDaoImpl noteDaoImpl;

  LocalDataSourceImpl(this.noteDaoImpl);

  @override
  Future<dynamic> addNote(Note note) async {
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
  Future deleteNote(Note note) async {
    try {
      var result = await noteDaoImpl.deleteNote(note);

      print(result);

      return Future.value();
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
  Future<void> updateNote(Note note) {
    try {
      var result = noteDaoImpl.updateNote(note);
      print(result);
      return Future.value();
    } on DatabaseException {
      throw CustomDatabaseException();
    }
  }
}
