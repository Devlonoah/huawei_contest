import 'package:huawei_contest/core/error/exceptions.dart';
import 'package:huawei_contest/dao/note_dao.dart';

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
      await noteDaoImpl.addNote(note);

      return Future.value();
    } on DatabaseException {
      throw CustomDatabaseException();
    }
  }

  @override
  Future deleteEverything() async {
    try {
      await noteDaoImpl.deleteEverything();

      return Future.value();
    } on DatabaseException {
      throw CustomDatabaseException();
    }
  }

  @override
  Future deleteNote(NoteModel note) async {
    try {
      var result = await noteDaoImpl.deleteNote(note);
    } catch (e) {
      throw CustomDatabaseException();
    }
  }

  @override
  Future<List<NoteModel>>? fetchAllNote() async {
    try {
      var result = await noteDaoImpl.fetchAllNote();

      List<NoteModel>? notes =
          result?.map((e) => NoteModel.fromMap(e)).toList() ?? [];

      return notes;
    } on DatabaseException {
      throw CustomDatabaseException();
    }
  }

  @override
  Future<void> updateNote(NoteModel note) async {
    try {
      await noteDaoImpl.updateNote(note);

      return Future.value();
    } on DatabaseException {
      throw CustomDatabaseException();
    }
  }
}
