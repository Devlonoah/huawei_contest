import 'package:dartz/dartz.dart';
import 'package:huawei_contest/common/note.dart';
import 'package:huawei_contest/core/error/failures.dart';
import 'package:huawei_contest/data/data_source/local_data_source.dart';
import 'package:huawei_contest/domain/entity/note_entity.dart';
import 'package:huawei_contest/domain/repositories/note_repository.dart';
import 'package:sqflite/sqlite_api.dart';

class NoteRepositoryImpl extends NoteRepository {
  final LocalDataSourceImpl localDataSource;

  NoteRepositoryImpl(this.localDataSource);

  @override
  Future<Either<AppFailure, void>> addNote(Note note) async {
    try {
      await localDataSource.addNote(note);

      return Right(returnVoid());
    } on DatabaseException {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<AppFailure, List<NoteEntity>>> fetchAllNote() async {
    try {
      var result = await localDataSource.fetchAllNote();
      return Right(result);
    } on DatabaseException {
      return left(DatabaseFailure());
    }
  }

  @override
  Future<Either<AppFailure, void>> deleteNote(note) async {
    try {
      await localDataSource.deleteNote(note);
      return Right(returnVoid());
    } on DatabaseException {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<AppFailure, void>> updateNote(Note note) async {
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
