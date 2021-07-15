import 'package:dartz/dartz.dart';
import 'package:huawei_contest/common/base_usecases.dart';
import 'package:huawei_contest/common/note.dart';
import 'package:huawei_contest/core/error/failures.dart';
import 'package:huawei_contest/data/models/note_model.dart';
import 'package:huawei_contest/domain/repositories/note_repository.dart';

class AddNoteUsecase extends UseCase<void, Note> {
  final NoteRepository repository;

  AddNoteUsecase(this.repository);

  @override
  Future<Either<AppFailure, void>> call(Note note) {
    return repository.addNote(note);
  }
}
