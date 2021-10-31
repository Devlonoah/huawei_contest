import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../data_source/local_data_source.dart';
import '../../models/note_model.dart';

import 'package:sqflite/sqlite_api.dart';

class NoteRepository {
  final LocalDataSourceImpl localDataSource;

  NoteRepository(this.localDataSource);

  Future<Either<AppFailure, void>> addNote(NoteModel note) async {
    try {
      await localDataSource.addNote(note);

      return Right(returnVoid());
    } on DatabaseException {
      return Left(DatabaseFailure());
    }
  }

  Future<Either<AppFailure, List<NoteModel>>> fetchAllNote() async {
    try {
      List<NoteModel>? result = await localDataSource.fetchAllNote();
      return Right(result);
    } on DatabaseException {
      return left(DatabaseFailure());
    }
  }

  Future<Either<AppFailure, void>> deleteNote(note) async {
    try {
      await localDataSource.deleteNote(note);
      return Right(returnVoid());
    } on DatabaseException {
      return Left(DatabaseFailure());
    }
  }

  Future<Either<AppFailure, void>> updateNote(NoteModel note) async {
    try {
      await localDataSource.updateNote(note);

      return Right(returnVoid());
    } on DatabaseException {
      return Left(DatabaseFailure());
    }
  }

  void returnVoid() {
    return;
  }
}
