import 'package:dartz/dartz.dart';
import 'package:huawei_contest/common/note.dart';
import 'package:huawei_contest/core/error/failures.dart';
import 'package:huawei_contest/domain/entity/note_entity.dart';

abstract class NoteRepository {
  Future<Either<AppFailure, List<NoteEntity>>> fetchAllNote();
  Future<Either<AppFailure, void>> addNote(Note note);
  Future<Either<AppFailure, void>> updateNote(Note note);
  Future<Either<AppFailure, void>> deleteNote(Note note);
}
